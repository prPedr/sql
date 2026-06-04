-- 01-inner-join.sql
-- Objetivo: Retornar registros que possuem correspondência em ambas as tabelas

USE fullcycle;

SELECT
    colaboradores.id,
    colaboradores.nome_colaborador,
    colaboradores.email_colaborador,
    produtos.id AS produto_id, -- Renomeando ID para não causar conflito com o ID de colaboradores
    produtos.marca_produto,
    produtos.status_produto
FROM
    colaboradores
INNER JOIN
    produtos ON colaboradores.id = produtos.id_colaborador;