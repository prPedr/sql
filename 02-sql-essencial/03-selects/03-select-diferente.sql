-- 03-select-diferente.sql
-- Objetivo: Filtrar registros por exclusão (diferente de)

USE fullcycle;

SELECT id, nome_colaborador, email_colaborador, funcao_colaborador, status_colaborador
FROM colaboradores
WHERE status_colaborador != 'Inativo'; -- O símbolo != representa diferente
