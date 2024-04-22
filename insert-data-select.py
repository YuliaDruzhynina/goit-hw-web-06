import sqlite3
import random
from faker import Faker

fake = Faker('uk_UA')

conn = sqlite3.connect("/Users/juliia/Desktop/hw-goit-web-06/goit-web-06")
cursor = conn.cursor()


def insert_data_students():
    for _ in range(30):
        students_data = (fake.first_name(), fake.last_name(), fake.phone_number(), fake.email())
        cursor.execute('''
            INSERT INTO students (first_name, last_name, student_phone, student_email)
            VALUES (?, ?, ?, ?)
        ''', students_data)

def insert_data_teachers():
    for _ in range(5):
        teacher_data = (fake.name(), fake.email(), fake.phone_number())
        cursor.execute('''
            INSERT INTO teachers (teacher_name, teacher_email, teacher_phone)
            VALUES (?, ?, ?)
        ''', teacher_data)

def insert_data_groups():
    for _ in range(3):
        group_data = (fake.word(), random.randint(1, 30))
        cursor.execute('''
            INSERT INTO groups (group_name, student_id)
            VALUES (?, ?)
        ''', group_data)

def insert_data_subjects():
    for _ in range(5):
        subject_data = (fake.word(), random.randint(1, 5))
        cursor.execute('''
            INSERT INTO subjects (subject_name, teacher_id)
            VALUES (?, ?)
        ''', subject_data)

def insert_data_grades():
    for student_id in range(1,31):
        for subject_id in range(1,6):
            for _ in range(20):
                grade_data = (random.randint(1, 100), fake.date_this_decade(), random.randint(1, 5),random.randint(1, 30), random.randint(1, 5))
                cursor.execute('''
                    INSERT INTO grades (grade, grade_date, teacher_id, student_id, subject_id)
                    VALUES (?, ?, ?, ?, ?)
                ''', grade_data)

def execute_query(sql: str) -> list:
    with sqlite3.connect('/Users/juliia/Desktop/hw-goit-web-06/goit-web-06') as con:
        cur = con.cursor()
        cur.execute(sql)
        return cur.fetchall()
#hw-07. Знайти оцінки студентів у окремій групі з певного предмета.
sql = """SELECT  gr.id AS group_id , gr.group_name, st.id AS student_id, g.grade, g.subject_id
FROM students  st
JOIN groups gr ON st.id = gr.student_id
JOIN grades g ON st.id = g.student_id
JOIN subjects sub ON sub.id = g.subject_id
WHERE gr.id  = 3 AND sub.id = 5;
"""

insert_data_students()
insert_data_groups()
insert_data_teachers()
insert_data_grades()
insert_data_subjects()

print(execute_query(sql))

conn.commit()
conn.close()
       


