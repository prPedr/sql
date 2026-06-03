USE fullcycle;

ALTER TABLE colaboradores # Selecao da tabela desejada
ADD COLUMN funcao_colaborador ENUM ('Assistente', 'Analista', 'Lider', 'Gerente') # Adicionando uma nova coluna
AFTER email_colaborador; # A nova coluna será adicionando apos a coluna email_colaborador

ALTER TABLE produtos
ADD COLUMN marca_produto VARCHAR(50) NOT NULL
AFTER nome_produto;
