---Список курсів, які певному студенту читає певний викладач.
SELECT st.id AS student_id, tch.id as teacher_id, tch.teacher_name,  sub.subject_name 
FROM subjects sub 
JOIN teachers tch ON tch.id = sub.teacher_id
JOIN grades g  ON  g.teacher_id = tch.id 
JOIN students st ON g.student_id = st.id 
WHERE st.id = '10' AND tch.teacher_name = 'Тарас Дахно'
GROUP BY sub.subject_name, st.id ;