from flask import Flask, render_template,url_for, session, flash,redirect, request, jsonify
import os,hashlib
from base64 import b64encode
from flaskext.mysql import MySQL
from matplotlib.style import use
import json
from credentials import *
app = Flask(__name__)


app.config['SECRET_KEY'] = secret_key

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = db_username
app.config['MYSQL_DATABASE_PASSWORD'] = db_password
app.config['MYSQL_DATABASE_DB'] = 'pythonista'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.errorhandler(404)
def not_found(e):
  return render_template("error.html")


@app.route('/index')
@app.route('/')
@app.route('/home')
def home():
 return render_template("index.html")

@app.route('/login', methods=['GET', 'POST'])
def login(): 
    if request.method=="GET":
        if 'username' in session:
            flash("You are already logged in!","info")
            return redirect(url_for("home"))
        else:
            return render_template("login.html")
    else:
        email=request.form['email']
        password=request.form['password']
        connection=mysql.connect()
        cursor=connection.cursor()
        cursor.execute('select email,password,salt,username,level,age,id from users_info')
        connection.close()
        records = cursor.fetchall()
        exist=False
        for row in records:
            if email==row[0]:
                exist=True
                hex_hash = hashlib.pbkdf2_hmac('sha256', password.encode(), row[2], 10000).hex()
                if hex_hash==row[1]:
                    session['username']=row[3]
                    session['level']=row[4]
                    session['age']=row[5]
                    session['id']=row[6]
                    return jsonify({'success':f"Welcome back {row[3]}!"})
        if exist==False:
            return jsonify({'error':'An account with that email does not exist!'})
        else:
            return jsonify({'error':'The given password is wrong, try again!'})


            
@app.route('/signup', methods=['POST'])
def signup():
    username=request.form['username']
    email=request.form['email']
    password=request.form['password']
    level=request.form['level']
    age=request.form['age']
    connection=mysql.connect()
    cursor=connection.cursor()
    cursor.execute('select username,email from users_info')
    records = cursor.fetchall()
    for row in records:
        if username==row[0]:
            return jsonify({'info':'There is already a user with the same username, try logging in!'})
        elif email==row[1]:
            return jsonify({'info':'There is already a user with the same email, try logging in!'})
    salt = os.urandom(32)
    hex_hash = hashlib.pbkdf2_hmac('sha256', password.encode(), salt, 10000).hex()
    cursor.execute('insert into users_info (username,email,password,salt,level,age) values (%s,%s,%s,%s,%s,%s)',(username,email,hex_hash,salt,level,age))
    connection.commit()
    cursor.execute('select id from users_info where username='+username)
    records=cursor.fetchall()
    connection.close()
    session['id']=records[0]
    session['username']=username
    session['level']=level
    session['age']=age
    return jsonify({'success':f"Welcome back {username}!"})


@app.route('/profile', methods=['GET'])
def logout():
    flash(f"Hope to see you soon {session['username']}!",'success')
    session.pop('username',None)
    session.pop('level',None)
    session.pop('age', None)
    return redirect(url_for("home"))


@app.route('/chapters', methods=['GET','POST'])
def chapters():
    if request.method=="GET":
        if 'username' in session:
            connection=mysql.connect()
            cursor=connection.cursor()
            cursor.execute('select chapter_name from chapters_info where id='+str(session['id']))
            records = cursor.fetchall()
            connection.close()
            completed=[ ]
            if len(records)!=0:
                for row in records:
                    completed.append(row[0])
            return render_template('chapters.html',chapters=completed)
        else:
            flash("You have to log in or create an account first, to access our learning materials!",'info')
            return redirect(url_for("login"))
    else:
        connection=mysql.connect()
        cursor=connection.cursor()
        cursor.execute('insert into chapters_info (id,chapter_name) values (%s,%s)',(session['id'],request.form['chapter']))
        connection.commit()
        connection.close()
        return jsonify({'success':"completed"})
        

    



@app.route('/python', methods=['GET'])
def python():
    if request.method=="GET":
        return render_template('python.html')




if __name__ == '__main__':
 app.run(debug=True)