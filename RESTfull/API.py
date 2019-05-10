from flask import Flask,jsonify
from flask_restful import reqparse,abort,Api,Resource
from hashlib import md5
import re,pymysql
from msql import Mysqllink,Query_rules
import time

app = Flask(__name__)
api = Api(app)

def checkToken(func):
    def handle_args(*args,**kwargs):
        if kwargs['token']!=md5(b'333').hexdigest():
            abort(4001,message="请输入正确的token")
        else:
            return func(*args,**kwargs) #函数调用
    return handle_args
parser = reqparse.RequestParser()
parser.add_argument('name')
parser.add_argument('phone')
parser.add_argument('pwd')
parser.add_argument('user_id')
parser.add_argument('des')   #地址
parser.add_argument('is_default')  #是否启用此地址
parser.add_argument('id')
parser.add_argument('pid')
parser.add_argument('price')
parser.add_argument('img')
parser.add_argument('origin')
parser.add_argument('unit')
parser.add_argument('sales')
parser.add_argument('des')
parser.add_argument('class_id')
parser.add_argument('admin_user_id')
parser.add_argument('is_super')
parser.add_argument('post_id')
parser.add_argument('status')
parser.add_argument('order_id')



#用户注册
# post/api/users
class Users(Resource):
    @checkToken
    def post(self,token):
        args = parser.parse_args()
        result={}
        #去除arg['pwd']两边的空格
        pwd=args['pwd'].strip()
        print(pwd)
        if args['name']=="":
            result['code']=4010
            result['message']="用户名不能为空！"
            return jsonify(result)
        elif args['phone']=="":
            result['code']=4011
            result['message']="电话号码不能为空！"
            return jsonify(result)
        #用正则判断电话号码是否符合规定
        elif re.match(r'^1[345789]\d{9}$',args['phone']) is None:
            result['code']=4020
            result['message']="此号码不存在！"
            return jsonify(result)
        elif pwd=="":
            result['code']=4012
            result['message']="密码不能为空！"
            return jsonify(result)
        elif len(pwd)<6 or len(pwd)>16:
            result['code']=4021
            result['message']="密码必须在6~16位之间！"
            return jsonify(result)

        mq = Mysqllink()
        #查看phone是否已经被注册过

        sql = 'select phone from users where phone=%s'
        valu = args['phone']
        n = mq.select(sql,valu)
        if n:
            result['code'] = 4022
            result['message'] = "此号码已注册！"
            return jsonify(result)
        else:
            now_time =time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
            # sql='insert into users value (null,%s,%s,%s,%s)'
            sql='insert into users(name,phone,pwd,create_at) values (%s,%s,%s,%s)'
            valu=(args['name'],args['phone'],args['pwd'],now_time)
            #使用insert()向mysql添加数据
            # mq.cursor.execute(sql,valu)
            mq.insert(sql,valu)
            #查询新增id：
            ID = mq.cursor.lastrowid
            result['code']=200
            result['data']={'user':{'id':ID,'name':args['name'],'phone':args['phone'],'pwd':args['pwd'],'create_at':now_time}}
            return jsonify(result)

    @checkToken
    #获取用户列表
    #get/api/users
    def get(self,token):
        args = parser.parse_args()
        result = {}
        admin_id=args['id'].strip()
        if admin_id=="":
            result['code']=4002
            result['message']="无此权限！"
            return jsonify(result)
        mq=Mysqllink()

        sql = 'select * from users'
        mq.select(sql)
        user_all=mq.cursor.fetchall()
        user=[]
        for i in user_all:
            dic={}
            dic.update({'id':i['id'],'name':i['name'],'phone':i['phone'],'pwd':i['pwd'],'create_at':i['create_at']})
            user.append(dic)
        result['code']=200
        result['data']={'users':user}
        return jsonify(result)

#登录
#post/api/user_login/{param}
class User_login(Resource):
    @checkToken
    def post(self,token):
        args = parser.parse_args()
        result = {}
        #去除phone和pwd两边的空格
        phone = args['phone'].strip()
        pwd = args['pwd'].strip()
        if phone=="":
            result['code']=4011
            result['message']="电话号码不能为空！"
            return jsonify(result)
        elif pwd=="":
            result['code'] = 4012
            result['message'] = "密码不能为空！"
            return jsonify(result)
        elif re.match(r'^1[345789]\d{9}$',args['phone']) is None:
            result['code']=4020
            result['message']="此号码不存在！"
            return jsonify(result)
        mq = Mysqllink()
        sql = 'select pwd from users where phone=%s'
        n = mq.select(sql,phone)
        passwd=mq.cursor.fetchall()[0]['pwd']

        if n:
            if pwd==passwd:
                result['code']=200
                result['data']="登陆成功！"
                return jsonify(result)
            else:
                result['code']=4023
                result['message']="密码错误！"
                return jsonify(result)
        else:
            result['code']=4024
            result['message']="此号码未注册！"
            return jsonify(result)

#地址
class Addr(Resource):
    @checkToken
    # ⽤户地址添加
    # POST/api/addr
    def post(self,token):
        args=parser.parse_args()
        result={}
        des = eval(args['des'])   #eval()字符串转字典
        name = args['name'].strip()
        phone = args['phone'].strip()
        user_id = args['user_id'].strip()
        province = des['province'].strip()
        city = des['city'].strip()
        area = des['area'].strip()
        detail = des['detail'].strip()
        is_default=args['is_default'].strip()
        print(des)

        if user_id=="":
            result['code']=4025
            result['message']="未登录！"
            return jsonify(result)
        elif province=="" or city=="" or area=="" or detail=="" or phone=="" or name=="":
            result['code']=4026
            result['message']="地址信息不完善！"
            return jsonify(result)
        elif re.match(r'^1[345789]\d{9}$',phone) is None:
            result['code']=4020
            result['message']="此号码不存在！"
            return jsonify(result)

        mq=Mysqllink()
        valu=(user_id,name,phone,province,city,area,detail)
        sql = 'select * from addrs where user_id=%s and name=%s and phone=%s and province=%s and ' \
              'city=%s and area=%s and detail=%s'
        n1 = mq.select(sql,valu)
        now_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        if n1:
            result['code']=4027
            result['message']="此地址已存在！"
            return jsonify(result)
        else:
            tab='insert into addrs values (null,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
            valu=(name,phone,user_id,province,city,area,detail,is_default,now_time,now_time)
            n = mq.insert(tab,valu)
            ID = mq.cursor.lastrowid
            if n:
                result['code']=200
                result['data']={'id':ID,'user_id':user_id,'phone':phone,'name':name,
                                'des':{'province':province,'city':city,'area':area,'detail':detail},
                                'is_deafult':is_default}
                return jsonify(result)
            else:
                result['code']=4028
                result['message']="地址添加失败！"
                return jsonify(result)


    # ⽤户地址查看
    # get/api/addr
    @checkToken
    def get(self,token):
        args = parser.parse_args()
        result = {}
        user_id = args['user_id'].strip()
        if user_id=="":
            result['code']=4025
            result['message']="未登录！"
            return jsonify(result)
        mq=Mysqllink()
        sql = 'select * from addrs where user_id=%s'
        n=mq.select(sql,user_id)
        if n<1:
            result['code']=4029
            result['message']="你还没有添加地址！"
            return jsonify(result)
        else:
            addrs=mq.cursor.fetchall()
            addr_all=[]
            for i in addrs:
                addr={}
                addr.update({'id':i['id'],'user_id':i['user_id'],'phone':i['phone'],'name':i['name'],
                             'des':{'province':i['province'],'city':i['city'],'area':i['area'],'detail':i['detail']},
                             'create_at':i['create_at'],'update_at':i['update_at']})
                addr_all.append(addr)
            result['code'] = 200
            result['data'] = {'user_id': user_id,'addrs':addr_all}
            return jsonify(result)

    @checkToken
    # ⽤户地址修改
    # put/api/addr
    def put(self, token):
        args = parser.parse_args()
        result = {}
        user_id = args['user_id'].strip()
        name = args['name'].strip()
        id = args['id'].strip()
        phone = args['phone'].strip()
        des = eval(args['des'])
        province = des['province'].strip()
        city = des['city'].strip()
        area = des['area'].strip()
        detail = des['detail'].strip()
        is_default = args['is_default'].strip()

        if user_id=="":
            result['code']=4025
            result['message']="未登录！"
            return jsonify(result)
        elif city=="" or area=="" or detail=="" or name=="" or phone=="":
            result['code']=4026
            result['message']="地址信息不完善！"
            return jsonify(result)
        elif re.match(r'^1[345789]\d{9}$',phone) is None:
            result['code']=4020
            result['message']="此号码不存在！"
            return jsonify(result)
        mq = Mysqllink()
        now_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        sql='update addrs set name=%s,phone=%s,province=%s,city=%s,area=%s,detail=%s,is_default=%s,update_at=%s where id=%s'
        valu = (name,phone,province,city,area,detail,is_default,now_time,id)
        n = mq.update(sql,valu)
        if n:
            result['code']=200
            result['data']={'id':id,'user_id':user_id,'phone':phone,'name':name,'des':{'province':province,
                            'city':city,'area':area,'detail':detail},'is_default':is_default}
            return jsonify(result)
        else:
            result['code']=430
            result['message']="修改失败！"
            return jsonify(result)

#商品分类
class Classes(Resource):

    #添加商品分类
    #POST/classes
    @checkToken
    def post(self,token):
        args=parser.parse_args()
        result={}
        name=args['name']
        pid=args['pid']
        if name=="":
            result['code']= 4031
            result['message']="分类名不能为空！"
            return jsonify(result)
        mq=Mysqllink()
        sql = 'select * from classes where name=%s'
        n = mq.select(sql,name)
        if n:
            result['code']=4027
            result['message']="此分类已存在！"
            return jsonify(result)
        now_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        tab='insert into classes(name,create_at,update_at,pid) values (%s,%s,%s,%s)'
        valu=(name,now_time,now_time,pid)
        n1 = mq.insert(tab,valu)
        ID = mq.cursor.lastrowid
        if n1:
            result['code']=200
            result['message']={'id':ID,'name':name}
            return jsonify(result)
        else:
            result['dode']=4028
            result['message']="添加失败！"
            return jsonify(result)

    #获取商品分类
    #GET/classes
    def get(self,token):
        result={}
        mq=Mysqllink()
        sql='select * from classes'
        mq.select(sql)
        classess=mq.cursor.fetchall()
        message=[]
        for i in classess:
            dic={}
            dic.update({'id':i['id'],'name':i['name'],'create_at':i['create_at'],'update_at':i['update_at']})
            message.append(dic)
        result['code']=200
        result['data']={'classes':message}
        return jsonify(result)

#商品
class Goods(Resource):
    #添加商品
    #POST/goods
    @checkToken
    def post(self,token):
        args=parser.parse_args()
        result={}
        admin = args['admin_user_id']
        if args['name']=="" or args['price']=="" or args['img']=="" or args['origin']=="" or \
            args['unit']=="" or args['sales']=="" or args['des']=="" or args['class_id']=="":
            result['code']=4033
            result['message']="数据不完善！"
            return jsonify(result)
        qr=Query_rules()
        sql = 'select post_id from admin_users where id=%s'
        qr.select(sql, admin)
        au_post_id = qr.cursor.fetchall()[0]['post_id']
        qr.query_rule(au_post_id)
        admin_rules=qr.cursor.fetchall()
        rules=[]
        for i in admin_rules:
            rules.append(i['name'])
        if 'add_goods' not in rules:
            result['code']=4002
            result['code']="无此权限！"
            return jsonify(result)
        mq=Mysqllink()
        sql = 'select * from goods where name=%s and price=%s and img=%s and origin=%s and unit=%s and sales=%s and des=%s and class_id=%s'
        valu= (args['name'],args['price'],args['img'],args['origin'],args['unit'],args['sales'],args['des'],args['class_id'])
        n1 = mq.select(sql,valu)
        if n1:
            result['code']=4033
            result['code']="此商品已存在！"
            return jsonify(result)
        now_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        sql='insert into goods values (null,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
        valu=[args['name'],args['img'],args['unit'],args['price'],args['sales'],args['des'],args['origin'],
              now_time,now_time,args['class_id']]
        n2 = mq.insert(sql,valu)
        if n2:
            ID = mq.cursor.lastrowid
            result['code']=200
            result['data']={'id':ID,'name':args['name'],'price':args['price'],'img':args['img'],
                            'origin':args['origin'],'unit':args['unit'],'sales':args['sales'],
                            'des':args['des'],'class_id':args['class_id'],'create_at':now_time}
            return jsonify(result)
        else:
            result['code']=4028
            result['message']="添加失败！"
            return jsonify(result)

    #PUT/goods 修改商品
    @checkToken
    def put(self,token):
        args = parser.parse_args()
        result = {}
        admin = args['admin_user_id']
        # print(admin)
        if args['name'] == "" or args['price'] == "" or args['img'] == "" or args['origin'] == "" or \
                args['unit'] == "" or args['sales'] == "" or args['des'] == "" or args['class_id'] == "":
            result['code'] = 4033
            result['message'] = "数据不完善！"
            return jsonify(result)
        qr = Query_rules()
        sql='select post_id from admin_users where id=%s'
        qr.select(sql,admin)
        au_post_id=qr.cursor.fetchall()[0]['post_id']
        qr.query_rule(au_post_id)
        admin_rules = qr.cursor.fetchall()
        rules = []
        for i in admin_rules:
            rules.append(i['name'])
        if 'update_goods' not in rules:
            result['code'] = 4002
            result['code'] = "无此权限！"
            return jsonify(result)
        mq = Mysqllink()
        now_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        sql = 'update goods set name=%s,img=%s,unit=%s,price=%s,sales=%s,des=%s,origin=%s,update_at=%s,class_id=%s where id=%s'
        valu = (args['name'],args['img'],args['unit'],args['price'],args['sales'],args['des'],args['origin'],
                now_time,args['class_id'],args['id'])
        n = mq.update(sql,valu)
        if n:
            sql='select create_at from goods where id=%s'
            mq.select(sql,args['id'])
            create_at=mq.cursor.fetchall()
            result['code'] = 200
            result['data'] = {'id': args['id'], 'name': args['name'], 'price': args['price'], 'img': args['img'],
                              'origin':args['origin'],'unit':args['unit'],'sales':args['sales'],'des':args['des'],
                              'class_id':args['class_id'],'create_at':create_at,'update_at':now_time}
            return jsonify(result)
        else:
            result['code'] = 4028
            result['message'] = "更新失败！"
            return jsonify(result)

    #GET/goods  获取商品
    @checkToken
    def get(self,token):
        result = {}
        mq = Mysqllink()
        sql='select * from goods'
        mq.select(sql)
        goodss = mq.cursor.fetchall()
        message = []
        for i in goodss:
            dic={}
            price=str(i['price'])
            dic.update({'id': i['id'], 'name': i['name'], 'price': price, 'img': i['img'],'unit':i['unit'],
                        'sales':i['sales'],'des':i['des'],'origin':i['origin'],'class_id':i['class_id'],
                        'create_id':i['create_at'],'update_at':i['update_at']})
            message.append(dic)
        result['code'] = 200
        result['data'] = {'goods': message}
        return jsonify(result)

#管理员
class Admin_users(Resource):
    # POST/admin_users/ 添加管理员用户
    @checkToken
    def post(self,token):
        args = parser.parse_args()
        result = {}
        pwd = args['pwd'].strip()
        print(pwd)
        if args['name'] == "":
            result['code'] = 4010
            result['message'] = "用户名不能为空！"
            return jsonify(result)
        elif args['phone'] == "":
            result['code'] = 4011
            result['message'] = "电话号码不能为空！"
            return jsonify(result)
        elif re.match(r'^1[345789]\d{9}$', args['phone']) is None:
            result['code'] = 4020
            result['message'] = "此号码不存在！"
            return jsonify(result)
        elif pwd == "":
            result['code'] = 4012
            result['message'] = "密码不能为空！"
            return jsonify(result)
        elif len(pwd) < 6 or len(pwd) > 16:
            result['code'] = 4021
            result['message'] = "密码必须在6~16位之间！"
            return jsonify(result)
        mq = Mysqllink()
        sql = 'select phone from admin_users where phone=%s'
        valu = args['phone']
        n = mq.select(sql, valu)
        if n:
            result['code'] = 4022
            result['message'] = "此号码已注册！"
            return jsonify(result)
        now_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        sql = 'insert into admin_users(name,phone,pwd,des,create_at,update_at,post_id,is_super) ' \
              'values (%s,%s,%s,%s,%s,%s,%s,%s)'
        valu = (args['name'],args['phone'],args['pwd'],args['des'],now_time,now_time,args['post_id'],args['is_super'])
        mq.insert(sql, valu)
        ID = mq.cursor.lastrowid
        result['code'] = 200
        result['data'] = {'admin_user': {'id':ID,'name':args['name'],'phone':args['phone'],'des':args['des'],
                                         'create_at':now_time,'update_at':now_time}}
        return jsonify(result)

    # GET/admin_users/ 获取管理员用户列表
    @checkToken
    def get(self,token):
        args = parser.parse_args()
        result = {}
        admin_user_id=args['admin_user_id']
        mq = Mysqllink()
        #查看此管理员是不是超级管理员
        sql='select is_super from admin_users where id=%s'
        mq.select(sql,admin_user_id)
        super=mq.cursor.fetchall()[0]
        is_super=super['is_super']
        if is_super !=1:
            result['code']=4002
            result['message']="无此权限！"
            return jsonify(result)
        #查看此管理员的所有信息
        sql='select * from admin_users'
        mq.select(sql)
        admin_lis=mq.cursor.fetchall()
        data=[]
        for i in admin_lis:
            dic={}
            dic.update({'id':i['id'],'name':i['name'],'phone':i['phone'],'des':i['des'],'pwd':i['pwd'],
                        'is_super':i['is_super'],'create_at':i['create_at'],'update_at':i['update_at']})
            data.append(dic)
        result['code']=200
        result['data']={'admin_users':data}
        return jsonify(result)

    # PUT/admin_users/  更新管理员⽤户信息
    @checkToken
    def put(self,token):
        args = parser.parse_args()
        result = {}
        admin_user_id = args['admin_user_id']
        if args['name']=="" or args['phone']=="" or args['pwd']=="" or args['des']=="" or args['post_id'] =="" \
            or args['is_super']=="":
            result=4026
            result="信息不完善！"
            return jsonify(result)
        elif re.match(r'^1[345789]\d{9}$', args['phone']) is None:
            result['code'] = 4020
            result['message'] = "此号码不存在！"
            return jsonify(result)
        mq = Mysqllink()
        sql='select * from admin_users where phone=%s and id!=%s'
        valu=(args['phone'],admin_user_id)
        n=mq.select(sql,valu)
        if n :
            result['code']=4022
            result['message']="此号码已注册！"
            return jsonify(result)
        #查看此管理员是不是超级管理员
        sql = 'select is_super from admin_users where id=%s'
        mq.select(sql, admin_user_id)
        super = mq.cursor.fetchall()[0]
        is_super = super['is_super']
        if is_super != 1:
            result['code'] = 4002
            result['message'] = "无此权限！"
            return jsonify(result)
        now_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        sql='update admin_users set name=%s,phone=%s,pwd=%s,des=%s,update_at=%s,post_id=%s,is_super=%s where id=%s'
        valu=(args['name'],args['phone'],args['pwd'],args['des'],now_time,args['post_id'],args['is_super'],args['id'])
        mq.update(sql,valu)
        sql='select create_at from admin_users where id=%s'
        mq.select(sql,admin_user_id)
        create_at=mq.cursor.fetchall()[0]['create_at']
        print(create_at)
        result['code']=200
        result['data']={'admin_user':[{'id':admin_user_id,'name':args['name'],'phone':args['phone'],
                                       'des':args['des'],'create_at':create_at,'update_at':now_time}]}
        return jsonify(result)

#订单
class Orders(Resource):
    #GET/orders   获取⽤户订单列表
    @checkToken
    def get(self,token):
        args = parser.parse_args()
        result={}
        id=args['user_id']
        mq=Mysqllink()
        sql='select * from orders where user_id=%s'
        n = mq.select(sql,id)
        if n<1:
            result['code']=4034
            result['message']="无订单！"
            return jsonify(result)
        orders=mq.cursor.fetchall()
        print(orders)
        data1=[]
        for i in orders:
            sql='select * from order_detail where order_id=%s'
            mq.select(sql,i['id'])
            order_detail=mq.cursor.fetchall()
            print(order_detail)
            data2=[]
            for j in order_detail:
                dic1={}
                subtotal = str(j['subtotal'])
                dic1.update({'id':j['goods_id'],'subtotal':subtotal})
                data2.append(dic1)
            dic={}
            total_price=str(i['total_price'])
            dic.update({'id':i['id'],'status':i['status'],'addr_id':i['addr_id'],'production':data2,
                        'price':total_price,'create_at':i['create_at'],'update_at':i['update_at']})
            data1.append(dic)
        result['code']=200
        result['data']={'orders':data1}
        return jsonify(result)

    # PUT/orders  改变订单状态
    @checkToken
    def put(self, token):
        args = parser.parse_args()
        result = {}
        mq=Mysqllink()
        now_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        sql='update orders set status=%s,update_at=%s where id=%s'
        valu=(args['status'],now_time,args['order_id'])
        mq.update(sql,valu)
        sql='select * from orders where id=%s'
        mq.select(sql,args['order_id'])
        orders=mq.cursor.fetchall()[0]
        sql='select * from order_detail where order_id=%s'
        mq.select(sql,orders['id'])
        order_detail=mq.cursor.fetchall()
        data=[]
        for i in order_detail:
            dic={}
            subtotal = str(i['subtotal'])
            dic.update({'id':i['goods_id'],'subtotal':subtotal})
            data.append(dic)
        total_price = str(orders['total_price'])
        result['code']=200
        result['data']={'order':{'id':orders['id'],'status':orders['status'],'address':orders['addr_id'],
                                 'production':data,'price':total_price,'create_at':orders['create_at'],
                                 'update_at':orders['update_at']}}
        return jsonify(result)



api.add_resource(Users, '/users/<token>')  #注册,获取用户列表
api.add_resource(User_login, '/user_login/<token>')  #登录
api.add_resource(Addr, '/addr/<token>')  #地址添加,修改
api.add_resource(Admin_users,'/admin_users/<token>')  #管理员添加,修改
api.add_resource(Classes, '/classes/<token>')  #商品分类添加,修改
api.add_resource(Goods,'/goods/<token>')  #商品添加修改
api.add_resource(Orders, '/orders/<token>')  #获取订单,更改订单状态

if __name__=="__main__":
    app.config['JSON_AS_ASCII'] = False
    app.config.update(RESTFUL_JSON=dict(ensure_ascii=False))
    app.run(debug=True)
