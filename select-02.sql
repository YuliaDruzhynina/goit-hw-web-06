SELECT s.id, s.first_name, s.last_name, sub.name, AVG(g.grade) AS average_grade 
FROM students s
JOIN grades g ON s.id = student_id
JOIN subjects AS sub ON sub.id = g.subject_id 
GROUP BY s.id, s.first_name, s.last_name, sub.name 
ORDER BY average_grade DESC
LIMIT 1;
