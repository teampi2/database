-- -----------------------------------------------------
-- Remover uma escola pelo CNPJ
-- -----------------------------------------------------
DELETE FROM `localdb`.`school` WHERE `cnpj` = '23.456.789/0005-01';


-- -----------------------------------------------------
-- Remover todas as escolas em Salvador
-- -----------------------------------------------------
DELETE FROM `localdb`.`school` WHERE `address` LIKE '%Salvador%';


-- -----------------------------------------------------
-- Remover todas as escolas
-- -----------------------------------------------------
DELETE FROM `localdb`.`school`;
