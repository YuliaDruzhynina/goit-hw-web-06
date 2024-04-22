---Середній бал, який певний викладач ставить певному студентові.
SELECT tch.teacher_name, st.id AS student_id, st.first_name, st.last_name, AVG(g.grade)
FROM grades g
JOIN teachers tch ON tch.id = g.teacher_id 
JOIN students st ON st.id = g.student_id 
WHERE tch.teacher_name = 'Тарас Дахно' AND st.id = '4' 
GROUP BY tch.id, st.id;