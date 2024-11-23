-- -----------------------------------------------------
-- Remover um plano de aula pelo título
-- -----------------------------------------------------
DELETE FROM `localdb`.`lesson_plan` WHERE `title` = 'The Solar System';


-- -----------------------------------------------------
-- Remover todos os planos de aula associados a uma escola específica
-- -----------------------------------------------------
DELETE FROM `localdb`.`lesson_plan` WHERE `school_id` = 4;


-- -----------------------------------------------------
-- Remover todos os planos de aula
-- -----------------------------------------------------
DELETE FROM `localdb`.`lesson_plan`;
