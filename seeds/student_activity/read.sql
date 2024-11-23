-- -----------------------------------------------------
-- Selecionar notas e submissões de um estudente específico
-- -----------------------------------------------------
SELECT
    sa.id AS student_activity_id,
    sa.note,
    sa.was_submitted,
    sa.submission_date,
    sa.created_at,
    sa.updated_at,
    a.id AS activity_id,
    a.title AS activity_title,
    a.due_date AS activity_due_date,
    s.id AS student_id,
    s.name AS student_name
FROM
    student_activity sa
INNER JOIN
    activity a ON sa.activity_id = a.id
INNER JOIN
    student s ON sa.student_id = s.id
WHERE
    s.id = 1
ORDER BY
    a.due_date DESC;


-- -----------------------------------------------------
-- Selecionar desempenho geral de um estudante
-- -----------------------------------------------------
SELECT
    s.id AS student_id,
    s.name AS student_name,
    ROUND(AVG(sa.note), 2) AS average_note,
    SUM(sa.was_submitted) AS total_submitted,
    COUNT(sa.id) - SUM(sa.was_submitted) AS total_not_submitted,
    COUNT(sa.id) AS total_activities
FROM
    student_activity sa
INNER JOIN
    student s ON sa.student_id = s.id
WHERE
    s.id = 1
GROUP BY
    s.id, s.name;


-- -----------------------------------------------------
-- Selecionar relatório geral de submissões e notas para todos os alunos
-- -----------------------------------------------------
SELECT
    s.id AS student_id,
    s.name AS student_name,
    ROUND(AVG(sa.note), 2) AS average_note,
    SUM(sa.was_submitted) AS total_submitted,
    COUNT(sa.id) - SUM(sa.was_submitted) AS total_not_submitted,
    COUNT(sa.id) AS total_activities
FROM
    student_activity sa
INNER JOIN
    student s ON sa.student_id = s.id
GROUP BY
    s.id, s.name
ORDER BY
    average_note DESC, total_submitted DESC;


-- -----------------------------------------------------
-- Selecionar atividades não submetidas por um estudante
-- -----------------------------------------------------
SELECT
    sa.id AS student_activity_id,
    a.id AS activity_id,
    a.title AS activity_title,
    a.due_date AS activity_due_date,
    s.id AS student_id,
    s.name AS student_name
FROM
    student_activity sa
INNER JOIN
    activity a ON sa.activity_id = a.id
INNER JOIN
    student s ON sa.student_id = s.id
WHERE
    sa.was_submitted = 0
    AND s.id = 1
ORDER BY
    a.due_date ASC;


-- -----------------------------------------------------
-- Selecionar atividades submetidas tardiamente
-- -----------------------------------------------------
SELECT
    sa.id AS student_activity_id,
    sa.submission_date,
    a.id AS activity_id,
    a.title AS activity_title,
    a.due_date AS activity_due_date,
    s.id AS student_id,
    s.name AS student_name
FROM
    student_activity sa
INNER JOIN
    activity a ON sa.activity_id = a.id
INNER JOIN
    student s ON sa.student_id = s.id
WHERE
    sa.was_submitted = 1
    AND sa.submission_date > a.due_date
ORDER BY
    sa.submission_date ASC;


-- -----------------------------------------------------
-- Selecionar percentual de submissões de um estudante
-- -----------------------------------------------------
SELECT
    s.id AS student_id,
    s.name AS student_name,
    ROUND(SUM(sa.was_submitted) / COUNT(*) * 100, 2) AS submission_percentage
FROM
    student_activity sa
INNER JOIN
    student s ON sa.student_id = s.id
WHERE
    s.id = 1
GROUP BY
    s.id, s.name;


-- -----------------------------------------------------
-- Lista de notas abaixo de um determinado valor
-- -----------------------------------------------------
SELECT
    sa.id AS student_activity_id,
    sa.note,
    a.id AS activity_id,
    a.title AS activity_title,
    s.id AS student_id,
    s.name AS student_name
FROM
    student_activity sa
INNER JOIN
    activity a ON sa.activity_id = a.id
INNER JOIN
    student s ON sa.student_id = s.id
WHERE
    sa.note < 5
ORDER BY
    sa.note ASC;


-- -----------------------------------------------------
-- Selecionar atividades submetidas sem nota
-- -----------------------------------------------------
SELECT
    sa.id AS student_activity_id,
    sa.was_submitted,
    sa.note,
    a.id AS activity_id,
    a.title AS activity_title,
    s.id AS student_id,
    s.name AS student_name
FROM
    student_activity sa
INNER JOIN
    activity a ON sa.activity_id = a.id
INNER JOIN
    student s ON sa.student_id = s.id
WHERE
    sa.was_submitted = 1
    AND sa.note IS NULL
ORDER BY
    a.due_date ASC;
