CREATE DATABASE fullcycle;

USE fullcycle;

CREATE TABLE usuarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50) NOT NULL UNIQUE,
    email_usuario VARCHAR(50) NOT NULL UNIQUE,
    status_usuario VARCHAR(10) DEFAULT 'Pendente'
);

CREATE TABLE produtos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL,
    status_produto VARCHAR(50) DEFAULT 'Pendente',
    data_criacao DATE DEFAULT (CURRENT_DATE),
    id_usuario INT,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
		ON DELETE CASCADE # Ao apagar o registro de um usuario, todos os produtos vinculados a ele serao apagados
        ON UPDATE CASCADE # Ao atualizar o ID de um usuario, todos os pedidos produtos vinculados aquele ID serao atualizados para o novo
)
