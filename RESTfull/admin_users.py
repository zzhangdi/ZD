from urllib import request,parse
import json
from hashlib import md5

# # 检测注册
#
# data={'name':'袁文博','phone':'15813445678','pwd':'password','des':'保安','is_super':0,'post_id':1}
# data = parse.urlencode(data).encode('utf8')
# aaa=md5(b'333').hexdigest()
# req=request.Request("http://127.0.0.1:5000/admin_users/%s"%aaa,method="post",data=data)
# result=request.urlopen(req)
# print(result.read().decode('utf8'))



# # 检测管理员列表
#
# aaa=md5(b'333').hexdigest()
# req=request.Request("http://127.0.0.1:5000/admin_users/%s?admin_user_id=%s"%(aaa,2),method="get")
# result=request.urlopen(req)
# print(result.read().decode('utf8'))

# 检测修改管理员信息

data={'id':3,'name':'袁文博','phone':'15855245678','pwd':'password','des':'保安队长','is_super':0,'post_id':1}
data = parse.urlencode(data).encode('utf8')
aaa=md5(b'333').hexdigest()
# print(aaa)
req=request.Request("http://127.0.0.1:5000/admin_users/%s?admin_user_id=%s"%(aaa,2),method="put",data=data)
result=request.urlopen(req)
print(result.read().decode('utf8'))