-- 03-right-join.sql
-- Objetivo: Retornar todos os registros da tabela à direita, e os correspondentes da tabela à esquerda

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
RIGHT JOIN
    produtos ON colaboradores.id = produtos.id_colaborador;