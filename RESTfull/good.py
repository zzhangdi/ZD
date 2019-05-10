from urllib import request,parse
import json
from hashlib import md5


# #检测添加商品
#
# data={'name':'华为P30','price':5000,'img':'E://img//huaweiP30.jpg','origin':'China','unit':'部','sales':5000,'descs':'麒麟980...','class_id':2}
# data = parse.urlencode(data).encode('utf8')
# aaa=md5(b'333').hexdigest()
# req=request.Request("http://127.0.0.1:5000/goods/%s?admin_user_id=%s"%(aaa,1),method="post",data=data)
# result=request.urlopen(req)
# print(result.read().decode('utf8'))


# #检测查询商品
#
# aaa=md5(b'333').hexdigest()
# req=request.Request("http://127.0.0.1:5000/goods/%s"%aaa,method="get")
# result=request.urlopen(req)
# print(result.read().decode('utf8'))

#检测修改商品

# data={'name':'iphonex','price':6000,'img':'E://img//iphonx.jpg','origin':'China','unit':'部','sales':5000,'des':'A11...','class_id':2}
# data = parse.urlencode(data).encode('utf8')
# aaa=md5(b'333').hexdigest()
# req=request.Request("http://127.0.0.1:5000/goods/%s?admin_user_id=%s&&id=%s"%(aaa,1,5),method="put",data=data)
# result=request.urlopen(req)
# print(result.read().decode('utf8'))