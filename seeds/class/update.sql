-- -----------------------------------------------------
-- Atualizar o turno de uma classe
-- -----------------------------------------------------
UPDATE `localdb`.`class`
SET `shift` = 'afternoon'
WHERE `name` = '1º Ano A';


-- -----------------------------------------------------
-- Atualizar o ano letivo de todas as classes para "2024.2"
-- -----------------------------------------------------
UPDATE `localdb`.`class`
SET `academic_year` = '2024.2';


-- -----------------------------------------------------
-- Atualizar a escola associada a uma classe
-- -----------------------------------------------------
UPDATE `localdb`.`class`
SET `school_id` = 2
WHERE `name` = '5º Ano A';
