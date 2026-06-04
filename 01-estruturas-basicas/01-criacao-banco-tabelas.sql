-- 01-criacao-banco-tabelas.sql
-- Objetivo: Demonstrar a criação de um banco de dados e uma tabela simples

CREATE DATABASE IF NOT EXISTS fullcycle;

USE fullcycle;

CREATE TABLE IF NOT EXISTS colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_colaborador VARCHAR(50) UNIQUE NOT NULL,
    email_colaborador VARCHAR(50) UNIQUE NOT NULL,
    status_colaborador ENUM ('Ativo', 'Inativo')
);