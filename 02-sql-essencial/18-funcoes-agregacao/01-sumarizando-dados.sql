-- 01-sumarizando-dados.sql
-- Objetivo: Demonstrar como calcular totais, médias e extremos utilizando funções de agregação

USE fullcycle;

-- Exemplo 1: COUNT (Contagem de Registros)
-- Objetivo: Descobrir o volume do catálogo. O DISTINCT garante que não contaremos marcas repetidas.
SELECT 
    COUNT(id) AS total_produtos_cadastrados,
    COUNT(DISTINCT marca_produto) AS total_marcas_unicas
FROM 
    produtos;


-- Exemplo 2: SUM e AVG (Soma e Média)
-- Objetivo: Avaliar o volume físico do estoque e a média de itens. 
-- Nota: Envolvemos o AVG em um ROUND para não recebermos uma dízima periódica gigante.
SELECT 
    SUM(quantidade) AS volume_total_estoque_fisico,
    ROUND(AVG(quantidade), 2) AS media_itens_por_produto
FROM 
    produtos;


-- Exemplo 3: MAX e MIN (Máximos e Mínimos)
-- Objetivo: Identificar os limites do nosso estoque de forma rápida, sem precisar ordenar toda a tabela.
SELECT 
    MAX(quantidade) AS maior_estoque_registrado,
    MIN(quantidade) AS menor_estoque_registrado
FROM 
    produtos;


-- Exemplo 4: Dashboard Completo (Agregação combinada com GROUP BY)
-- Objetivo: Em vez de ver o cenário geral, queremos essas métricas divididas por Status do Produto.
-- Essa é a query clássica que alimenta os "cards" de resumo no topo de um sistema gerencial.
SELECT 
    status_produto,
    COUNT(id) AS variedade_de_itens,
    SUM(quantidade) AS total_itens_fisicos,
    MAX(quantidade) AS pico_maximo_estoque,
    ROUND(AVG(quantidade), 1) AS media_estoque
FROM 
    produtos
GROUP BY 
    status_produto;