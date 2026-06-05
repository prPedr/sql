-- 01-manipulacao-datas.sql
-- Objetivo: Demonstrar o uso de funções nativas para formatação, extração e cálculos matemáticos com datas

USE fullcycle;

-- Exemplo 1: CURDATE() e NOW() (Data e Hora Atuais do Servidor)
-- Objetivo: Retornar o momento exato da consulta. Muito usado para registrar logs de acesso ou atualizações.
SELECT 
    CURDATE() AS data_de_hoje, 
    NOW() AS data_e_hora_exatas;


-- Exemplo 2: DATE_FORMAT (Formatando para o padrão brasileiro)
-- Objetivo: O banco armazena no padrão Americano (YYYY-MM-DD). 
-- O DATE_FORMAT converte isso diretamente para o padrão que exibimos na tela (DD/MM/YYYY).
SELECT 
    nome_produto,
    data_cadastro AS padrao_banco,
    DATE_FORMAT(data_cadastro, '%d/%m/%Y') AS padrao_brasileiro
FROM 
    produtos;


-- Exemplo 3: DATE_ADD e DATE_SUB (Adicionando e subtraindo tempo)
-- Objetivo: Simular a criação de uma data de vencimento para 30 dias após a data de cadastro original.
SELECT 
    nome_produto,
    data_cadastro,
    DATE_ADD(data_cadastro, INTERVAL 30 DAY) AS vencimento_boleto
FROM 
    produtos;


-- Exemplo 4: DATEDIFF (Diferença de tempo entre duas datas)
-- Objetivo: Descobrir há exatos quantos dias um produto está cadastrado no sistema, comparando com a data de hoje.
SELECT 
    nome_produto,
    data_cadastro,
    DATEDIFF(CURDATE(), data_cadastro) AS dias_no_sistema
FROM 
    produtos
ORDER BY 
    dias_no_sistema DESC;


-- Exemplo 5: YEAR(), MONTH() e DAY() (Extraindo partes específicas)
-- Objetivo: Isolar o mês e o ano da data. 
-- Isso é fundamental quando você precisa fazer um GROUP BY para gerar um gráfico de faturamento por mês, por exemplo.
SELECT 
    nome_produto,
    YEAR(data_cadastro) AS ano_cadastro,
    MONTH(data_cadastro) AS mes_cadastro,
    DAY(data_cadastro) AS dia_cadastro
FROM 
    produtos;