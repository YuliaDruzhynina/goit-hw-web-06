---Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT gr.group_name, sub.subject_name, st.id, g.grade, g.grade_date
FROM grades g
JOIN subjects sub ON g.subject_id = sub.id 
JOIN students st ON st.id = g.student_id 
JOIN groups gr ON st.id = gr.student_id  
WHERE gr.group_name  = '>>>' and sub.subject_name = '>>>' 
ORDER BY g.grade_date DESC 
LIMIT 1;