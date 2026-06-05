-- 01-copia-e-arquivamento.sql
-- Objetivo: Demonstrar como inserir dados em uma tabela a partir do resultado de um SELECT de outra tabela

USE fullcycle;

-- Passo 1: Criar uma tabela de destino para o nosso exemplo de arquivamento
CREATE TABLE IF NOT EXISTS produtos_historico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_original_id INT,
    nome_produto VARCHAR(50),
    quantidade_registrada INT,
    data_arquivamento DATE DEFAULT (CURRENT_DATE)
);


-- Exemplo 1: Arquivamento/Cópia condicional
-- Objetivo: Copiar para a tabela de histórico todos os produtos que estão com o estoque menor ou igual a 20.
INSERT INTO produtos_historico (produto_original_id, nome_produto, quantidade_registrada)
SELECT 
    id, 
    nome_produto, 
    quantidade
FROM 
    produtos
WHERE 
    quantidade <= 20;


-- Exemplo 2: "Clonando" dados na mesma tabela (com pequenas alterações)
-- Objetivo: Criar uma nova linha de produtos baseada em itens que já existem, mudando apenas a marca e zerando o estoque.
-- Útil quando você quer cadastrar variações de um mesmo produto rapidamente.
INSERT INTO produtos (nome_produto, marca_produto, quantidade, status_produto, id_colaborador)
SELECT 
    nome_produto, 
    'Marca Generica', -- Inserindo um valor fixo no lugar da coluna original
    0,                -- Zerando o estoque para o novo registro
    status_produto, 
    id_colaborador
FROM 
    produtos
WHERE 
    marca_produto = 'Nestle';