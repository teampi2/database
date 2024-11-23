-- -----------------------------------------------------
-- Selecionar todos os usuários
-- -----------------------------------------------------
SELECT * FROM `localdb`.`user`;


-- -----------------------------------------------------
-- Selecionar um usuário pelo email
-- -----------------------------------------------------
SELECT * FROM `localdb`.`user` WHERE `email` = 'ana.clara@example.com';


-- -----------------------------------------------------
-- Selecionar usuários com a função "monitor"
-- -----------------------------------------------------
SELECT * FROM `localdb`.`user` WHERE `role` = 'monitor';


-- -----------------------------------------------------
-- Selecionar os usuários criados nas últimas 24 horas
-- -----------------------------------------------------
SELECT * FROM `localdb`.`user` WHERE `created_at` > NOW() - INTERVAL 1 DAY;
