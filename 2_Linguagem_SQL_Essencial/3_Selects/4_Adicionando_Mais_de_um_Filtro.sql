USE fullcycle;

SELECT *
FROM produtos
WHERE status_produto = 'Consumo'
AND id_colaborador = 1;