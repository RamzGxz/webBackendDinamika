from flask import Flask, render_template, request, url_for,redirect
import pymysql.cursors

host = 'localhost'
port = 5555

cursor = conn = None

def openDb():
    global conn, cursor
    conn = pymysql.connect(host ='127.0.0.1', user ='root', passwd = 'ramzi', database ='dinamikaDatabase')
    cursor = conn.cursor()

def closeDb():
    global conn, cursor
    cursor.close()
    conn.close()

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/stock')
def stock():
    openDb()
    sql = 'select * from stock'
    cursor.execute(sql)
    result = cursor.fetchall()
    closeDb()
    return render_template('stock.html', data=result,)
    
@app.route('/recap')
def recap():
    return render_template('recap.html')

@app.route('/tambahstock', methods = ['GET', 'POST'])
def tambah():
    if request.method == 'POST':
        details = request.form
        kodeBrg = details['kodeBrg']
        namaBrg = details['namaBrg']
        hargaBrg = details['hargaBrg']
        jumlahBrg = details['jumlahBrg']
        openDb()
        sql = 'insert into stock(kodeBrg, namaBrg, hargaBrg, jumlahBrg) values(%s,%s,%s,%s)'
        val = (kodeBrg,namaBrg,hargaBrg,jumlahBrg)
        cursor.execute(sql, val)
        conn.commit()
        closeDb()
        return(redirect(url_for('stock')))
    else:
        return render_template('stock.html')

@app.route('/editStockBrg/<id>', methods = ['GET', 'POST'])
def editStockBrg(id):
    openDb()
    cursor.execute('select kodeBrg, namaBrg, hargaBrg, jumlahBrg from stock where id=%s', (id))
    data = cursor.fetchone()
    if request.method == 'POST':
        details = request.form
        id = details['id']
        kodeBrg = details['kodeBrg']
        namaBrg = details['namaBrg']
        hargaBrg = details['hargaBrg']
        jumlahBrg = details['jumlahBrg']
        sql = 'UPDATE stock set kodeBrg=%s, namaBrg=%s, hargaBrg=%s, jumlahBrg=%s where id=%s'
        val = (kodeBrg, namaBrg, hargaBrg, jumlahBrg, id)
        cursor.execute(sql, val)
        conn.commit()
        closeDb()
        return redirect(url_for('stock'))
    else:
        closeDb()
        return redirect(url_for('stock', data = data))


app.run(host, port, debug=True)