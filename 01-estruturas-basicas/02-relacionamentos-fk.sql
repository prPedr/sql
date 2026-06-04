-- 02-relacionamentos-fk.sql
-- Objetivo: Demonstrar a criação de tabelas com Foreign Keys (Chaves Estrangeiras) e ações em cascata

USE fullcycle;

CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL,
    status_produto ENUM ('Consumo', 'Revisao'),
    data_cadastro DATE DEFAULT (CURRENT_DATE),
    id_colaborador INT,
    
    -- Relacionamento com a tabela colaboradores
    FOREIGN KEY (id_colaborador) REFERENCES colaboradores(id)
        ON DELETE CASCADE -- Ao apagar o registro de um colaborador, todos os produtos vinculados a ele serao apagados
        ON UPDATE CASCADE -- Ao atualizar o ID de um colaborador, todos os produtos vinculados serao atualizados
);