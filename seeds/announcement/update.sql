-- -----------------------------------------------------
-- Atualizar o conteúdo de um anúncio
-- -----------------------------------------------------
UPDATE `localdb`.`announcement`
SET `content` = 'A aula de amanhã será adiada para a próxima semana. Mais detalhes em breve.'
WHERE `id` = 1;


-- -----------------------------------------------------
-- Atualizar o título de um anúncio
-- -----------------------------------------------------
UPDATE `localdb`.`announcement`
SET `title` = 'Aviso Urgente - Mudança de Data'
WHERE `id` = 2;


-- -----------------------------------------------------
-- Atualizar os dados de um anúncio
-- -----------------------------------------------------
UPDATE `localdb`.`announcement`
SET `content` = 'O trabalho será entregue por meio de e-mail. Não será aceito o envio via outra plataforma.'
WHERE `id` = 3;
