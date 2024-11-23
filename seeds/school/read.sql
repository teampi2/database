-- -----------------------------------------------------
-- Selecionar todas as escolas
-- -----------------------------------------------------
SELECT * FROM `localdb`.`school`;


-- -----------------------------------------------------
-- Selecionar escola pelo CNPJ
-- -----------------------------------------------------
SELECT * FROM `localdb`.`school` WHERE `cnpj` = '12.345.678/0001-90';


-- -----------------------------------------------------
-- Selecionar escolas de Fortaleza
-- -----------------------------------------------------
SELECT * FROM `localdb`.`school` WHERE `address` LIKE '%Fortaleza%';
