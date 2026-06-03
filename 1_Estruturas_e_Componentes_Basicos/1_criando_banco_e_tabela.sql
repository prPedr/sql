CREATE DATABASE fullcycle;

USE fullcycle;

CREATE TABLE colaboradores (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_colaborador VARCHAR(50) UNIQUE NOT NULL,
    email_colaborador VARCHAR(50) UNIQUE NOT NULL,
    status_colaborador ENUM ('Ativo', 'Inativo')
);
