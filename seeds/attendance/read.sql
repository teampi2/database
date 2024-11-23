-- -----------------------------------------------------
--- Selecionar quantidade de presenças e faltas de um estudante
-- -----------------------------------------------------
SELECT
    s.id AS student_id,
    s.name AS student_name,
    s.enrollment AS student_enrollment,
    SUM(a.is_present) AS total_presences,
    COUNT(*) - SUM(a.is_present) AS total_absences,
    COUNT(*) AS total_lessons
FROM
    attendance a
INNER JOIN
    student s ON a.student_id = s.id
WHERE
    s.id = 1
GROUP BY
    s.id, s.name, s.enrollment;


-- -----------------------------------------------------
-- Selecionar relatório geral de presenças e faltas para todos os estudantes
-- -----------------------------------------------------
SELECT
    s.id AS student_id,
    s.name AS student_name,
    s.enrollment AS student_enrollment,
    SUM(a.is_present) AS total_presences,
    COUNT(*) - SUM(a.is_present) AS total_absences,
    COUNT(*) AS total_lessons
FROM
    attendance a
INNER JOIN
    student s ON a.student_id = s.id
GROUP BY
    s.id, s.name, s.enrollment
ORDER BY
    total_presences DESC, s.name ASC;


-- -----------------------------------------------------
-- Selecionar lista detalhada de presenças e faltas para um estudante
-- -----------------------------------------------------
SELECT
    a.id AS attendance_id,
    a.is_present,
    a.created_at AS attendance_created_at,
    l.id AS lesson_id,
    l.title AS lesson_title,
    l.date AS lesson_date,
    s.id AS student_id,
    s.name AS student_name
FROM
    attendance a
INNER JOIN
    lesson l ON a.lesson_id = l.id
INNER JOIN
    student s ON a.student_id = s.id
WHERE
    s.id = 1
ORDER BY
    l.date DESC;

-- -----------------------------------------------------
-- Selecionar percentual de presença de um estudante
-- -----------------------------------------------------
SELECT
    s.id AS student_id,
    s.name AS student_name,
    s.enrollment AS student_enrollment,
    ROUND(SUM(a.is_present) / COUNT(*) * 100, 2) AS presence_percentage,
    ROUND((COUNT(*) - SUM(a.is_present)) / COUNT(*) * 100, 2) AS absence_percentage
FROM
    attendance a
INNER JOIN
    student s ON a.student_id = s.id
WHERE
    s.id = 1
GROUP BY
    s.id, s.name, s.enrollment;


-- -----------------------------------------------------
-- Selecionar aulas em que o estudante estava ausente
-- -----------------------------------------------------
SELECT
    l.id AS lesson_id,
    l.title AS lesson_title,
    l.date AS lesson_date,
    s.id AS student_id,
    s.name AS student_name
FROM
    attendance a
INNER JOIN
    lesson l ON a.lesson_id = l.id
INNER JOIN
    student s ON a.student_id = s.id
WHERE
    s.id = 1
    AND a.is_present = 0
ORDER BY
    l.date DESC;
