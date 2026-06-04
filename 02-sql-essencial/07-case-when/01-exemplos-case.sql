-- 01-exemplos-case.sql
-- Objetivo: Demonstrar o uso da estrutura condicional CASE WHEN (o "if/else" do SQL)

USE fullcycle;

-- Exemplo 1: Categorização baseada em valores numéricos (Faixas de Estoque)
-- Objetivo: Criar uma coluna virtual que avalia a quantidade e alerta sobre o nível do estoque.
SELECT 
    nome_produto,
    marca_produto,
    quantidade,
    CASE 
        WHEN quantidade = 0 THEN 'Esgotado'
        WHEN quantidade <= 20 THEN 'Estoque Crítico (Comprar Urgente)'
        WHEN quantidade <= 50 THEN 'Estoque Adequado'
        ELSE 'Estoque Farto'
    END AS alerta_estoque
FROM 
    produtos
ORDER BY 
    quantidade ASC;


-- Exemplo 2: Sintaxe simplificada (Estilo "Switch/Case" para valores exatos)
-- Objetivo: Atribuir níveis de permissão no sistema baseados na função do colaborador.
SELECT 
    nome_colaborador,
    funcao_colaborador,
    CASE funcao_colaborador
        WHEN 'Gerente' THEN 'Acesso Total (Painel e Financeiro)'
        WHEN 'Lider' THEN 'Acesso Intermediário (Gestão de Equipe)'
        WHEN 'Analista' THEN 'Acesso Padrão (Leitura e Escrita)'
        WHEN 'Assistente' THEN 'Acesso Restrito (Apenas Leitura)'
        ELSE 'Sem Acesso Definido'
    END AS nivel_acesso_sistema
FROM 
    colaboradores;


-- Exemplo 3: Avançado - CASE WHEN dentro de Funções de Agregação (Pivotamento de Dados)
-- Objetivo: Em vez de listar linhas, queremos um resumo de QUANTOS produtos estão em cada situação de consumo.
SELECT 
    marca_produto,
    SUM(CASE WHEN status_produto = 'Consumo' THEN 1 ELSE 0 END) AS total_itens_consumo,
    SUM(CASE WHEN status_produto = 'Revisao' THEN 1 ELSE 0 END) AS total_itens_revisao
FROM 
    produtos
GROUP BY 
    marca_produto;