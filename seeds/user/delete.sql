-- -----------------------------------------------------
-- Remover um usuário pelo email
-- -----------------------------------------------------
DELETE FROM `localdb`.`user` WHERE `email` = 'rafael.almeida@example.com';


-- -----------------------------------------------------
-- Remover todos os usuários com o papel "scholarship"
-- -----------------------------------------------------
DELETE FROM `localdb`.`user` WHERE `role` = 'scholarship';


-- -----------------------------------------------------
-- Remover todos os usuários
-- -----------------------------------------------------
DELETE FROM `localdb`.`user`;
