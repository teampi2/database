-- -----------------------------------------------------
-- Atualizar o nome de um estudante específico
-- -----------------------------------------------------
UPDATE `localdb`.`student`
SET `name` = 'Alice Oliveira'
WHERE `enrollment` = '20240001';


-- -----------------------------------------------------
-- Atualizar a matrícula de um estudante específico
-- -----------------------------------------------------
UPDATE `localdb`.`student`
SET `enrollment` = '20240099'
WHERE `name` = 'Bob Santos';


-- -----------------------------------------------------
-- Atualizar a classe de um estudante
-- -----------------------------------------------------
UPDATE `localdb`.`student`
SET `class_id` = 3
WHERE `enrollment` = '20240002';
