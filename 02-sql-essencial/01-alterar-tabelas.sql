-- 01-alterar-tabelas.sql
-- Objetivo: Demonstrar como alterar a estrutura de tabelas existentes (Adicionar colunas)

USE fullcycle;

ALTER TABLE colaboradores 
-- Adicionando uma nova coluna após a coluna email_colaborador
ADD COLUMN funcao_colaborador ENUM ('Assistente', 'Analista', 'Lider', 'Gerente') 
AFTER email_colaborador; 

ALTER TABLE produtos
-- Adicionando a coluna marca_produto após nome_produto
ADD COLUMN marca_produto VARCHAR(50) NOT NULL
AFTER nome_produto;

ALTER TABLE produtos
-- Adicionando a coluna quantidade após marca_produto
ADD COLUMN quantidade INT NOT NULL DEFAULT 0
AFTER marca_produto;