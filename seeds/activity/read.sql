-- -----------------------------------------------------
-- Selecionar todas as atividades
-- -----------------------------------------------------
SELECT * FROM `localdb`.`activity`;


-- -----------------------------------------------------
-- Selecionar atividades por classe
-- -----------------------------------------------------
SELECT * FROM `localdb`.`activity` WHERE `class_id` = 1;


-- -----------------------------------------------------
-- Selecionar atividades por data de vencimento
-- -----------------------------------------------------
SELECT * FROM `localdb`.`activity` WHERE `due_date` < NOW();


-- -----------------------------------------------------
-- Selecionar atividade por título
-- -----------------------------------------------------
SELECT * FROM `localdb`.`activity` WHERE `title` LIKE '%Estruturas de Dados%';
