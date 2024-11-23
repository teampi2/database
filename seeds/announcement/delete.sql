-- -----------------------------------------------------
-- Remover um anúncio por ID
-- -----------------------------------------------------
DELETE FROM `localdb`.`announcement` WHERE `id` = 1;


-- -----------------------------------------------------
-- Remover todos os anúncios de uma classe
-- -----------------------------------------------------
DELETE FROM `localdb`.`announcement` WHERE `class_id` = 1;


-- -----------------------------------------------------
-- Remover anúncios antigos (com data de criação anterior a 2024-11-01)
-- -----------------------------------------------------
DELETE FROM `localdb`.`announcement` WHERE `created_at` < '2024-11-01';


-- -----------------------------------------------------
-- Remover todos os anúncios
-- -----------------------------------------------------
DELETE FROM `localdb`.`announcement`;
