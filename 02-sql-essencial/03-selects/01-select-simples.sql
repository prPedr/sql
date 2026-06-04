-- 02-select-where.sql
-- Objetivo: Filtrar registros utilizando a cláusula WHERE

USE fullcycle;

SELECT id, nome_colaborador, email_colaborador, funcao_colaborador, status_colaborador
FROM colaboradores
WHERE status_colaborador = 'Inativo';
