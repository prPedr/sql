-- 01-matematica-e-arredondamentos.sql
-- Objetivo: Demonstrar o uso de funções nativas para cálculos matemáticos e formatação de números

USE fullcycle;

-- Exemplo 1: ROUND (Arredondamento Matemático Padrão)
-- Objetivo: Arredondar um valor financeiro para 2 casas decimais. 
-- Regra: Se o 3º dígito for 5 ou mais, arredonda para cima. Se for 4 ou menos, mantém.
SELECT 
    nome_produto,
    (quantidade * 1.755) AS valor_bruto,
    ROUND((quantidade * 1.755), 2) AS valor_arredondado
FROM 
    produtos
LIMIT 5;


-- Exemplo 2: CEIL e FLOOR (Teto e Chão)
-- Objetivo: Forçar o arredondamento para o número inteiro mais próximo.
-- CEIL (Sempre para cima) | FLOOR (Sempre para baixo)
SELECT 
    nome_produto,
    (quantidade * 1.755) AS valor_bruto,
    CEIL(quantidade * 1.755) AS arredonda_pra_cima,
    FLOOR(quantidade * 1.755) AS arredonda_pra_baixo
FROM 
    produtos
LIMIT 5;


-- Exemplo 3: TRUNCATE (Corte exato, sem arredondar)
-- Objetivo: Simplesmente "ceifar" os números a partir de uma determinada casa decimal, ignorando regras de arredondamento.
SELECT 
    nome_produto,
    (quantidade * 1.759) AS valor_bruto,
    TRUNCATE((quantidade * 1.759), 2) AS valor_cortado -- Resultado será .75 (e não .76 como seria no ROUND)
FROM 
    produtos
LIMIT 5;


-- Exemplo 4: ABS (Valor Absoluto)
-- Objetivo: Trazer sempre o número positivo, independente de a conta ter gerado um número negativo.
-- Muito útil para calcular "Diferença entre saldos" ou variações de estoque sem gerar o sinal de menos.
SELECT 
    ABS(10 - 50) AS diferenca_negativa_convertida, -- Vai retornar 40, e não -40
    ABS(50 - 10) AS diferenca_positiva;


-- Exemplo 5: RAND (Números Aleatórios)
-- Objetivo: Gerar um valor randômico entre 0 e 1.
-- Pode ser usado multiplicado e combinado com FLOOR para sortear um número de PIN temporário, por exemplo.
SELECT 
    RAND() AS numero_aleatorio,
    FLOOR(RAND() * 10000) AS pin_aleatorio_quatro_digitos;