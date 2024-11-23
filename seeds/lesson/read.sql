-- -----------------------------------------------------
-- Selecionar todas as lições
-- -----------------------------------------------------
SELECT * FROM `localdb`.`lesson`;


-- -----------------------------------------------------
-- Selecionar lições de uma classe específica
-- -----------------------------------------------------
SELECT * FROM `localdb`.`lesson` WHERE `class_id` = 3;


-- -----------------------------------------------------
-- Selecionar lições de uma escola específica
-- -----------------------------------------------------
SELECT * FROM `localdb`.`lesson` WHERE `school_id` = 1;


-- -----------------------------------------------------
-- Selecionar lições por tema
-- -----------------------------------------------------
SELECT * FROM `localdb`.`lesson` WHERE `theme` = 'Physics';


-- -----------------------------------------------------
-- Selecionar lições programadas após uma data específica
-- -----------------------------------------------------
SELECT * FROM `localdb`.`lesson` WHERE `date` > '2024-11-26 00:00:00';
