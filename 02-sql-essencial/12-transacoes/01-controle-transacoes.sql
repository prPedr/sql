-- 01-controle-transacoes.sql
-- Objetivo: Demonstrar o controle de transações (ACID) para garantir a integridade dos dados

USE fullcycle;

-- Exemplo 1: Transação bem-sucedida com COMMIT (Confirmação)
-- Cenário: Transferência de estoque entre dois produtos diferentes. 
-- Se o servidor cair logo após o primeiro UPDATE, a transação impede que os 10 itens sumam do banco.
START TRANSACTION;

-- Retira 10 itens do Produto 1
UPDATE produtos 
SET quantidade = quantidade - 10 
WHERE id = 1;

-- Adiciona 10 itens no Produto 2
UPDATE produtos 
SET quantidade = quantidade + 10 
WHERE id = 2;

-- Tudo ocorreu perfeitamente. Salva as alterações de forma permanente!
COMMIT; 


-- Exemplo 2: Transação abortada com ROLLBACK (Desfazer)
-- Cenário: Um processo complexo de exclusão em cascata começou, mas o sistema identificou 
-- uma quebra de regra de negócio no meio do caminho.
START TRANSACTION;

-- Sistema tenta desligar o colaborador e transferir seus produtos temporariamente para o 'id 1'
UPDATE produtos 
SET id_colaborador = 1 
WHERE id_colaborador = 4;

DELETE FROM colaboradores 
WHERE id = 4;

-- Identificamos um erro! O colaborador tem pendências no CRM e não pode ser excluído.
-- Desfazemos TODAS as alterações (o UPDATE e o DELETE acima) feitas desde o START TRANSACTION.
ROLLBACK;