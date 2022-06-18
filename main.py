from flask import Flask, render_template, url_for, session, flash, redirect, request, jsonify
import os
import hashlib
from flaskext.mysql import MySQL
import random
from credentials import *
from datetime import timedelta
app = Flask(__name__)


app.config['SECRET_KEY'] = secret_key

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = db_username
app.config['MYSQL_DATABASE_PASSWORD'] = db_password
app.config['MYSQL_DATABASE_DB'] = 'pythonista'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.before_request
def make_session_permanent():
    session.permanent = True
    app.permanent_session_lifetime = timedelta(minutes=10)

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
    if request.method == "GET":
        if 'username' in session:
            flash("You are already logged in!", "info")
            return redirect(url_for("home"))
        else:
            return render_template("login.html")
    else:
        email = request.form['email']
        password = request.form['password']
        connection = mysql.connect()
        cursor = connection.cursor()
        cursor.execute(
            'select email,password,salt,username,age,user_id,teacher from users_info')
        connection.close()
        records = cursor.fetchall()
        exist = False
        for row in records:
            if email == row[0]:
                exist = True
                hex_hash = hashlib.pbkdf2_hmac(
                    'sha256', password.encode(), row[2], 10000).hex()
                if hex_hash == row[1]:
                    session['username'] = row[3]
                    session['age'] = row[4]
                    session['id'] = row[5]
                    if row[6] == 1:
                        session['teacher'] = row[6]
                        return jsonify({'success': f"Welcome back {row[3]}!", "teacher": "true"})
                    else:
                        return jsonify({'success': f"Welcome back {row[3]}!"})
        if exist == False:
            return jsonify({'error': 'An account with that email does not exist!'})
        else:
            return jsonify({'error': 'The given password is wrong, try again!'})


@app.route('/signup', methods=['POST'])
def signup():
    username = request.form['username']
    email = request.form['email']
    password = request.form['password']
    age = request.form['age']
    connection = mysql.connect()
    cursor = connection.cursor()
    cursor.execute('select username,email from users_info')
    records = cursor.fetchall()
    for row in records:
        if username == row[0]:
            return jsonify({'info': 'There is already a user with the same username, try logging in!'})
        elif email == row[1]:
            return jsonify({'info': 'There is already a user with the same email, try logging in!'})
    salt = os.urandom(32)
    hex_hash = hashlib.pbkdf2_hmac(
        'sha256', password.encode(), salt, 10000).hex()
    cursor.execute('insert into users_info (username,email,password,salt,age) values (%s,%s,%s,%s,%s)',
                   (username, email, hex_hash, salt, age))
    connection.commit()
    cursor.execute(
        'select user_id from users_info where username="'+username+'"')
    records = cursor.fetchall()
    connection.close()
    session['id'] = records[0]
    session['username'] = username
    session['age'] = age
    return jsonify({'success': f"Welcome {username}!"})


@app.route('/chapters', methods=['GET', 'POST'])
def chapters():
    if request.method == "GET":
        if 'username' in session and 'teacher' not in session:
            connection = mysql.connect()
            cursor = connection.cursor()
            cursor.execute(
                'select * from levels where user_id=%s', (session['id']))
            result = cursor.fetchall()
            if len(result) == 0:
                flash('Wanna take a test to determine your level and possibly skip a couple of chapters? If you score 0% to 39% you will be assigned as a beginner. If you score 40% to 69% yu will be assigned as an intermediate. I you score 70% to 100% you will be assigned as an expert.', 'info')
            cursor.execute(
                'select chapter_name from chapters_users_info where user_id=%s', (session['id']))
            chapters = cursor.fetchall()
            cursor.execute(
                'select tests.test_name,score from tests inner join tests_users_info on tests.test_name=tests_users_info.test_name where user_id=%s and score>50 order by tests.id', (session['id']))
            tests = cursor.fetchall()
            cursor.execute('select chapter_name from chapters order by id')
            all_chapters = cursor.fetchall()
            cursor.execute('select test_name from tests order by id')
            all_tests = cursor.fetchall()
            connection.close()
            completed_chapters = []
            completed_tests = []
            all_chapters_formatted = []
            all_tests_formatted = []
            for row in chapters:
                completed_chapters.append(row[0])
            for row in tests:
                completed_tests.append(row[0])
            for row in all_chapters:
                all_chapters_formatted.append(row[0])
            for row in all_tests:
                all_tests_formatted.append(row[0])
            print(completed_chapters)
            return render_template('chapters.html', chapters=completed_chapters, tests=completed_tests, all_chapters=all_chapters_formatted, all_tests=all_tests_formatted)
        else:
            flash(
                "You have to log in or create an account first, to access our learning materials!", 'info')
            return redirect(url_for("login"))
    else:
        if 'username' in session and 'teacher' not in session:
            curr_chapter = request.form['chapter']
            connection = mysql.connect()
            cursor = connection.cursor()
            cursor.execute(
                'select id from chapters_users_info inner join chapters on chapters_users_info.chapter_name=chapters.chapter_name where user_id=(%s) order by id',(session['id']))
            chapters = cursor.fetchall()
            cursor.execute(
                'select id from chapters where chapter_name=\''+str(curr_chapter)+'\'')
            curr_chapter_id = cursor.fetchall()
            valid = True
            print(curr_chapter_id, chapters)
            for i in range(len(chapters)):
                if chapters[i][0] != i+1:
                    valid = False
            if len(chapters)+1 != curr_chapter_id[0][0]:
                valid = False
            if valid == True:
                cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s) ', (session['id'], curr_chapter))
                connection.commit()
                connection.close()
                return jsonify({'success': "completed"})
            else:
                return jsonify({'error': "You have no access to that chapter. You have to complete all the previous chapters first!"})


@app.route('/tests', methods=['GET', 'POST'])
def tests():
    if request.method == "POST":
        if 'username' in session:
            return render_template('test.html')
    else:
        if 'username' in session and 'teacher' not in session:
            curr_test = request.args.get('test')
            if curr_test is None:
                flash("Select a test from the chapters!", 'info')
                return redirect(url_for("chapters"))
            elif curr_test=="levels":
                connection = mysql.connect()
                cursor = connection.cursor()
                cursor.execute(
                            'select question_type,question,multiple1,multiple2,multiple3,multiple4,chapter_name,subchapter from level_test ')

                questions = cursor.fetchall()
                connection.close()
                print(questions)
                return render_template('test.html', questions=questions)
            else:
                connection = mysql.connect()
                cursor = connection.cursor()
                cursor.execute(
                    'select id from tests_users_info inner join tests on tests_users_info.test_name=tests.test_name where user_id=(%s) order by id',(session['id']))
                tests = cursor.fetchall()
                cursor.execute(
                    'select id from tests where test_name=\''+str(curr_test)+'\'')
                curr_test_id = cursor.fetchall()
                valid = True
                if len(curr_test_id) > 0:
                    for i in range(len(tests)):
                        if tests[i][0] != i+1:
                            valid = False
                    if len(tests)+1 != curr_test_id[0][0]:
                        valid = False
                    if valid == True:
                        cursor.execute(
                            'select question_type,question,multiple1,multiple2,multiple3,multiple4,chapter_name,subchapter,test_id from tests_questions where test_name=%s', curr_test)
                        questions = cursor.fetchall()
                        if curr_test[0] == 'C' or curr_test[0] == 'Q':
                            questions = random.sample(questions, 3)
                        else:
                            questions = random.sample(questions, 6)
                        connection.close()
                        return render_template('test.html', questions=questions)
                    else:
                        connection.close()
                        flash(
                            'You have no access to that test. You have to pass the previous ones first!', 'error')
                        return redirect(url_for("chapters"))
                else:
                    flash("There is no such test in our database!", 'error')
                    return redirect(url_for("chapters"))
        else:
            flash(
                "You have to log in or create an account first, to access our learning materials!", 'info')
            return redirect(url_for("login"))


@app.route('/profile', methods=['GET'])
def profile():
    connection = mysql.connect()
    cursor = connection.cursor()
    cursor.execute(
        'select chapters.chapter_name from chapters_users_info left outer join chapters on chapters_users_info.chapter_name=chapters.chapter_name where user_id=%s order by id', session['id'])
    chapters = cursor.fetchall()
    cursor.execute('select chapter_name from chapters order by id')
    all_chapters = cursor.fetchall()
    cursor.execute('select test_name from tests order by id')
    all_tests = cursor.fetchall()
    cursor.execute(
        'select tests.test_name,score from tests_users_info left outer join tests on tests_users_info.test_name=tests.test_name where user_id=%s order by id', session['id'])
    tests = cursor.fetchall()
    connection.close()
    sum = 0
    if len(tests) > 0:
        for test in tests:
            sum += int(test[1])
        average = sum/len(tests)
        
    else:
        average = "-"
    return render_template('profile.html', chapters=chapters, tests=tests, all_chapters=all_chapters, all_tests=all_tests, average=average, sum=sum)


@app.route('/logout', methods=['GET'])
def logout():
    flash(f"Hope to see you soon {session['username']}!", 'success')
    session.pop('username', None)
    session.pop('age', None)
    session.pop('id', None)
    session.pop('teacher', None)
    return redirect(url_for("home"))


@app.route('/python', methods=['GET'])
def python():
    if request.method == "GET":
        if 'teacher' in session:
            return redirect(url_for("admin"))
        else:
            return render_template('python.html')


@app.route('/admin', methods=['GET'])
def admin():
    if request.method == "GET":
        if 'username' in session and 'teacher' in session:
            return render_template('admin.html')
        else:
            flash(
                "You have to log in with a teacher account to access that page!", 'error')
            return redirect(url_for("login"))


@app.route('/questions', methods=['GET', 'POST'])
def questions():
    if request.method == "GET":
        if 'username' in session and 'teacher' in session:
            connection = mysql.connect()
            cursor = connection.cursor()
            cursor.execute('select test_name from tests order by id')
            tests = cursor.fetchall()
            cursor.execute('select chapter_name from chapters order by id')
            chapters = cursor.fetchall()
            connection.close()
            return render_template('questions.html', tests=tests, chapters=chapters)
        else:
            flash(
                "You have to log in with a teacher account to access that page!", 'error')
            return redirect(url_for("login"))
    else:
        question = request.form['question']
        test_name = request.form['test_name']
        chapter_name = request.form['chapter_name']
        subchapter = request.form['subchapter']
        question_type = request.form['type']
        multiple1 = request.form['multiple1']
        multiple2 = request.form['multiple2']
        multiple3 = request.form['multiple3']
        multiple4 = request.form['multiple4']
        right_answer = request.form['right_answer']
        connection = mysql.connect()
        cursor = connection.cursor()
        cursor.execute('insert into tests_questions (question,test_name,chapter_name,subchapter,question_type,multiple1,multiple2,multiple3,multiple4,right_answer) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)',
                       (question, test_name, chapter_name, subchapter, question_type, multiple1, multiple2, multiple3, multiple4, right_answer))
        connection.commit()
        connection.close()
        flash('Successfully submitted!', 'success')
        return redirect(url_for("questions"))


@app.route('/students', methods=['GET', 'POST'])
def students():
    if request.method == "GET":
        if 'username' in session and 'teacher' in session:
            connection = mysql.connect()
            cursor = connection.cursor()
            cursor.execute('select username,email,  group_concat(id), group_concat(score) from (select username, email, id,score from (select username,email,test_name,score from tests_users_info right outer join users_info  on users_info.user_id=tests_users_info.user_id where teacher is null ) AS T left outer join tests on tests.test_name=T.test_name order by id) as B group by username;')
            students = cursor.fetchall()
            students = list(students)
            connection.close()
            sum = 0
            for i in range(len(students)):
                students[i] = list(students[i])
                if students[i][3] != None:
                    temp = students[i][3].split(',')
                    for j in range(len(temp)):
                        sum += int(temp[j])
                    if len(temp) != 0:
                        students[i].append(sum/len(temp))
                else:
                    students[i].append("-")
            print(students)
            return render_template('students.html', students=students)
        else:
            flash(
                "You have to log in with a teacher account to access that page!", 'error')
            return redirect(url_for("login"))


@app.route('/rightanswer', methods=['POST'])
def rightanswer():
    if request.method == 'POST':
        if 'username' in session:
            question = request.form['question']
            answer = request.form['answer']
            connection = mysql.connect()
            cursor = connection.cursor()
            cursor.execute(
                'select right_answer, chapter_name, subchapter from tests_questions where test_id=%s ', (question))
            rightanswer = cursor.fetchall()
            connection.close()
            if (len(rightanswer) > 0):
                if rightanswer[0][0].replace(" ", "").lower() == answer.replace(" ", "").lower():
                    if rightanswer[0][1] != rightanswer[0][2]:
                        return jsonify({'success': 'Right answer, great job! This question was from chapter: '+rightanswer[0][1]+' from the sub-chapter: '+rightanswer[0][2]+'.'})
                    else:
                        return jsonify({'success': 'Right answer, great job! This question was from chapter: '+rightanswer[0][1]+'.'})
                else:
                    if rightanswer[0][1] != rightanswer[0][2]:
                        return jsonify({'false': 'Wrong answer! Please re-study the chapter: '+rightanswer[0][1]+' and especially the sub-chapter: '+rightanswer[0][2]+'.'})
                    else:
                        return jsonify({'false': 'Wrong answer! Please re-study the chapter: '+rightanswer[0][1]+'.'})
            else:
                return jsonify({'error': 'There was a bug with our servers, please try again later!'})


@app.route('/submitanswer', methods=['POST'])
def submitanswer():
    if request.method == 'POST':
        if 'username' in session:
            score = request.form['score']
            test = request.form['test']
            if test=='levels':
                if float(score) < 40:
                    connection = mysql.connect()
                    cursor = connection.cursor()
                    cursor.execute('insert into levels (user_id,level_test) values(%s,%s)', (
                    session['id'], 'finished'))
                    connection.commit()
                    connection.close()
                    return jsonify({'info':'You were set to be a beginner because you have scored '+str(score)+'%.'})
                elif float(score) < 70:
                    connection = mysql.connect()
                    cursor = connection.cursor()
                    cursor.execute('insert into levels (user_id,level_test) values(%s,%s)', (
                    session['id'], 'finished'))

                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Quickstart'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Chapter1'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Chapter2'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Chapter3'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'BasicsTest'))

                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Quickstart_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Chapter1_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Chapter2_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Chapter3_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'BasicsTest_test',float(100)))
                    connection.commit()
                    connection.close()
                    return jsonify({'info':'You were set to be an intermediate because you have scored '+str(score)+'%.'})
                else: 
                    connection = mysql.connect()
                    cursor = connection.cursor()
                    cursor.execute('insert into levels (user_id,level_test) values(%s,%s)', (session['id'], 'finished'))

                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Quickstart'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Chapter1'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Chapter2'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Chapter3'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'BasicsTest'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Chapter4'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Chapter5'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'Chapter6'))
                    cursor.execute('insert into chapters_users_info (user_id,chapter_name) values(%s,%s)', (session['id'], 'AdvancedTest'))


                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Quickstart_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Chapter1_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Chapter2_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Chapter3_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'BasicsTest_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Chapter4_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Chapter5_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'Chapter6_test',float(100)))
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], 'AdvancedTest_test',float(100)))
                    connection.commit()
                    connection.close()
                    return jsonify({'info':'You were set to be an expert because you have scored '+str(score)+'%.'})
            else:
                if float(score) >= 60:
                    connection = mysql.connect()
                    cursor = connection.cursor()
                    cursor.execute('insert into tests_users_info (user_id,test_name,score) values(%s,%s,%s)', (session['id'], test, float(score)))
                    connection.commit()
                    connection.close()
                    return jsonify({'success': 'You have passed the '+test.replace("_", " ").replace('Chapter', 'Chapter ').replace('Test_test', ' test')+' with a score of: '+str(score)+'%.'})
                else:
                    return jsonify({'error': 'You have failed the '+test.replace("_", " ").replace('Chapter', 'Chapter ').replace('Test_test', ' test')+' with a score of: '+str(score)+'%. You have to score over 60% to pass the test! Try again later...'})


@app.route('/leveltest', methods=['POST'])
def leveltest():
    if request.method == 'POST':
        if 'username' in session:
            if request.form['answer'] == 'no':
                connection = mysql.connect()
                cursor = connection.cursor()
                cursor.execute('insert into levels (user_id,level_test) values(%s,%s)', (
                    session['id'], 'cancel'))
                connection.commit()
                connection.close()
                return jsonify({'cancel':'You were assigned to be a beginner!'})


if __name__ == '__main__':
    app.run(debug=True)
