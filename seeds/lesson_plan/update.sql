-- -----------------------------------------------------
-- Atualizar o título de um plano de aula
-- -----------------------------------------------------
UPDATE `localdb`.`lesson_plan`
SET `title` = 'Introduction to Advanced Algebra'
WHERE `title` = 'Introduction to Algebra';


-- -----------------------------------------------------
-- Atualizar a descrição de um plano de aula
-- -----------------------------------------------------
UPDATE `localdb`.`lesson_plan`
SET `description` = 'A deeper exploration of the laws of motion.'
WHERE `title` = 'Physics: Newton’s Laws';


-- -----------------------------------------------------
-- Atualizar os materiais necessários de todos os planos para incluir "whiteboard"
-- -----------------------------------------------------
UPDATE `localdb`.`lesson_plan`
SET `materials` = CONCAT(`materials`, ', whiteboard');
