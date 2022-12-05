from flask import Flask, render_template, request, url_for,redirect,make_response
from func.mysql import *
from func.auth import *

app = Flask(__name__)

@app.route('/',methods = ['GET','POST'])
def index():
    logout = False
    if(request.cookies.get('token')):
        logout = True

    if(request.method == 'POST'):
        data = request.form
        username = data['username']
        password = data['password']

        conn,cursor = openDb()
        user = findUser(conn,cursor,username)

        # check user, create token,set cookie and redirect stock
        return authentication(user,password)
    return render_template('index.html',logout=logout)

    
@app.route('/logout',methods=['GET'])
def logout():
    return deleteCookie()


@app.route('/stock',methods=['GET','POST'])
def stock():
    token = request.cookies.get('token')
    if not token:
        return render_template('errLogin.html')
    # pembatasan authorization
    conn,cursor = openDb()
    checkAuthErr = authorization(conn,cursor,token)

    #check error authorization
    if(checkAuthErr):
        return deleteCookie()

    if(request.method == 'POST'):
        details = request.form
        kodeBrg = details['kodeBrg']
        namaBrg = details['namaBrg']
        hargaBrg = details['hargaBrg']
        jumlahBrg = details['jumlahBrg']

        conn,cursor = openDb()
        sql = 'insert into stock(kodeBrg, namaBrg, hargaBrg, jumlahBrg) values(%s,%s,%s,%s)'
        val = (kodeBrg,namaBrg,hargaBrg,jumlahBrg)
        cursor.execute(sql, val)
        conn.commit()
        cursor.close()
        conn.close()
        return(redirect(url_for('stock')))
    
    conn,cursor = openDb()
    result = getStok(conn,cursor)
    return render_template('stock.html', data=result)
    
@app.route('/recap')
def recap():
    token = request.cookies.get('token')
    if not token:
        return render_template('errLogin.html')
    conn,cursor = openDb()
    checkAuthErr = authorization(conn,cursor,token)

    if(checkAuthErr):
        return deleteCookie()
    return render_template('recap.html')

@app.route('/edit', methods=['GET','POST'])
def edit(id):
    conn,cursor = openDb()






# @app.route('/editStockBrg/<id>', methods = ['GET', 'POST'])
# def editStockBrg(id):
#     openDb()
#     cursor.execute('select kodeBrg, namaBrg, hargaBrg, jumlahBrg from stock where id=%s', (id))
#     data = cursor.fetchone()
#     if request.method == 'POST':
#         details = request.form
#         id = details['id']
#         kodeBrg = details['kodeBrg']
#         namaBrg = details['namaBrg']
#         hargaBrg = details['hargaBrg']
#         jumlahBrg = details['jumlahBrg']
#         sql = 'UPDATE stock set kodeBrg=%s, namaBrg=%s, hargaBrg=%s, jumlahBrg=%s where id=%s'
#         val = (kodeBrg, namaBrg, hargaBrg, jumlahBrg, id)
#         cursor.execute(sql, val)
#         conn.commit()
#         closeDb()
#         return redirect(url_for('stock'))
#     else:
#         closeDb()
#         return redirect(url_for('stock', data = data))
