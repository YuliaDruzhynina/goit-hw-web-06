---Знайти які курси читає певний викладач.
SELECT tch.id AS teacher_id, tch.teacher_name, sbj.id  AS subject_id, sbj.subject_name
FROM teachers AS tch
JOIN subjects AS sbj ON sbj.teacher_id = tch.id
WHERE tch.teacher_name = ">>>";