-- 02-lock-for-update.sql
-- Objetivo: Demonstrar o uso de Pessimistic Locking (FOR UPDATE) para prevenir condições de corrida em sistemas concorrentes

USE fullcycle;

-- Cenário: Prevenindo a "venda fantasma"
-- Dois processos tentam reservar o último produto do estoque (id = 1) no mesmo milissegundo.

START TRANSACTION;

-- Passo 1: Lemos o valor e TRANCAMOS a linha simultaneamente.
-- O comando FOR UPDATE avisa ao banco: "Ninguém mais pode alterar ou aplicar lock no produto 1 até eu terminar".
-- Se o Processo B chegar aqui, ele ficará travado esperando o Processo A finalizar.
SELECT 
    nome_produto,
    quantidade 
FROM 
    produtos 
WHERE 
    id = 1 
FOR UPDATE;

-- (Neste ponto, na vida real, o seu código backend faria a validação: if (quantidade >= 1) {...} )
-- Como a linha está trancada, você tem 100% de certeza de que a quantidade não foi alterada por outra requisição.

-- Passo 2: Fazemos a baixa no estoque com segurança
UPDATE 
    produtos 
SET 
    quantidade = quantidade - 1 
WHERE 
    id = 1;

-- Passo 3: Confirmamos a operação. 
-- Somente AGORA a tranca é liberada e o Processo B (que estava aguardando) consegue prosseguir e ler o novo valor.
COMMIT;