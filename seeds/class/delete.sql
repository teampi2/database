-- -----------------------------------------------------
-- Remover uma classe pelo nome
-- -----------------------------------------------------
DELETE FROM `localdb`.`class` WHERE `name` = '4º Ano B';


-- -----------------------------------------------------
-- Remover todas as classes de uma escola específica
-- -----------------------------------------------------
DELETE FROM `localdb`.`class` WHERE `school_id` = 5;


-- -----------------------------------------------------
-- Remover todas as classes
-- -----------------------------------------------------
DELETE FROM `localdb`.`class`;
