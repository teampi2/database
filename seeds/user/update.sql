-- -----------------------------------------------------
-- Atualizar o papel (role) de um usuário
-- -----------------------------------------------------
UPDATE `localdb`.`user`
SET `role` = 'coordinator'
WHERE `email` = 'joao.pedro@example.com';


-- -----------------------------------------------------
-- Atualizar a senha de um usuário pelo email
-- -----------------------------------------------------
UPDATE `localdb`.`user`
SET `password` = 'new_hashed_password_123'
WHERE `email` = 'lucas.martins@example.com';


-- -----------------------------------------------------
-- Atualizar todos os monitores para a função "scholarship"
-- -----------------------------------------------------
UPDATE `localdb`.`user`
SET `role` = 'scholarship'
WHERE `role` = 'monitor';
