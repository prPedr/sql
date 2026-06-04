-- 02-left-join.sql
-- Objetivo: Retornar todos os registros da tabela à esquerda, e os correspondentes da tabela à direita

USE fullcycle;

SELECT
    colaboradores.id,
    colaboradores.nome_colaborador,
    colaboradores.email_colaborador,
    produtos.id AS produto_id, 
    produtos.marca_produto,
    produtos.status_produto
FROM
    colaboradores
LEFT JOIN
    produtos ON colaboradores.id = produtos.id_colaborador;