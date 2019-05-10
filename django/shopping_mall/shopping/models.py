from django.db import models
from  django.contrib.auth.models import AbstractUser


#商品分类表
class Goods_type(models.Model):
    class Meta:
        verbose_name = '商品分类'
        verbose_name_plural = verbose_name
    name = models.CharField('名称',max_length=10,null=True)
    img1 = models.ImageField('图片1-图标',upload_to='img/',null=True)
    note = models.CharField ('说明',max_length=255,null=True)
    ctime = models.DateTimeField('创建时间',auto_now_add=True)
    icon = models.CharField('图标',max_length=20,null=True)

    def __str__(self):
        return self.name
#商品表
class Goods(models.Model):
    class Meta:
        verbose_name = '商品'
        verbose_name_plural = verbose_name
    name = models.CharField('名称',max_length=50,null=True)
    img1 = models.ImageField('商品图片1',upload_to='img/',null=True)
    seller = models.IntegerField('卖家编号',default=1)
    goods_info = models.CharField('商品详情',max_length=255,null=True)
    is_buy = models.IntegerField('是否上架',choices=((0,'NO'),(1,'上架')),default=1)
    zyxs = models.IntegerField('主页显示',choices=((0,'NO'),(1,'主页显示')),default=1) #zyxs:主页显示
    tj = models.IntegerField('新品推荐',choices=((0,'NO'),(1,'推荐')),default=0)#tj:推荐
    price = models.FloatField('价格',default=0)
    unit = models.CharField('商品单位',max_length=50,default='500g')
    goods = models.ForeignKey(Goods_type, on_delete=models.CASCADE, verbose_name='商品种类')

    def __str__(self):
        return self.name
# 用户表
class User(AbstractUser):

    class Meta:
        verbose_name = '用户'
        verbose_name_plural = verbose_name

    # name = models.CharField('姓名',max_length=30,null=False)
    nick = models.CharField('昵称',max_length=30,null=True)
    ctime = models.DateTimeField('创建时间',auto_now_add=True,null=True)
    birthday = models.DateTimeField('生日',null=True)
    # email = models.EmailField('邮箱')
    tel = models.CharField('电话',max_length=11,null=False)
    # pwd = models.CharField('密码',max_length=36,null=False)
    age = models.SmallIntegerField('年龄',null=True)
    sex = models.SmallIntegerField('性别',choices=((0,'女'),(1,'男')),default=0)
    home_addr = models.CharField('住址',max_length=255)
    account = models.CharField('账号',max_length=20)
    goods1 = models.ManyToManyField(Goods,through='Shop_cart',through_fields=('user','goods1'),verbose_name='商品')

    # def __str__(self):
    #     return self.username

#收货地址
class Addr(models.Model):

    class Meta:
        verbose_name = '收货地址'
        verbose_name_plural = verbose_name

    name = models.CharField('收件人',max_length=10)
    site = models.CharField('详细地址',max_length=150,null=True)
    Zip_Code = models.IntegerField('邮编',null=True)
    tel = models.CharField('电话',max_length=12)
    user =models.ForeignKey(User,on_delete=models.CASCADE,verbose_name='用户编号')

    def __str__(self):
        return self.name
# 首页轮播图
class Banner(models.Model):
    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name

    name = models.CharField('名字',max_length=50)
    img = models.ImageField('图片',upload_to='img/')
    title = models.IntegerField('标题',choices=((0,'静态图片'),(1,'轮播图')),default=0)
    status = models.IntegerField('是否启用',choices=((0,'不启用'),(1,'启用')),default=1)

    def __str__(self):
        return self.name
#购物车(User和Goods多对多建表)
class Shop_cart(models.Model):  #status: 状态；现状
    class Meta:
        verbose_name = '购物车'
        verbose_name_plural = verbose_name

    count = models.IntegerField('数量',null=True)
    status = models.IntegerField('是否启用',choices=((0,'NO'),(1,'启用')),default=1)
    ljgm = models.IntegerField('立即购买', choices=((0, 'NO'), (1, 'YES')), default=0)
    is_del = models.IntegerField('是否删除',choices=((0,'NO'),(1,'删除')),default=0)
    goods1 = models.ForeignKey(Goods,on_delete=models.CASCADE,verbose_name='商品编号')
    user = models.ForeignKey(User,on_delete=models.CASCADE,verbose_name='用户编号')

#支付平台
class Pay_type(models.Model):
    class Meta:
        verbose_name = '支付平台'
        verbose_name_plural = verbose_name

    name = models.CharField('支付类型名称',max_length=50,null=True)
    status = models.IntegerField('是否启用',choices=((0,'NO'),(1,'启用')),default=1)
    img = models.CharField('支付平台图标',max_length=50)

    def __str__(self):
        return self.name

#订单
class Order(models.Model):
    class Meta:
        verbose_name = '订单'
        verbose_name_plural = verbose_name

    ctime = models.DateTimeField('订单生成时间', auto_now_add=True)
    itmes = models.CharField('订单号',max_length=50,null=True)
    order_status = models.IntegerField('订单状态', choices=((0, '未付款'), (1, '已付款')), default=1)
    status = models.IntegerField('付款/查看', choices=((0, '去付款'), (1, '查看物流')), default=1)
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='用户编号')

    # def __str__(self):
    #     return self.name

#订单详情
class Order_goods(models.Model):
    class Meta:
        verbose_name = '订单详情'
        verbose_name_plural = verbose_name

    total1 = models.FloatField('商品小计',null=True)
    num1 = models.IntegerField('商品数量',null=True)
    goods = models.ForeignKey(Goods,on_delete=models.CASCADE, verbose_name='商品编号',null=True)
    itme_id = models.ForeignKey(Order, on_delete=models.CASCADE, verbose_name='订单编号', null=True)

    # itme_id = models.IntegerField('hehe', null=True)   #更改外键约束后才能清空所约束的表
    # def __str__(self):
    #     return self.name

