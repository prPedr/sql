USE fullcycle;

SELECT 
    colaboradores.id,
    colaboradores.nome_colaborador,
    colaboradores.email_colaborador,
    produtos.id AS produto_id, # Renomeando ID para nao causar conflito por conta do ID de colaboradores
	  produtos.marca_produto,
    produtos.status_produto
FROM
    colaboradores
LEFT JOIN
    produtos ON colaboradores.id = produtos.id_colaborador
