-- -----------------------------------------------------
-- Remover um estudante por matrícula
-- -----------------------------------------------------
DELETE FROM `localdb`.`student` WHERE `enrollment` = '20240030';


-- -----------------------------------------------------
-- Remover estudantes de uma classe específica
-- -----------------------------------------------------
DELETE FROM `localdb`.`student` WHERE `class_id` = 1;


-- -----------------------------------------------------
-- Remover todos os estudantes de uma escola
-- -----------------------------------------------------
DELETE FROM `localdb`.`student` WHERE `school_id` = 1;


-- -----------------------------------------------------
-- Remover todos os estudantes
-- -----------------------------------------------------
DELETE FROM `localdb`.`student`;
