-- -----------------------------------------------------
-- Selecionar todos os estudantes
-- -----------------------------------------------------
SELECT * FROM `localdb`.`student`;


-- -----------------------------------------------------
-- Selecionar estudantes por classe
-- -----------------------------------------------------
SELECT * FROM `localdb`.`student` WHERE `class_id` = 1;


-- -----------------------------------------------------
-- Selecionar estudantes de uma escola específica
-- -----------------------------------------------------
SELECT * FROM `localdb`.`student` WHERE `school_id` = 1;


-- -----------------------------------------------------
-- Selecionar estudante por matrícula
-- -----------------------------------------------------
SELECT * FROM `localdb`.`student` WHERE `enrollment` = '20240001';


-- -----------------------------------------------------
-- Selecionar estudantes cujos nomes começam com 'A'
-- -----------------------------------------------------
SELECT * FROM `localdb`.`student` WHERE `name` LIKE 'A%';
