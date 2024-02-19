-- CRIAR O BANCO DE DADOS
CREATE DATABASE adsb;

-- DELETAR O BANCO DE DADOS
DROP DATABASE adsb;

-- SELECIONAR O BANCO DE DADOS adsb
USE adsb;

-- TABELA
   -- CAMPO
       -- DADO
       
CREATE TABLE pessoa (
	id int primary key,
	nome varchar(50),
	altura float,
    dtNasc date);

-- date YYYY-MM-DD
-- números
-- float 7 caracteres
-- double 15 caracteres
-- decimal 32 caracteres
   -- decimal(5,2) 123,45
   -- decimal(4,1) 678,9
-- int inteiro 

DESCRIBE pessoa;

-- INSERIR OS DADOS NA TABELA
INSERT INTO pessoa VALUES
    (1, 'Jorge', 1.80, '1997-04-25'),
    (2, 'Jailson', 1.65, '1983-10-13'),
    (3, 'Jorgeson', 1.75, '1977-08-05'),
    (4, 'Mateus', 1.93, '1982-02-27'),
    (5, 'Murilo', 1.79, '1994-12-30');
    
INSERT INTO pessoa VALUES
    (default, 'Pedro', 1.76, '2001-03-16'),
    (default, 'Bruno', 1.59, '1983-03-03'),
    (default, 'Paulo', 1.82, '1956-09-26'),
    (default, 'Jack', 1.75, '1990-08-01'),
    (default, 'Nick', 1.61, '1992-10-05');
    
    INSERT INTO pessoa (nome, altura) VALUES
    ('Braian', 1.76),
    ('Gabriel', 1.63);
 
-- MODIFICAR O ID PARA ELE SE AUTO INCREMENTAR
ALTER TABLE pessoa MODIFY COLUMN id int auto_increment;
ALTER TABLE pessoa MODIFY COLUMN nome varchar(80);

-- RENOMEAR UM CAMPO
ALTER TABLE pessoa RENAME COLUMN idPessoa TO id;

-- PROXIMA PESSOA VEM COM O ID 13
ALTER TABLE pessoa auto_increment = 13;

-- ATUALIZAR UM DADO
UPDATE pessoa SET nome = 'Jorge Silva' WHERE id = 1;

-- EXCLUIR UMA COLUNA
ALTER TABLE pessoa DROP COLUMN dtNasc;

-- CRIAR UMA COLUNA
ALTER TABLE pessoa ADD COLUMN nacionalidade varchar(50);

-- ALTERAR A NACIONALIDADE DE TRES PESSOAS
UPDATE pessoa SET nacionalidade = 'Brasil' WHERE id IN (1,2,3);
UPDATE pessoa SET nacionalidade = 'Argentina' WHERE id BETWEEN 1 AND 3;

-- EXCLUIR UMA LINHA
DELETE FROM pessoa WHERE id = 1;

-- RESTRICAO DE NACIONALIDADE
ALTER TABLE pessoa ADD CONSTRAINT checkNacionalidade CHECK (nacionalidade IN('Brasil', 'Argentina'));

-- RESTRICAO DE EMAIL
ALTER TABLE pessoa ADD CONSTRAINT checkEmail CHECK (email LIKE '%@%');

-- EXIBIR OS DADOS DA TABELA
SELECT * FROM pessoa;
SELECT nome, altura, dtNasc FROM pessoa;
SELECT nome, altura FROM pessoa; 
SELECT * FROM pessoa WHERE altura = 1.75;
SELECT * FROM pessoa WHERE nome = 'Jorge';
SELECT * FROM pessoa WHERE nome LIKE 'J%';
SELECT * FROM pessoa WHERE dtNasc LIKE '%05';
SELECT nome, dtNasc FROM pessoa WHERE nome LIKE '%o%';
SELECT nome, altura FROM pessoa WHERE dtNasc LIKE '__92%';
SELECT nome FROM pessoa WHERE nome LIKE '%g_';
SELECT * FROM pessoa WHERE nome != 'Jorge';
SELECT * FROM pessoa WHERE nome <> 'Jorgeson'; 