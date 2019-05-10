import pymysql

class Mysqllink:
    def __init__(self):
        self.conn = pymysql.connect(host='127.0.0.1',port=3306,user='zd',passwd='123456',
                               db='market',charset='utf8')
        self.cursor = self.conn.cursor(cursor=pymysql.cursors.DictCursor)

    #添加
    #sql:sql语句；  valu:字段所对应的值
    def insert(self,sql,valu):
        n = self.cursor.execute(sql,valu)
        return n

    #查询
    #sql语句;  valu:字段所对应的值;
    def select(self,sql,valu=None):
        n=self.cursor.execute(sql,valu)
        return n

    #修改,更新
    # field:字段;  tab:表名; cond:条件;
    def update(self,sql,valu):
        n = self.cursor.execute(sql,valu)
        return n

    #类方法完成后自动运行
    #提交,关闭连接
    def __del__(self):
        self.conn.commit()
        self.cursor.close()
        self.conn.close()
        # print(1234)


#管理员查询权限
class Query_rules(Mysqllink):
    def query_rule(self,au_post_id):
        n = self.cursor.execute('SELECT ru.name FROM rule AS ru INNER JOIN '
                          'post_rule AS pr ON ru.id=pr.rule_id INNER JOIN post ON pr.post_id=post.id INNER JOIN'
                          ' admin_users AS au ON au.post_id=%s',(au_post_id))
        return n


# Mysqllink()

# a.cursor.execute('select * from test1')
# bb=a.cursor.fetchall()
# print(bb)



# app = Flask(__name__)
#
# @app.route("/")
# def index():
#     return '<h1>Hello,Flask</h1>'
#
#
#
# if __name__=='__main__':
#     app.run(debug=True)