-- 05-select-clausula-in.sql
-- Objetivo: Filtrar dados verificando se um valor corresponde a qualquer valor em uma lista (IN)

USE fullcycle;

SELECT *
FROM produtos
WHERE marca_produto IN ('Nestle', 'Ype')
AND status_produto = 'Consumo';