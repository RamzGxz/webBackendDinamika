import pymysql

def openDb():
    conn = pymysql.connect(host ='127.0.0.1', user ='root', passwd = 'ramzi', database ='dinamikaDatabase')
    cursor = conn.cursor()
    return conn,cursor


def findUser(conn,cursor,username):
    cursor.execute(f'select * from pegawai where name=%s',(username,))
    user = cursor.fetchall()
    cursor.close()
    conn.close()
    return user



def getStok(conn,cursor):
    cursor.execute('select * from stock')
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result