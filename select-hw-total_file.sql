SELECT subjects.subject_name
FROM subjects
WHERE subjects.teacher_id = 3;

---Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT DISTINCT subjects.subject_name 
FROM subjects
JOIN grades ON subjects.id = grades.subject_id
WHERE grades.student_id = 5;


---Знайти студента із найвищим середнім балом з певного предмета.
SELECT st.id, st.first_name, st.last_name, AVG(g.grade) AS average_grade
FROM students AS st
JOIN grades AS g ON st.id = g.student_id 
GROUP BY st.id, st.first_name, st.last_name 
ORDER BY average_grade DESC
LIMIT 5;

---Знайти середній бал у групах з певного предмета.
SELECT gr.id, gr.group_name, sub.subject_name, AVG(g.grade) AS average_grade 
FROM groups gr
JOIN grades g ON g.subject_id = gr.id 
JOIN subjects AS sub ON sub.id = g.subject_id
WHERE sub.subject_name = '>>>'
GROUP BY gr.id, gr.group_name
; 

---Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT gr.group_name, sub.subject_name, AVG(g.grade)
FROM grades g
JOIN students st ON st.id = g.student_id 
JOIN groups as gr ON gr.student_id = st.id 
JOIN subjects sub ON g.subject_id = sub.id 
GROUP BY gr.group_name;


---Знайти які курси читає певний викладач.
SELECT tch.id AS teacher_id, tch.teacher_name, sbj.id  AS subject_id, sbj.subject_name
FROM teachers AS tch
JOIN subjects AS sbj ON sbj.teacher_id = tch.id
WHERE tch.teacher_name = ">>>";


---Знайти список студентів у певній групі.
SELECT st.id, st.first_name, st.last_name, gr.group_name
FROM students st
JOIN groups gr ON gr.student_id = st.id 
WHERE gr.group_name = ">>>";

---Знайти оцінки студентів у окремій групі з певного предмета.
SELECT  gr.id AS group_id , gr.group_name, st.id AS student_id, g.grade, g.subject_id
FROM students  st
JOIN groups gr ON st.id = gr.student_id 
JOIN grades g ON st.id = g.student_id
JOIN subjects sub ON sub.id = g.subject_id
WHERE gr.id  = 3 AND sub.id = 5;
 

---Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT tch.id, tch.teacher_name, sub.id AS subject_id, sub.subject_name, AVG(g.grade)
FROM subjects sub
JOIN teachers tch ON sub.teacher_id = tch.id 
JOIN grades g ON g.subject_id = sub.id
WHERE tch.id ='4'
GROUP BY tch.id, tch.teacher_name, sub.id, sub.subject_name;

---Знайти список курсів, які відвідує студент.
SELECT st.id, sub.subject_name, st.first_name, st.last_name 
FROM students st
JOIN grades g ON st.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id 
WHERE st.id = '4'
GROUP BY sub.subject_name
ORDER BY sub.subject_name ;


---Список курсів, які певному студенту читає певний викладач.
SELECT st.id AS student_id, tch.id	AS teacher_id, tch.teacher_name,  sub.subject_name 
FROM subjects sub 
JOIN teachers tch ON tch.id = sub.teacher_id
JOIN grades g  ON  g.teacher_id = tch.id 
JOIN students st ON g.student_id = st.id 
WHERE st.id = '10' AND tch.teacher_name = 'Тарас Дахно'
GROUP BY sub.subject_name, st.id ;

---Середній бал, який певний викладач ставить певному студентові.
SELECT tch.teacher_name, st.id AS student_id, st.first_name, st.last_name, AVG(g.grade)
FROM grades g
JOIN teachers tch ON tch.id = g.teacher_id 
JOIN students st ON st.id = g.student_id 
WHERE tch.teacher_name = 'Тарас Дахно' AND st.id = '4' 
GROUP BY tch.id, st.id;

---Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT gr.group_name, sub.subject_name, st.id, g.grade, g.grade_date
FROM grades g
JOIN subjects sub ON g.subject_id = sub.id 
JOIN students st ON st.id = g.student_id 
JOIN groups gr ON st.id = gr.student_id  
WHERE gr.group_name  = '>>>' and sub.subject_name = '>>>' 
ORDER BY g.grade_date DESC 
LIMIT 1;





