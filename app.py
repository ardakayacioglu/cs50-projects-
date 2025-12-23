from flask import Flask, render_template, request, redirect
import sqlite3
from datetime import datetime

app = Flask(__name__)

# Initialize the database
def init_db():
    conn = sqlite3.connect('database.db')
    db = conn.cursor()
    db.execute('''
        CREATE TABLE IF NOT EXISTS sessions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            start_time TEXT NOT NULL,
            end_time TEXT NOT NULL,
            duration INTEGER NOT NULL
        )
    ''')
    conn.commit()
    conn.close()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/add', methods=['GET', 'POST'])
def add():
    if request.method == 'POST':
        title = request.form['title']
        start = request.form['start']
        end = request.form['end']

        start_dt = datetime.strptime(start, '%Y-%m-%dT%H:%M')
        end_dt = datetime.strptime(end, '%Y-%m-%dT%H:%M')
        duration = int((end_dt - start_dt).total_seconds() / 60)

        conn = sqlite3.connect('database.db')
        db = conn.cursor()
        db.execute('INSERT INTO sessions (title, start_time, end_time, duration) VALUES (?, ?, ?, ?)', (title, start, end, duration))
        conn.commit()
        conn.close()

        return redirect('/list')
    return render_template('add.html')

@app.route('/list')
def list_sessions():
    conn = sqlite3.connect('database.db')
    db = conn.cursor()
    db.execute('SELECT * FROM sessions')
    sessions = db.fetchall()
    conn.close()
    return render_template('list.html', sessions=sessions)

if __name__ == '__main__':
    init_db()
    app.run()
