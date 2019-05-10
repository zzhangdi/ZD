from urllib import request,parse
import json
from hashlib import md5


# #检测添加地址
#
# data={'user_id':27,'phone':'15812345678','name':'张三',
#       'des':{'province':'陕西省','city':'西安市','area':'长安区',
#               'detail':'航天中学'},'is_default':'False'}
# data = parse.urlencode(data).encode('utf8')
# aaa=md5(b'333').hexdigest()
# # print(aaa)
# req=request.Request("http://127.0.0.1:5000/addr/%s"%aaa,method="post",data=data)
# result=request.urlopen(req)
# print(result.read().decode('utf8'))

#检测查询地址

# data={'user_id':27}
# data = parse.urlencode(data).encode('utf8')
# aaa=md5(b'333').hexdigest()
# # print(aaa)
# req=request.Request("http://127.0.0.1:5000/addr/%s"%aaa,method="get",data=data)
# result=request.urlopen(req)
# print(result.read().decode('utf8'))

# #检测修改地址
#
# data={'id':15,'user_id':27,'phone':15812345678,'name':'赵奔','des':{'province':'陕西省','city':'西安市',
#         'area':'碑林区','detail':'高速大厦8楼'},'is_default':'True'}
# data = parse.urlencode(data).encode('utf8')
# aaa=md5(b'333').hexdigest()
# # print(aaa)
# req=request.Request("http://127.0.0.1:5000/addr/%s"%aaa,method="put",data=data)
# result=request.urlopen(req)
# print(result.read().decode('utf8'))