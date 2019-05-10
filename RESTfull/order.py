from urllib import request,parse
import json
from hashlib import md5

# 检测获取用户订单

aaa=md5(b'333').hexdigest()
# print(aaa)
req=request.Request("http://127.0.0.1:5000/orders/%s?user_id=%s"%(aaa,27),method="get")
result=request.urlopen(req)
print(result.read().decode('utf8'))


# 检测改变订单状态

# data={'status':0}
# data = parse.urlencode(data).encode('utf8')
# aaa=md5(b'333').hexdigest()
# # print(aaa)
# req=request.Request("http://127.0.0.1:5000/orders/%s?order_id=%s"%(aaa,4),method="put",data=data)
# result=request.urlopen(req)
# print(result.read().decode('utf8'))