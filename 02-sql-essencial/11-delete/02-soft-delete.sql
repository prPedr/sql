-- 02-soft-delete.sql
-- Objetivo: Demonstrar o conceito de "Soft Delete" (Exclusão Lógica).
-- Em sistemas reais, frequentemente optamos por ocultar o dado em vez de excluí-lo permanentemente.

USE fullcycle;

-- HARD DELETE (O registro é apagado permanentemente do disco)
-- DELETE FROM colaboradores WHERE id = 3;

-- SOFT DELETE (O registro continua no banco, mas a aplicação passa a ignorá-lo)
-- Objetivo: Desligar um colaborador da empresa sem perder o histórico dos produtos que ele cadastrou no passado.
UPDATE colaboradores
SET status_colaborador = 'Inativo'
WHERE id = 3;

-- Nota: Após aplicar o Soft Delete, todas as suas consultas (SELECTs) no backend 
-- deverão incluir a condição "WHERE status_colaborador = 'Ativo'" para não exibir quem foi "excluído".