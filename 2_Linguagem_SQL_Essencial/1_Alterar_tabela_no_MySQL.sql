USE fullcycle;

ALTER TABLE usuarios # Selecionar a tebala que deseja alterar
ADD COLUMN tipo_usuario ENUM('Admin', 'Visualizar', 'Comum') # Adiconando uma nova coluna na tela com valor ENUM
AFTER email_usuario # Adicionando a nova colula depois da coluna email_usuario
