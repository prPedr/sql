-- 01-order-limit-offset.sql
-- Objetivo: Demonstrar ordenação de resultados e paginação de dados (LIMIT e OFFSET)

USE fullcycle;

-- Exemplo 1: ORDER BY (Ordenação simples e múltipla)
-- Objetivo: Listar produtos ordenados pela quantidade em estoque (do maior para o menor - DESC) 
-- e, em caso de empate na quantidade, ordenar alfabeticamente pelo nome (ASC).
SELECT 
    nome_produto, 
    marca_produto, 
    quantidade 
FROM 
    produtos
ORDER BY 
    quantidade DESC, 
    nome_produto ASC;


-- Exemplo 2: LIMIT (Top N resultados)
-- Objetivo: Descobrir quais são os 5 produtos com a MENOR quantidade em estoque para priorizar a compra.
SELECT 
    nome_produto, 
    marca_produto, 
    quantidade 
FROM 
    produtos
ORDER BY 
    quantidade ASC
LIMIT 5;


-- Exemplo 3: LIMIT com OFFSET (Paginação clássica de APIs)
-- Objetivo: Simular a paginação de uma tela no frontend que exibe 5 itens por página.

-- Simulando a requisição da "Página 1" (Começa do registro 0 e traz 5)
SELECT 
    id,
    nome_produto, 
    marca_produto,
    quantidade 
FROM 
    produtos
ORDER BY 
    id ASC
LIMIT 5 OFFSET 0;

-- Simulando a requisição da "Página 2" (Pula os 5 primeiros e traz os próximos 5)
SELECT 
    id,
    nome_produto, 
    marca_produto,
    quantidade 
FROM 
    produtos
ORDER BY 
    id ASC
LIMIT 5 OFFSET 5;

-- Simulando a requisição da "Página 3" (Pula os 10 primeiros e traz os próximos 5)
SELECT 
    id,
    nome_produto, 
    marca_produto,
    quantidade 
FROM 
    produtos
ORDER BY 
    id ASC
LIMIT 5 OFFSET 10;