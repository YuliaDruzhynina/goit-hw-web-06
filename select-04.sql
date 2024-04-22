---Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT gr.group_name, sub.subject_name, AVG(g.grade)
FROM grades g
JOIN students st ON st.id = g.student_id 
JOIN groups as gr ON gr.student_id = st.id 
JOIN subjects sub ON g.subject_id = sub.id 
GROUP BY gr.group_name;
