CREATE DATABASE fullcycle;

USE fullcycle;

CREATE TABLE colaboradores (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_colaborador VARCHAR(50) UNIQUE NOT NULL,
    email_colaborador VARCHAR(50) UNIQUE NOT NULL,
    status_colaborador ENUM ('Ativo', 'Inativo')
);

CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL,
    status_produto ENUM ('Consumo', 'Revisao'),
    data_cadastro DATE DEFAULT (CURRENT_DATE),
    id_colaborador INT,
    
    FOREIGN KEY (id_colaborador) REFERENCES colaboradores(id)
		ON DELETE CASCADE # Ao apagar o registro de um colaborador, todos os produtos vinculados a ele serao apagados
        ON UPDATE CASCADE # Ao atualizar o ID de um colaborador, todos os produtos vinculados aquele ID serao atualizados para o novo
)
