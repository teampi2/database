-- -----------------------------------------------------
-- Selecionar todas as classes
-- -----------------------------------------------------
SELECT * FROM `localdb`.`class`;


-- -----------------------------------------------------
-- Selecionar classes de um turno específico
-- -----------------------------------------------------
SELECT * FROM `localdb`.`class` WHERE `shift` = 'morning';


-- -----------------------------------------------------
-- Selecionar classes de um determinado ano letivo
-- -----------------------------------------------------
SELECT * FROM `localdb`.`class` WHERE `academic_year` = '2024.1';


-- -----------------------------------------------------
-- Selecionar classes de uma escola específica
-- -----------------------------------------------------
SELECT * FROM `localdb`.`class` WHERE `school_id` = 3;
