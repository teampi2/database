-- -----------------------------------------------------
-- Atualizar o email e telefone de uma escola pelo CNPJ
-- -----------------------------------------------------
UPDATE `localdb`.`school`
SET
  `email` = 'novocontato@saber.com.br',
  `phone` = '+55 (85) 9999-8888'
WHERE `cnpj` = '12.345.678/0001-90';


-- -----------------------------------------------------
-- Atualizar o nome de todas as escolas em São Paulo para incluir "(SP)"
-- -----------------------------------------------------
UPDATE `localdb`.`school`
SET `name` = CONCAT(`name`, ' (SP)')
WHERE `address` LIKE '%São Paulo%';
