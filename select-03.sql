---Знайти середній бал у групах з певного предмета.
SELECT gr.id, gr.group_name, sub.subject_name, AVG(g.grade) AS average_grade 
FROM groups gr
JOIN grades g ON g.subject_id = gr.id 
JOIN subjects AS sub ON sub.id = g.subject_id
WHERE sub.subject_name = '>>>'
GROUP BY gr.id, gr.group_name
; 