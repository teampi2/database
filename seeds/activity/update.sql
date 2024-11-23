-- -----------------------------------------------------
-- Atualizar o título de uma atividade
-- -----------------------------------------------------
UPDATE `localdb`.`activity`
SET `title` = 'Atividade 1 - Algoritmos Básicos'
WHERE `id` = 1;


-- -----------------------------------------------------
-- Atualizar a data de vencimento de uma atividade
-- -----------------------------------------------------
UPDATE `localdb`.`activity`
SET `due_date` = '2024-12-05 23:59:00'
WHERE `id` = 2;


-- -----------------------------------------------------
-- Atualizar a descrição de uma atividade
-- -----------------------------------------------------
UPDATE `localdb`.`activity`
SET `description` = 'Resolução de problemas utilizando algoritmos de ordenação e busca.'
WHERE `id` = 1;
