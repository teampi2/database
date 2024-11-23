-- -----------------------------------------------------
-- Inserir anúncio para a classe 1
-- -----------------------------------------------------
INSERT INTO `localdb`.`announcement` (`title`, `content`, `user_id`, `class_id`) VALUES
('Aviso Importante - Aula Cancelada', 'Informamos que a aula de amanhã está cancelada devido a problemas de agenda. A próxima aula será na terça-feira da próxima semana.', 1, 1),
('Aviso - Prova de Programação', 'Lembramos que a prova de programação ocorrerá na próxima sexta-feira. Preparem-se!', 1, 1);


-- -----------------------------------------------------
-- Inserir anúncio para a classe 2
-- -----------------------------------------------------
INSERT INTO `localdb`.`announcement` (`title`, `content`, `user_id`, `class_id`) VALUES
('Aviso - Alteração no Horário de Aula', 'A partir da próxima semana, o horário da nossa aula será alterado para as 14h. Por favor, se atentem ao novo horário.', 2, 2),
('Aviso - Entrega de Trabalhos', 'Lembramos a todos que o prazo para a entrega do trabalho é até o final do mês. Não deixem para última hora.', 2, 2);
