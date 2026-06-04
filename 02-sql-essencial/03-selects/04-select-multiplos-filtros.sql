-- 04-select-multiplos-filtros.sql
-- Objetivo: Utilizar múltiplos filtros na mesma consulta combinando AND

USE fullcycle;

SELECT *
FROM produtos
WHERE status_produto = 'Consumo'
AND id_colaborador = 1;
