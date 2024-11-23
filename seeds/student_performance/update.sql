-- -----------------------------------------------------
-- Atualizar o desempenho do estudante com id = 1
-- -----------------------------------------------------
UPDATE `localdb`.`student_performance`
SET
  `average_grade` = 9.50,
  `attendance_count` = 30,
  `percentage_correct` = 0.95,
  `attendance_percentage` = 0.98,
  `tasks_submitted` = 22,
  `tasks_not_submitted` = 3
WHERE `student_id` = 1;
