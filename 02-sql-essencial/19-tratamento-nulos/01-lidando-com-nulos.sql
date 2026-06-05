-- 01-lidando-com-nulos.sql
-- Objetivo: Demonstrar como identificar, filtrar e substituir valores nulos com segurança

USE fullcycle;

-- Passo 1: Preparando o terreno
-- Adicionando uma coluna que explicitamente aceita valores nulos para testarmos.
ALTER TABLE produtos
ADD COLUMN observacoes VARCHAR(255) NULL
AFTER quantidade;


-- Exemplo 1: IS NULL e IS NOT NULL (Filtragem segura)
-- Objetivo: Encontrar produtos que ainda NÃO possuem nenhuma observação cadastrada.
-- NUNCA use "observacoes = NULL", o SQL não reconhece essa sintaxe. O correto é "IS NULL".
SELECT 
    nome_produto, 
    quantidade 
FROM 
    produtos 
WHERE 
    observacoes IS NULL;


-- Exemplo 2: COALESCE (O melhor amigo das APIs)
-- Objetivo: Se a coluna for nula, o banco já retorna uma string padrão, evitando enviar "null" para o frontend.
-- O COALESCE avalia a lista da esquerda para a direita e retorna o primeiro valor não-nulo.
SELECT 
    nome_produto, 
    COALESCE(observacoes, 'Nenhuma observação registrada para este item') AS detalhes
FROM 
    produtos;


-- Exemplo 3: IFNULL (Específico do ecossistema MySQL)
-- Objetivo: Funciona da mesma forma que o COALESCE, porém aceita estritamente dois parâmetros: a coluna e o valor substituto.
SELECT 
    nome_produto, 
    IFNULL(observacoes, 'Sem detalhes') AS detalhes_curtos
FROM 
    produtos;


-- Exemplo 4: Prevenindo falhas matemáticas com NULL
-- Objetivo: Qualquer operação matemática envolvendo um valor NULL resulta em NULL (Ex: 50 - NULL = NULL).
-- Aqui simulamos uma "baixa" de estoque onde o valor informado acidentalmente foi NULL.
SELECT 
    nome_produto,
    quantidade AS estoque_atual,
    -- Se tentarmos "quantidade - NULL", a coluna 'estoque_calculado' inteira ficaria nula.
    -- O COALESCE transforma o NULL em 0 antes da matemática acontecer, salvando o cálculo.
    quantidade - COALESCE(NULL, 0) AS estoque_calculado 
FROM 
    produtos
LIMIT 5;