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