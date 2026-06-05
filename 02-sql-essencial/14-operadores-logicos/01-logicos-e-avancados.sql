-- 01-logicos-e-avancados.sql
-- Objetivo: Demonstrar o uso de operadores lógicos (AND, OR, NOT) e filtros avançados (BETWEEN, LIKE, IS NULL)

USE fullcycle;

-- Exemplo 1: AND (E lógico - Todas as condições devem ser verdadeiras)
-- Objetivo: Encontrar produtos específicos de uma marca que também tenham um bom volume em estoque.
SELECT 
    nome_produto, 
    marca_produto, 
    quantidade
FROM 
    produtos
WHERE 
    marca_produto = 'Ype' AND quantidade > 30;


-- Exemplo 2: OR (OU lógico - Pelo menos uma condição deve ser verdadeira)
-- Objetivo: Listar produtos de duas marcas específicas.
SELECT 
    nome_produto, 
    marca_produto, 
    quantidade
FROM 
    produtos
WHERE 
    marca_produto = 'Nestle' OR marca_produto = 'Camil';


-- Exemplo 3: NOT (NÃO lógico - Inverte o resultado da condição)
-- Objetivo: Trazer todos os colaboradores que NÃO estão Inativos (ou seja, os Ativos).
SELECT 
    nome_colaborador, 
    status_colaborador
FROM 
    colaboradores
WHERE 
    NOT status_colaborador = 'Inativo';


-- Exemplo 4: Combinando AND e OR com Parênteses (Precedência de Operadores)
-- Objetivo: Trazer produtos de 'Consumo' que sejam da marca 'Ype' ou 'Nestle'.
-- Nota: Os parênteses são vitais aqui! Sem eles, o banco leria a query de forma errada.
SELECT 
    nome_produto, 
    marca_produto, 
    status_produto
FROM 
    produtos
WHERE 
    status_produto = 'Consumo' 
    AND (marca_produto = 'Ype' OR marca_produto = 'Nestle');


-- Exemplo 5: BETWEEN (Entre um intervalo de valores)
-- Objetivo: Identificar produtos cujo estoque esteja dentro de uma faixa específica (ótimo para substituir ">= AND <=").
SELECT 
    nome_produto, 
    quantidade
FROM 
    produtos
WHERE 
    quantidade BETWEEN 20 AND 60;


-- Exemplo 6: LIKE (Busca por padrão de texto)
-- Objetivo: Encontrar qualquer produto que tenha a palavra "Sabao" no nome, não importando o que vem antes ou depois (%).
SELECT 
    nome_produto, 
    marca_produto
FROM 
    produtos
WHERE 
    nome_produto LIKE '%Sabao%';


-- Exemplo 7: IS NULL / IS NOT NULL (Verificação de valores nulos)
-- Objetivo: Listar colaboradores que ainda não tiveram um e-mail cadastrado (caso a coluna permitisse valores nulos).
SELECT 
    nome_colaborador, 
    email_colaborador
FROM 
    colaboradores
WHERE 
    email_colaborador IS NULL; 
    -- Para ver quem TEM email, usaríamos: email_colaborador IS NOT NULL