-- -----------------------------------------------------
-- Remover uma atividade por ID
-- -----------------------------------------------------
DELETE FROM `localdb`.`activity` WHERE `id` = 1;


-- -----------------------------------------------------
-- Remover todas as atividades de uma classe
-- -----------------------------------------------------
DELETE FROM `localdb`.`activity` WHERE `class_id` = 1;


-- -----------------------------------------------------
-- Remover atividades vencidas (passadas)
-- -----------------------------------------------------
DELETE FROM `localdb`.`activity` WHERE `due_date` < NOW();


-- -----------------------------------------------------
-- Remover todas as atividades
-- -----------------------------------------------------
DELETE FROM `localdb`.`activity`;
