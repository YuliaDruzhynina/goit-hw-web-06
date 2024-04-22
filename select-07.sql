---Знайти оцінки студентів у окремій групі з певного предмета.
SELECT  gr.id AS group_id , gr.group_name, st.id AS student_id, g.grade, g.subject_id
FROM students  st
JOIN groups gr ON st.id = gr.student_id 
JOIN grades g ON st.id = g.student_id
JOIN subjects sub ON sub.id = g.subject_id
WHERE gr.id  = 3 AND sub.id = 5;