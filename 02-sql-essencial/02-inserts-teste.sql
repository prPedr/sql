-- 02-inserts-teste.sql
-- Objetivo: Popular as tabelas com dados iniciais para testes de consulta

USE fullcycle;

-- Adição de itens na tabela de colaboradores
INSERT INTO colaboradores (nome_colaborador, email_colaborador, funcao_colaborador, status_colaborador)
VALUES  ('Carlos.Silva', 'carlos.silva@gmail.com', 'Assistente', 'Ativo'),
        ('Gustavo.Lopes', 'gustavo.lopes@gmail.com', 'Analista', 'Ativo'),
        ('Bruno.Almeida', 'bruno.almeida@gmail.com', 'Lider', 'Inativo'),
        ('Matheus.Miguel', 'matheus.miguel@gmail.com', 'Gerente', 'Ativo');

-- Adição de 20 itens na tabela de produtos com a nova coluna 'quantidade'
INSERT INTO produtos (nome_produto, marca_produto, quantidade, status_produto, id_colaborador)
VALUES ('Biscoito Maizena', 'Nestle', 50, 'Consumo', 1),
       ('Sabao em Barra', 'Ype', 30, 'Consumo', 2),
       ('Melancia', 'Benassi', 15, 'Revisao', 3),
       ('Energetico', 'Monster', 100, 'Consumo', 4),
       ('Arroz Integral', 'Tio Joao', 25, 'Consumo', 1),
       ('Feijao Carioca', 'Camil', 40, 'Consumo', 2),
       ('Macarrao Spaghetti', 'Renata', 60, 'Consumo', 3),
       ('Azeite de Oliva', 'Gallo', 12, 'Consumo', 4),
       ('Cafe Torrado', 'Pilao', 35, 'Consumo', 1),
       ('Acucar Refinado', 'Uniao', 50, 'Consumo', 2),
       ('Leite Integral', 'Itambe', 80, 'Consumo', 3),
       ('Detergente Liquido', 'Ype', 45, 'Consumo', 4),
       ('Esponja de Aco', 'Assolan', 200, 'Consumo', 1),
       ('Papel Higienico', 'Neve', 90, 'Consumo', 2),
       ('Creme Dental', 'Colgate', 120, 'Consumo', 3),
       ('Sabonete em Barra', 'Dove', 75, 'Consumo', 4),
       ('Amaciante de Roupas', 'Downy', 18, 'Consumo', 1),
       ('Desinfetante', 'Pinho Sol', 22, 'Consumo', 2),
       ('Oleo de Soja', 'Liza', 30, 'Consumo', 3),
       ('Sal Refinado', 'Lebre', 15, 'Consumo', 4);