-- -----------------------------------------------------
-- Selecionar todos os desempenhos dos estudantes da classe com id = 1
-- -----------------------------------------------------
SELECT
  sp.id,
  sp.average_grade,
  sp.attendance_count,
  sp.percentage_correct,
  sp.attendance_percentage,
  sp.tasks_submitted,
  sp.tasks_not_submitted,
  sp.created_at,
  sp.updated_at,
  s.name AS student_name
FROM `localdb`.`student_performance` sp
JOIN `localdb`.`student` s ON sp.student_id = s.id
WHERE s.class_id = 1;
