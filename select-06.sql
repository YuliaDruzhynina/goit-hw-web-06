---Знайти список студентів у певній групі.
SELECT st.id, st.first_name, st.last_name, gr.group_name
FROM students st
JOIN groups gr ON gr.student_id = st.id 
WHERE gr.group_name = ">>>";