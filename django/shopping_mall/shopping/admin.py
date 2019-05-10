from django.contrib import admin

from .models import *

admin.site.register([Goods_type,Goods,Addr,User,Banner,Shop_cart,Pay_type,Order,Order_goods])
