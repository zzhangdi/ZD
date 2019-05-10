from flask import Flask,jsonify
from flask_restful import reqparse,abort,Api,Resource
from hashlib import md5
import re,pymysql
from msql import Mysqllink
import time

app = Flask(__name__)
api = Api(app)

def checkToken(func):
    def handle_args(*args,**kwargs):
        if kwargs['token']!=md5(b'333').hexdigest():
            abort(1001,message="请输入正确的token")
        else:
            return func(*args,**kwargs) #函数调用
    return handle_args
parser = reqparse.RequestParser()
parser.add_argument('name')
parser.add_argument('phone')
parser.add_argument('pwd')


#用户登录注册
class Users(Resource):
    # 用户注册
    # post/api/users
    @checkToken
    def post(self,token):
        mq = Mysqllink()
        args = parser.parse_args()
        result={}
        pwd=args['pwd'].strip()
        print(pwd)
        if args['name']=="":
            result['code']=1020
            result['message']="用户名不能为空！"
            return jsonify(result)
        elif args['phone']=="":
            result['code']=1030
            result['message']="电话号码不能为空！"
            return jsonify(result)
        elif re.match(r'^1[345789]\d{9}$',args['phone']) is None:
            result['code']=1031
            result['message']="此号码不存在！"
            return jsonify(result)
        elif pwd=="":
            result['code']=1040
            result['message']="密码不能为空！"
            return jsonify(result)
        elif len(pwd)<6 or len(pwd)>16:
            result['code']=1051
            result['message']="密码必须在6~16位之间！"
            return jsonify(result)
        # name = args['name']
        # sql = 'select name from users where name=%s'
        # n = mq.cursor.execute(sql, name)
        feild1='name'
        tab='users'
        cond='name="%s"'%args['name']
        n=mq.select(feild1,tab,cond)
        feild1 = 'phone'
        cond = 'phone="%s"' % args['phone']
        m = mq.select(feild1, tab, cond)
        if n:
            result['code'] = 1010
            result['message'] = "用户名已存在！"
            return jsonify(result)

        elif m:
            result['code'] = 1011
            result['message'] = "此号码已注册！"
            return jsonify(result)
        now_time =time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
        print(now_time)
        # sql='insert into users value (null,%s,%s,%s,%s)'
        tab='users(name,phone,pwd,create_at)'


        valu=(args['name'],args['phone'],args['pwd'],now_time)
        # mq.cursor.execute(sql,pp)
        mq.insert(tab,valu)
        ID = mq.cursor.lastrowid
        result['code']=2000
        result['date']={'user':{'id':ID,'name':args['name'],'phone':args['phone'],'pwd':args['pwd'],'create_at':now_time}}
        return jsonify(result)

    #登录
    #get/api/users
    @checkToken
    def get(self,token):
        mq = Mysqllink()
        args = parser.parse_args()
        result = {}
        phone = args['phone']
        pwd = args['pwd']
        if phone=="" or pwd=="":
            result['code']=1050
            result['message']="电话和密码不能为空！"
            return jsonify(result)
        else:
            sql='select pwd from users where phone=%s'
            n = mq.cursor.execute(sql, phone)
            print(n)
            passwd=mq.cursor.fetchall()[0][0]
            print(passwd)

            if n:
                if pwd==passwd:
                    result['code']=2000
                    result['message']="登陆成功！"
                    return jsonify(result)
                else:
                    result['code']=4020
                    result['message']="密码错误！"
                    return jsonify(result)
            else:
                result['code']=4010
                result['message']="此号码不存在！"
                return jsonify(result)




api.add_resource(Users, '/users/<token>')


if __name__=="__main__":
    app.config['JSON_AS_ASCII'] = False
    app.config.update(RESTFUL_JSON=dict(ensure_ascii=False))
    app.run(debug=True)
