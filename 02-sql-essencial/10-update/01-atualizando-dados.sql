-- 01-atualizando-dados.sql
-- Objetivo: Demonstrar a atualização de registros existentes de forma segura (SEMPRE use WHERE!)

USE fullcycle;

-- Exemplo 1: Atualização simples de uma única coluna
-- Objetivo: Corrigir ou alterar o status de um colaborador específico usando o seu ID.
UPDATE 
    colaboradores
SET 
    status_colaborador = 'Inativo'
WHERE 
    id = 1;


-- Exemplo 2: Atualizando múltiplas colunas ao mesmo tempo
-- Objetivo: Atualizar a marca e a quantidade de um produto específico em uma única execução.
UPDATE 
    produtos
SET 
    marca_produto = 'Nestle Premium',
    quantidade = 150
WHERE 
    id = 1;


-- Exemplo 3: Atualização baseada em cálculos/expressões matemáticas
-- Objetivo: Simular o recebimento de um novo lote, adicionando +20 à quantidade atual do produto, 
-- sem precisar saber qual era o valor anterior (o banco calcula sozinho).
UPDATE 
    produtos
SET 
    quantidade = quantidade + 20
WHERE 
    id = 2;


-- Exemplo 4: Atualização em massa com base em uma condição
-- Objetivo: Zerar o estoque de todos os produtos que estão marcados como 'Revisao'.
UPDATE 
    produtos
SET 
    quantidade = 0
WHERE 
    status_produto = 'Revisao';