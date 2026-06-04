-- 02-inserts-teste.sql
-- Objetivo: Popular as tabelas com dados iniciais para testes de consulta

USE fullcycle;

-- Adição de itens na tabela de colaboradores
INSERT INTO colaboradores (nome_colaborador, email_colaborador, funcao_colaborador, status_colaborador)
VALUES  ('Carlos.Silva', 'carlos.silva@gmail.com', 'Assistente', 'Ativo'),
        ('Gustavo.Lopes', 'gustavo.lopes@gmail.com', 'Analista', 'Ativo'),
        ('Bruno.Almeida', 'bruno.almeida@gmail.com', 'Lider', 'Inativo'),
        ('Matheus.Miguel', 'matheus.miguel@gmail.com', 'Gerente', 'Ativo');

-- Adição de itens na tabela de produtos        
INSERT INTO produtos (nome_produto, marca_produto, status_produto, id_colaborador)
VALUES ('Biscoito Maizena', 'Nestle', 'Consumo', 1),
       ('Sabao em Barra', 'Ype', 'Consumo', 2),
       ('Melancia', 'Benassi', 'Revisao', 3),
       ('Energetico', 'Monster', 'Consumo', 4);