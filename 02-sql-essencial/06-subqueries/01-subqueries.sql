-- 01-subqueries.sql
-- Objetivo: Demonstrar o uso de consultas aninhadas (uma query dentro da outra)

USE fullcycle;

-- Exemplo 1: Subquery na cláusula WHERE (Filtragem baseada em outra tabela)
-- Objetivo: Listar todos os produtos que são gerenciados apenas por colaboradores 'Ativos'
SELECT 
    nome_produto, 
    marca_produto, 
    status_produto
FROM 
    produtos
WHERE 
    id_colaborador IN (
        SELECT id 
        FROM colaboradores 
        WHERE status_colaborador = 'Ativo'
    );


-- Exemplo 2: Subquery com Função de Agregação
-- Objetivo: Descobrir quais produtos possuem uma quantidade em estoque MAIOR que a média geral de todos os produtos
SELECT 
    nome_produto, 
    marca_produto, 
    quantidade
FROM 
    produtos
WHERE 
    quantidade > (
        SELECT AVG(quantidade) 
        FROM produtos
    );


-- Exemplo 3: Subquery na cláusula SELECT (Coluna Calculada)
-- Objetivo: Trazer o nome de todos os colaboradores e calcular o total de itens que cada um gerencia, sem usar JOIN
SELECT 
    nome_colaborador,
    funcao_colaborador,
    (
        SELECT SUM(quantidade) 
        FROM produtos 
        WHERE id_colaborador = colaboradores.id
    ) AS total_itens_estoque
FROM 
    colaboradores;