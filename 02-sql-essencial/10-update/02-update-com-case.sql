-- 02-update-com-case.sql
-- Objetivo: Demonstrar atualizações em massa e condicionais usando CASE WHEN para otimizar a performance

USE fullcycle;

-- Exemplo 1: Atualização condicional baseada em uma regra de negócio
-- Objetivo: Aplicar um reajuste de estoque de forma inteligente. 
-- Se o produto for de 'Consumo', adicionamos 10 unidades. Se for de 'Revisao', zeramos o estoque.
UPDATE 
    produtos
SET 
    quantidade = CASE 
        WHEN status_produto = 'Consumo' THEN quantidade + 10
        WHEN status_produto = 'Revisao' THEN 0
        ELSE quantidade -- Mantém o valor atual caso não caia em nenhuma das regras acima
    END;


-- Exemplo 2: Atualizando múltiplos IDs com valores diferentes na mesma query (Excelente para APIs)
-- Objetivo: Sincronizar o estoque de três produtos específicos (IDs 1, 2 e 3) com valores exatos diferentes,
-- tudo em uma única viagem ao banco de dados.
UPDATE 
    produtos
SET 
    quantidade = CASE id
        WHEN 1 THEN 55
        WHEN 2 THEN 32
        WHEN 3 THEN 18
    END
WHERE 
    id IN (1, 2, 3); -- O WHERE é fundamental aqui para não sobrescrever o resto da tabela com NULL