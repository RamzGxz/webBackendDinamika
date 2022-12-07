import pymysql

def openDb():
    conn = pymysql.connect(host ='127.0.0.1', user ='root', passwd = '', database ='ramzi_rekap')
    cursor = conn.cursor()
    return conn,cursor


def findUser(conn,cursor,username):
    cursor.execute(f'select * from pegawai where name=%s',(username,))
    user = cursor.fetchall()
    cursor.close()
    conn.close()
    return user



def getStok():
    conn,cursor = openDb()
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

def updateData(data,table):
    conn,cursor = openDb()
    upData = (data['kodeBrg'],data['namaBrg'],data['hargaBrg'],data['jumlahBrg'],data['id'])
    cursor.execute(f'update {table} set kodeBrg=%s, namaBrg=%s, hargaBrg=%s,jumlahBrg=%s where id=%s',upData)
    conn.commit()
    cursor.close()
    conn.close()

def insertData(data,table):
    conn,cursor = openDb()
    sql = f'insert into {table}(kodeBrg, namaBrg, hargaBrg, jumlahBrg) values(%s,%s,%s,%s)'
    val = (data['kodeBrg'],data['namaBrg'],data['hargaBrg'],data['jumlahBrg'])
    cursor.execute(sql, val)
    conn.commit()
    cursor.close()
    conn.close()

def deleteData(id,table):
    conn,cursor = openDb()
    cursor.execute(f'delete from {table} where id=%s',(id,))
    conn.commit()
    cursor.close()
    conn.close()