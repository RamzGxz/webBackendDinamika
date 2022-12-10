from flask import Flask, render_template, request, url_for,redirect,make_response
from func.mysql import *
from func.auth import *

app = Flask(__name__)

@app.route('/',methods = ['GET','POST'])
def index():
    login = False
    if(request.cookies.get('token')):
        login = True

    if(request.method == 'POST'):
        data = request.form
        username = data['username']
        password = data['password']

        conn,cursor = openDb()
        user = findUser(conn,cursor,username)

        # check user, create token,set cookie and redirect stock
        return authentication(user,password)
    return render_template('index.html',login=login)

    
@app.route('/logout',methods=['GET'])
def logout():
    return deleteCookie()


@app.route('/stock',methods=['GET','POST'])
def stock():
    token = request.cookies.get('token')
    login = False
    updated = False
    if token:
        # check token authorization
        conn,cursor = openDb()
        check_err = authorization(conn,cursor,token)
        if(check_err):
            deleteCookie()
    else:
        login = True


    if(request.method == 'POST'):
        details = request.form
        insertData(details,'stock')
        updated = True
        return(redirect(url_for('stock')))
    result = getStok()
    return render_template('stock.html', data=result,login=login,updated=updated)
    
@app.route('/recap', methods = ['GET', 'POST'])
def recap():
    token = request.cookies.get('token')
    if not token:
        return render_template('errLogin.html')

    if request.method == 'POST':
        details = request.form
        insertData(details,'recap')
        return(redirect(url_for('recap')))
    result = getRecap()

    sqlCalculate = calculateRecap()[0]
    return render_template('recap.html', data=result,sqlCalculate=sqlCalculate)
    
@app.route('/stock/edit/', methods = ['POST'])
def editStockBrg():
    data = request.form
    updateData(data,'stock')
    return redirect(url_for('stock'))


@app.route('/stock/<int:id>',methods=['GET'])
def deleteStockBrg(id):
    deleteData(id,'stock')
    return redirect(url_for('stock'))


@app.route('/recap/edit/', methods = ['POST'])
def editRecapkBrg():
    data = request.form
    updateData(data,'recap')
    return redirect(url_for('recap'))

@app.route('/recap/<int:id>',methods=['GET'])
def deleteRecapBrg(id):
    deleteData(id,'recap')
    return redirect(url_for('recap'))