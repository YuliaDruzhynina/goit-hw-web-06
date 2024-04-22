SELECT st.id, st.first_name, st.last_name, AVG(g.grade) AS average_grade
FROM students AS st
JOIN grades AS g ON st.id = g.student_id 
GROUP BY st.id, st.first_name, st.last_name 
ORDER BY average_grade DESC
LIMIT 5;