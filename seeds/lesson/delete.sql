-- -----------------------------------------------------
-- Remover uma lição pelo título
-- -----------------------------------------------------
DELETE FROM `localdb`.`lesson` WHERE `title` = 'Exploring the Solar System';


-- -----------------------------------------------------
-- Remover todas as lições de uma classe específica
-- -----------------------------------------------------
DELETE FROM `localdb`.`lesson` WHERE `class_id` = 4;


-- -----------------------------------------------------
-- Remover todas as lições de um plano de aula específico
-- -----------------------------------------------------
DELETE FROM `localdb`.`lesson` WHERE `lesson_plan_id` = 5;


-- -----------------------------------------------------
-- Remover todas as lições
-- -----------------------------------------------------
DELETE FROM `localdb`.`lesson`;
