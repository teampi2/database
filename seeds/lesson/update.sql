-- -----------------------------------------------------
-- Atualizar o título de uma lição
-- -----------------------------------------------------
UPDATE `localdb`.`lesson`
SET `title` = 'Advanced Algebra Techniques'
WHERE `title` = 'Basic Algebra Concepts';


-- -----------------------------------------------------
-- Atualizar o tema de uma lição
-- -----------------------------------------------------
UPDATE `localdb`.`lesson`
SET `theme` = 'Advanced Physics'
WHERE `title` = 'Understanding Newton’s Laws';


-- -----------------------------------------------------
-- Atualizar a data de uma lição específica
-- -----------------------------------------------------
UPDATE `localdb`.`lesson`
SET `date` = '2024-12-01 09:00:00'
WHERE `title` = 'World War II Key Events';
