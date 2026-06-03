USE fullcycle;

SELECT *
FROM produtos
WHERE marca_produto IN ('Nestle', 'Ype')
AND status_produto = 'Consumo';