---Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT tch.id, tch.teacher_name, sub.id AS subject_id, sub.subject_name, AVG(g.grade)
FROM subjects sub
JOIN teachers tch ON sub.teacher_id = tch.id 
JOIN grades g ON g.subject_id = sub.id
WHERE tch.id ='4'
GROUP BY tch.id, tch.teacher_name, sub.id, sub.subject_name;