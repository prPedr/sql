-- 01-deletando-dados.sql
-- Objetivo: Demonstrar a exclusão física de registros (Sempre utilize a cláusula WHERE!)

USE fullcycle;

-- Exemplo 1: Exclusão simples por ID (Padrão em rotas DELETE de APIs)
-- Objetivo: Remover um produto específico que foi cadastrado por engano.
DELETE FROM produtos
WHERE id = 5;


-- Exemplo 2: Exclusão com múltiplas condições
-- Objetivo: Fazer uma limpeza no banco, apagando produtos marcados para 'Revisao' que estejam com estoque zerado.
DELETE FROM produtos
WHERE status_produto = 'Revisao' AND quantidade = 0;


-- Exemplo 3: Exclusão em massa utilizando a cláusula IN
-- Objetivo: Apagar vários registros de uma só vez passando uma lista de IDs.
DELETE FROM produtos
WHERE id IN (10, 11, 12);