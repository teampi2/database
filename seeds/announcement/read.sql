-- -----------------------------------------------------
-- Selecionar todos os anúncios
-- -----------------------------------------------------
SELECT * FROM `localdb`.`announcement`;


-- -----------------------------------------------------
-- Selecionar anúncios por classe
-- -----------------------------------------------------
SELECT * FROM `localdb`.`announcement` WHERE `class_id` = 1;


-- -----------------------------------------------------
-- Selecionar anúncios por título
-- -----------------------------------------------------
SELECT * FROM `localdb`.`announcement` WHERE `title` LIKE '%Aviso%';


-- -----------------------------------------------------
-- Selecionar anúncios por data de criação
-- -----------------------------------------------------
SELECT * FROM `localdb`.`announcement` WHERE `created_at` > '2024-11-01';
