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

def getRecap():
    conn,cursor = openDb()
    cursor.execute('select * from recap')
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result

def calculateRecap():
    conn,cursor = openDb()
    cursor.execute('select sum(hargaBrg * jumlahBrg) as total from recap')
    result = cursor.fetchone()
    cursor.close()
    conn.close()
    return result