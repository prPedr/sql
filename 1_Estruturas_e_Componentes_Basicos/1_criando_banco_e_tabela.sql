CREATE DATABASE fullcycle;

USE fullcycle;

CREATE TABLE usuarios (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nomeUsuario VARCHAR(50) NOT NULL UNIQUE,
  email_usuario VARVHAR(50) NOT NULL UNIQUE,
  status_usuario VARCHAR(10) DEFAULT 'Pendente'
);
