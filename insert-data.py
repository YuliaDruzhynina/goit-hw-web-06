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
            INSERT INTO students (first_name, last_name, phone, email)
            VALUES (?, ?, ?, ?)
        ''', students_data)

def insert_data_teachers():
    for _ in range(5):
        teacher_data = (fake.name(), fake.email(), fake.phone_number())
        cursor.execute('''
            INSERT INTO teachers (name, email, phone)
            VALUES (?, ?, ?)
        ''', teacher_data)

def insert_data_groups():
    for _ in range(3):
        group_data = (fake.word(), random.randint(1, 30))
        cursor.execute('''
            INSERT INTO groups (name, student_id)
            VALUES (?, ?)
        ''', group_data)

def insert_data_subjects():
    for _ in range(5):
        subject_data = (fake.word(), random.randint(1, 5))
        cursor.execute('''
            INSERT INTO subjects (name, teacher_id)
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

insert_data_students()
insert_data_groups()
insert_data_teachers()
insert_data_grades()
insert_data_subjects()

conn.commit()
conn.close()
       


