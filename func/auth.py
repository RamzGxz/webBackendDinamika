from flask import render_template,make_response,redirect
import jwt
import datetime
from dotenv import dotenv_values

def authentication(user,password):

    if(not len(user)):
        err = 'username tidak ada'
        return render_template('index.html',err=err)

    if(user[0][2] != password):
        err = 'password salah'
        return render_template('index.html',err=err)
    
    ## access env
    key = dotenv_values('.env')
    secret_key = list(key.items())[2][1]

    token = jwt.encode({'id' : user[0][0],'exp':  datetime.datetime.utcnow() + datetime.timedelta(days=1)},secret_key,algorithm='HS256')



    resp = make_response(redirect('/stock'))
    resp.set_cookie('token',token,max_age=60*60*24,secure=True)
    return resp




def authorization(conn,cursor,token):
    try:
        ## access env
        key = dotenv_values('.env')
        secret_key = list(key.items())[2][1]

        # check token
        user = jwt.decode(token,secret_key,algorithms='HS256')
        cursor.execute('select * from pegawai where id=%s',(user['id'],))
        userFind = cursor.fetchall()

        if(not len(userFind)):
            raise Exception(True)
        
        cursor.close()
        conn.close()
        return False
    except Exception as err:
        cursor.close()
        conn.close()
        return True


def deleteCookie():
    resp = make_response(redirect('/'))
    resp.delete_cookie('token')
    return resp
