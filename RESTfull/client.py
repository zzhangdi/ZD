
from urllib import request,parse
import json
from hashlib import md5

# 检测注册

# data={'name':'张迪','phone':'15712555678','pwd':'zhangdi123'}
# data = parse.urlencode(data).encode('utf8')
# aaa=md5(b'333').hexdigest()
# # print(aaa)
# req=request.Request("http://127.0.0.1:5000/users/%s"%aaa,method="post",data=data)
# result=request.urlopen(req)
# print(result.read().decode('utf8'))
########################################################

# #检测登录
#
# data={'phone':'13312345678','pwd':' password '}
# data = parse.urlencode(data).encode('utf8')
# aaa=md5(b'333').hexdigest()
# # print(aaa)
# req=request.Request("http://127.0.0.1:5000/user_login/%s"%aaa,method="post",data=data)
# result=request.urlopen(req)
# print(result.read().decode('utf8'))
##############################################

#检测管理员查看用户列表
data={'id':1}
data = parse.urlencode(data).encode('utf8')
aaa=md5(b'333').hexdigest()
# print(aaa)
req=request.Request("http://127.0.0.1:5000/users/%s"%aaa,method="get",data=data)
result=request.urlopen(req)
print(result.read().decode('utf8'))