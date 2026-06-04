-- 01-group-by.sql
-- Objetivo: Demonstrar o agrupamento de dados e o uso de funções de agregação (SUM, COUNT)

USE fullcycle;

-- Exemplo 1: Qual é a quantidade total em estoque por marca?
-- O agrupamento é feito pela marca, somando as quantidades de todos os produtos que pertencem a ela.
SELECT 
    marca_produto, 
    COUNT(id) AS total_variedades,
    SUM(quantidade) AS volume_total_estoque
FROM 
    produtos
GROUP BY 
    marca_produto;


-- Exemplo 2: Qual o volume de itens gerenciados por cada colaborador?
-- Aqui juntamos o GROUP BY com o INNER JOIN para exibir o nome do colaborador em vez do ID.
SELECT 
    colaboradores.nome_colaborador,
    SUM(produtos.quantidade) AS total_itens_gerenciados
FROM 
    colaboradores
INNER JOIN 
    produtos ON colaboradores.id = produtos.id_colaborador
GROUP BY 
    colaboradores.nome_colaborador;


-- Exemplo 3: Quais colaboradores gerenciam mais de 100 itens no total?
-- Usamos o HAVING para filtrar os resultados DEPOIS que o agrupamento (GROUP BY) foi feito.
SELECT 
    colaboradores.nome_colaborador,
    SUM(produtos.quantidade) AS total_itens_gerenciados
FROM 
    colaboradores
INNER JOIN 
    produtos ON colaboradores.id = produtos.id_colaborador
GROUP BY 
    colaboradores.nome_colaborador
HAVING 
    total_itens_gerenciados > 100;