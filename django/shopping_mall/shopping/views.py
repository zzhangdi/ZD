from django.shortcuts import render,redirect
from django.core.exceptions import ObjectDoesNotExist,MultipleObjectsReturned
from django.http import HttpResponse,JsonResponse
from django.contrib.auth.forms import AuthenticationForm
from .forms import RegisterForm
from django.contrib.auth import login as auth_login,logout as auth_logout
#导入auth中的login(登录)和logout(退出)并取别名
from .models import Goods_type,Goods,Addr,User,Banner,Shop_cart,Pay_type,Order,Order_goods
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
import json,time,pymysql,os
from whoosh.filedb.filestore import FileStorage
from whoosh.fields import *
from jieba.analyse import ChineseAnalyzer
from whoosh.qparser import QueryParser

def create_index(request):
    analyzer = ChineseAnalyzer()
    schema = Schema(
        ids = TEXT(stored=True,analyzer=analyzer),
        name = TEXT(stored=True,analyzer=analyzer)
    )
    file_storage = FileStorage('D:/Chihuo/shopping_mall/index')
    if not os.path.exists('D:/Chihuo/shopping_mall/index'):
        os.mkdir('D:/Chihuo/shopping_mall/index')
        ix = file_storage.create_index(schema)
    else:
        ix = file_storage.open_index()
    writer = ix.writer()
    for goods in Goods.objects.all():
        writer.add_document(ids=str(goods.id),name=goods.name)
        print(goods.name)
    writer.commit()
    return HttpResponse('创建完成')

 #搜索查询
def search(request):
    keywords = request.GET.get('p')
    file_storage = FileStorage('D:/Chihuo/shopping_mall/index')
    ix = file_storage.open_index()
    with ix.searcher() as searcher:
        query = QueryParser('name',ix.schema).parse(keywords)
        results = searcher.search(query,limit=None)
        lis=[]
        for res in results:
            # print(res)
            lis.append(int(res.get('ids')))
    if request.user.is_authenticated:
        user1 = User.objects.get(username=request.user)
        num = Shop_cart.objects.filter(user_id=user1.id).count()
    else:
        num = 0
    tj = Goods.objects.filter(tj = 1).all()
    page1=Goods.objects.filter(id__in=lis)
    if page1:
        page=page1
    else:
        page = Goods.objects.filter(name__contains=keywords)
        #print(page)
    context={
        'page':page,
        'tj':tj,
        'num':num
    }
    return render(request,'list1.html',context)


#登录
def login(request):
    if request.method == 'POST':
        form = AuthenticationForm(request=request,data=request.POST)
        if form.is_valid():
            user = form.get_user() # 获取当前登录的用户对象
            auth_login(request,user=user)
            return redirect(request.POST.get('next','homepage'))
    else:
        form = AuthenticationForm()
    context = {
        'form':form,
        'next':request.GET.get('next','homepage')
    }
    return render(request, 'login.html', context)

#首页
def homepage(request):
    if request.user.is_authenticated:
        user = request.user
        user1 = User.objects.get(username=user)
        num = Shop_cart.objects.filter(user_id=user1.id).count()
    else:
        num = 0
    # request.session['num'] = num
    banner = Banner.objects.filter(title=1,status=1).all()
    jingtai = Banner.objects.filter(title=0,status=1).all()
    fenlei = Goods_type.objects.all()
    goods = Goods.objects.filter(zyxs=1).all()
    context = {
        'banner':banner,
        'jingtai':jingtai,
        'fenlei':fenlei,
        'num':num,
        'goods':goods
    }
    return render(request,'homepage.html',context)

#退出
def logout(request):
    auth_logout(request)
    return redirect('homepage')

#注册
def register(request):
    if request.method == 'POST':
        form = RegisterForm(data=request.POST)
        email = request.POST.get('email')
        if form.is_valid():
            a=form.save()
            b=User.objects.filter(username=a).update(email=email)
            return redirect('login')
    else:
        form = RegisterForm()
    # print(form.errors)
    context = {
        'form':form
    }
    return render(request, 'register.html', context)

#用户信息
@login_required
def user_center_info(request):
    user = request.user
    user1 = User.objects.get(username=user)
    return render(request,'user_center_info.html',{'user1':user1})

#购物车
@login_required
def cart(request):#gwc:购物车
    user_id = User.objects.get(username=request.user).id #获取当前登录用户的id
    gwc = Shop_cart.objects.filter(user_id=user_id).all() #获取当前用户的购物车
    if request.user.is_authenticated:
        user = request.user
        user1 = User.objects.get(username=user)
        num = Shop_cart.objects.filter(user_id=user1.id).count()
    else:
        num = 0
    context = {
        'gwc':gwc,
        'num':num
    }
    return render(request,'cart.html',context)

#商品详情
def detail(request,a):
    if request.user.is_authenticated:
        user = request.user
        user1 = User.objects.get(username=user)
        num = Shop_cart.objects.filter(user_id=user1.id).count()
    else:
        num = 0
    tj = Goods.objects.filter(tj = 1).all() #tj:推荐商品
    xq = Goods.objects.get(id=a) #xq:详情
    fl = Goods_type.objects.get(id=xq.goods_id)#fl:分类
    context = {
        'xq': xq,
        'tj': tj,
        'fl':fl,
        'num':num
    }
    return render(request,'detail.html',context)

#商品分类
def list(request,a,b=1):
    if request.user.is_authenticated:
        user1 = User.objects.get(username=request.user)
        num = Shop_cart.objects.filter(user_id=user1.id).count()
    else:
        num = 0
    # num = request.session.get('num')
    tj = Goods.objects.filter(tj = 1).all() #tj:推荐商品
    quanbu = Goods.objects.filter(goods_id=a).all()
    fl = Goods_type.objects.get(id=a) #fl:分类
    paginator = Paginator(quanbu,4)
    page = paginator.get_page(b)
    b=b
    context = {
        'tj': tj,
        'fl':fl,
        'page':page,
        'num':num,'b':b
    }
    return render(request,'list.html',context)

#添加地址
def user_center_site(request):
    name = request.user
    user = User.objects.get(username=name)
    if request.method == 'POST':
        name = request.POST.get('name')
        site = request.POST.get('site')
        zip_code = request.POST.get('Zip_Code')
        tel = request.POST.get('tel')
        if name and site and zip_code and tel:
            goods = Addr.objects.create(name=name, site=site, Zip_Code=zip_code, tel=tel,user_id=user.id)
            if goods:
                res = {"aaa":"添加成功"}
            else:
                res = {"aaa":"添加失败"}
            return JsonResponse(res)
        else:
            res = {"aaa":"数据不能为空！"}
            return JsonResponse(res)

    else:
        addr = Addr.objects.filter(user_id=user.id).all()
        context = {
            'addr': addr
        }
        return render(request,'user_center_site.html',context)

#购物车添加数据
@login_required
def shop(request):
    user_id = User.objects.get(username=request.user).id
    id1 = request.GET.get('id1')
    num1 = request.GET.get('num')
    cart1 = Shop_cart.objects.filter(goods1_id=id1,user_id=user_id).all()
    if cart1:
        num3 = Shop_cart.objects.get(goods1_id=id1,user_id=user_id).count  #获取物品已有数量
        num2 = num3 + int(num1)
        shop_gx = Shop_cart.objects.filter(user_id=user_id,goods1_id=id1).update(count=num2)
    else:
        shop = Shop_cart.objects.create(goods1_id=id1,user_id=user_id,count=num1)
    res = {'b':'成功'}
    return JsonResponse(res)

#立即购买
@login_required
def goumai(request):
    user_id = User.objects.get(username=request.user).id
    id1 = request.GET.get('ids')
    id1 = json.loads(id1)
    num1 = request.GET.get('num')           #ljgm:立即购买
    num1 = json.loads(num1)
    user_id = User.objects.get(username=request.user).id  # 获取当前登录用户的id
    itme_id = str(int(time.time() * 100)) + str(int(time.clock() * 100))
    order = Order.objects.create(user_id=user_id, itmes=itme_id, order_status=0, status=0)
    itme = Order.objects.get(itmes=itme_id)
    price = Goods.objects.get(id=id1[0]).price
    order_goods = Order_goods.objects.create(itme_id_id=itme.id, goods_id=id1[0], num1=num1[0])
    addr = Addr.objects.filter(user_id=user_id).all()
    pay = Pay_type.objects.filter(status=1).all()
    wdd = Order_goods.objects.filter(itme_id_id=itme.id).all()
    context = {
        'addr':addr,
        'pay':pay,
        'wdd':wdd
    }
    return render(request, 'place_order.html', context)
    # if shop:
    #     return render(request,'place_order.html',context)
    # else:
    #     res = {'b':'连接失败'}
    #     return JsonResponse(res)

#增减购物车商品数量
def gai(request):
    goodsid = request.GET.get('goodsid')
    count = request.GET.get('count')
    user_id = User.objects.get(username=request.user).id
    gai = Shop_cart.objects.filter(user_id=user_id,goods1_id=goodsid).update(count=count)
    if gai:
        res = {'a':'成功'}
    else:
        res = {'a':'修改失败'}
    return JsonResponse(res)

#删除购物车的商品
def dell(request,q):
    shop_id = Shop_cart.objects.get(id=q).delete()
    return redirect('cart')

#购物车  wdd:未付款订单
def place_order(request):
    id=request.GET.get('id')
    id1= json.loads(id)
    user_id = User.objects.get(username=request.user).id  # 获取当前登录用户的id
    itme_id = str(int(time.time() * 100)) + str(int(time.clock() * 100))
    order = Order.objects.create(user_id=user_id, itmes=itme_id,order_status=0,status=0)
    itme = Order.objects.get(itmes=itme_id)
    for i in id1:
        num = Shop_cart.objects.get(user_id=user_id, goods1_id=i).count
        price = Goods.objects.get(id=i).price
        order_goods = Order_goods.objects.create(itme_id_id=itme.id, goods_id=i, num1=num)
        if order and order_goods:
            shop_gx = Shop_cart.objects.filter(goods1_id=i).delete()
    addr = Addr.objects.filter(user_id=user_id).all()
    pay = Pay_type.objects.filter(status=1).all()
    wdd = Order_goods.objects.filter(itme_id_id=itme.id).all()
    context = {
        'addr': addr,
        'pay':pay,
        'wdd':wdd
    }
    return render(request,'place_order.html',context)

#未付款订单去付款
def qfk(request):
    id = request.GET.get('id')
    id1 = json.loads(id)
    user_id = User.objects.get(username=request.user).id
    addr = Addr.objects.filter(user_id=user_id).all()
    pay = Pay_type.objects.filter(status=1).all()
    wdd = Order_goods.objects.filter(itme_id=id1[0]).all()
    context = {
        'addr': addr,
        'pay': pay,
        'wdd': wdd
    }
    return render(request, 'place_order.html', context)

#添加到订单
def add1(request):
    id = request.GET.get('ids')
    id2 = json.loads(id)
    user_id = User.objects.get(username=request.user).id
    yfk = Order.objects.filter(id=id2[0]).update(order_status=1,status=1)
    if yfk:
        res = {'a':'订单提交成功！'}
    else:
        res = {'a':'订单提交失败！'}
    return JsonResponse(res)

#全部订单
@login_required
def user_center_order(request):
    user_id = User.objects.get(username=request.user).id
    dd = Order.objects.filter(user=user_id).all()  #用户全部订单
    context = {
        'dd':dd
    }
    return render(request,'user_center_order.html',context)




# #购物车
# def place_order(request):
#     id=request.GET.get('id')
#     id1= json.loads(id)
#     user = User.objects.get(username=request.user)
#     addr = Addr.objects.filter(user_id=user.id).all()
#     pay = Pay_type.objects.filter(status=1).all()
#     user_id = User.objects.get(username=request.user).id  # 获取当前登录用户的id
#     gwc = Shop_cart.objects.filter(user_id=user_id,goods1_id__in=id1).all() #gwc:购物车
#     context = {
#         'addr': addr,
#         'pay':pay,
#         'gwc':gwc
#     }
#     return render(request,'place_order.html',context)

#直接购买添加到订单
def add(request):
    id = request.GET.get('ids')
    id2 = json.loads(id)
    n = len(id2)
    user_id = User.objects.get(username=request.user).id
    itme_id = str(int(time.time() * 100)) + str(int(time.clock() * 100))
    order = Order.objects.create(user_id=user_id, itmes=itme_id)
    itme = Order.objects.get(itmes=itme_id)
    n1 = 0
    for i in id2:

        num = Shop_cart.objects.get(user_id=user_id,goods1_id=i).count
        price = Goods.objects.get(id=i).price
        order_goods = Order_goods.objects.create(itme_id_id=itme.id,goods_id=i,num1=num,total1=price)
        if order and order_goods:
            shop_gx = Shop_cart.objects.filter(goods1_id=i).delete()
            n1 +=1
    if n1 == n:
        res = {'a':'订单提交成功！'}
    else:
        res = {'a':'订单提交失败！'}
    return JsonResponse(res)