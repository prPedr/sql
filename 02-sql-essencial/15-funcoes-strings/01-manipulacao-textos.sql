-- 01-manipulacao-textos.sql
-- Objetivo: Demonstrar o uso de funções nativas para transformar e limpar textos (Strings)

USE fullcycle;

-- Exemplo 1: UPPER e LOWER (Maiúsculas e Minúsculas)
-- Objetivo: Padronizar a exibição dos dados, independente de como foram digitados.
SELECT 
    UPPER(nome_produto) AS nome_maiusculo, 
    LOWER(marca_produto) AS marca_minuscula
FROM 
    produtos;


-- Exemplo 2: CONCAT e CONCAT_WS (Concatenar / Juntar textos)
-- Objetivo: Juntar várias colunas ou textos em uma única string. O CONCAT_WS usa um separador padrão.
SELECT 
    CONCAT('O produto ', nome_produto, ' pertence à marca ', marca_produto) AS descricao_completa
FROM 
    produtos;

SELECT 
    CONCAT_WS(' - ', nome_produto, marca_produto, status_produto) AS resumo_produto
FROM 
    produtos;


-- Exemplo 3: REPLACE (Substituir partes de um texto)
-- Objetivo: Lembra que o nome do colaborador tem um ponto? (ex: Carlos.Silva). 
-- Vamos substituir esse ponto por um espaço em branco direto na visualização.
SELECT 
    nome_colaborador AS nome_original,
    REPLACE(nome_colaborador, '.', ' ') AS nome_formatado
FROM 
    colaboradores;


-- Exemplo 4: LENGTH ou CHAR_LENGTH (Tamanho da String)
-- Objetivo: Descobrir quantos caracteres tem uma string (útil para auditoria ou limites de interface).
SELECT 
    nome_produto,
    CHAR_LENGTH(nome_produto) AS quantidade_caracteres
FROM 
    produtos
ORDER BY 
    quantidade_caracteres DESC;


-- Exemplo 5: SUBSTRING (Extrair um pedaço do texto)
-- Objetivo: Pegar apenas os 3 primeiros caracteres do nome do produto para criar uma "sigla" ou código.
SELECT 
    nome_produto,
    SUBSTRING(nome_produto, 1, 3) AS codigo_sigla
FROM 
    produtos;


-- Exemplo 6: TRIM (Limpando espaços inúteis)
-- Objetivo: O TRIM remove espaços em branco acidentais no começo ou no final de uma string. 
-- (Aqui simulamos uma string suja com espaços usando o CONCAT só para o exemplo).
SELECT 
    CONCAT('   ', nome_produto, '   ') AS nome_sujo,
    TRIM(CONCAT('   ', nome_produto, '   ')) AS nome_limpo
FROM 
    produtos;