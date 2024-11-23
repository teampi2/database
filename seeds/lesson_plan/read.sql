-- -----------------------------------------------------
-- Selecionar todos os planos de aula
-- -----------------------------------------------------
SELECT * FROM `localdb`.`lesson_plan`;


-- -----------------------------------------------------
-- Selecionar planos de aula de uma classe específica
-- -----------------------------------------------------
SELECT * FROM `localdb`.`lesson_plan` WHERE `class_id` = 2;


-- -----------------------------------------------------
-- Selecionar planos de aula associados a uma escola específica
-- -----------------------------------------------------
SELECT * FROM `localdb`.`lesson_plan` WHERE `school_id` = 3;


-- -----------------------------------------------------
-- Selecionar planos de aula com "Newton" no título
-- -----------------------------------------------------
SELECT * FROM `localdb`.`lesson_plan` WHERE `title` LIKE '%Newton%';
