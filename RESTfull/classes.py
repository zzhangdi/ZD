from urllib import request,parse
import json
from hashlib import md5


# #检测添加商品分类
#
# data={'name':"电脑",'pid':1}
# data = parse.urlencode(data).encode('utf8')
# aaa=md5(b'333').hexdigest()
# # print(aaa)
# req=request.Request("http://127.0.0.1:5000/classes/%s"%aaa,method="post",data=data)
# result=request.urlopen(req)
# print(result.read().decode('utf8'))


# #检测查看商品分类

# aaa=md5(b'333').hexdigest()
# # print(aaa)
# req=request.Request("http://127.0.0.1:5000/classes/%s"%aaa,method="get")
# result=request.urlopen(req)
# print(result.read().decode('utf8'))