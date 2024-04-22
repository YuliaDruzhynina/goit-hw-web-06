---Знайти список курсів, які відвідує студент.
SELECT st.id, sub.subject_name, st.first_name, st.last_name 
FROM students st
JOIN grades g ON st.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id 
WHERE st.id = '4'
GROUP BY sub.subject_name
ORDER BY sub.subject_name ;