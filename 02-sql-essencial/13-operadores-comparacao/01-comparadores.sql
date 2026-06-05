-- 01-comparadores.sql
-- Objetivo: Demonstrar o uso dos operadores de comparação matemáticos na cláusula WHERE

USE fullcycle;

-- Exemplo 1: Igualdade (=)
-- Objetivo: Trazer produtos que pertençam EXATAMENTE a uma marca específica.
SELECT 
    nome_produto, 
    marca_produto, 
    quantidade
FROM 
    produtos
WHERE 
    marca_produto = 'Ype';


-- Exemplo 2: Diferença (!= ou <>)
-- Objetivo: Trazer todos os produtos, EXCETO os de uma marca específica.
-- Nota: O padrão oficial do SQL é <>, mas a maioria dos bancos modernos aceita !=
SELECT 
    nome_produto, 
    marca_produto, 
    quantidade
FROM 
    produtos
WHERE 
    marca_produto <> 'Nestle'; 


-- Exemplo 3: Maior que (>) e Menor que (<)
-- Objetivo: Identificar produtos com estoque muito alto ou muito baixo (excluindo os limites exatos).
SELECT 
    nome_produto, 
    quantidade
FROM 
    produtos
WHERE 
    quantidade > 100; -- Traz 101 para cima

SELECT 
    nome_produto, 
    quantidade
FROM 
    produtos
WHERE 
    quantidade < 20; -- Traz 19 para baixo


-- Exemplo 4: Maior ou igual (>=) e Menor ou igual (<=)
-- Objetivo: Filtrar incluindo o número limite (muito comum em regras de negócio de estoque mínimo).
SELECT 
    nome_produto, 
    quantidade
FROM 
    produtos
WHERE 
    quantidade >= 50; -- Traz do 50 para cima (inclui o 50)

SELECT 
    nome_produto, 
    quantidade
FROM 
    produtos
WHERE 
    quantidade <= 15; -- Traz do 15 para baixo (inclui o 15)