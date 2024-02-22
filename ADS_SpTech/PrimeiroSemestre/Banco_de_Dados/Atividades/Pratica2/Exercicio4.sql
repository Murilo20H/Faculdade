CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE professor (
idProfessor int PRIMARY KEY,
nome varchar(50),
especialidade varchar(40),
dtNasc date);

INSERT INTO professor VALUES
	(1, 'Gabriel', 'matemática', '1999-02-19'),
    (2, 'Miguel', 'português', '1989-05-09'),
    (3, 'Arthur', 'geografia', '1987-10-26'),
    (4, 'Gael', 'artes', '1994-12-04'),
    (5, 'Noah', 'matemática', '1983-11-28'),
    (6, 'Heitor', 'ciências', '1975-07-30'),
    (7, 'Bernardo', 'português', '1984-03-13'),
    (8, 'Ravi', 'biologia', '1999-02-17'),
    (9, 'Lucas', 'filosofia', '1984-02-03'),
    (10, 'Davi', 'história', '1973-09-01');
    
SELECT * FROM professor;

ALTER TABLE professor ADD COLUMN funcao varchar(50);

ALTER TABLE professor ADD CONSTRAINT checkFuncao CHECK (funcao IN('monitor', 'assistente', 'titular'));

UPDATE professor SET funcao = 'monitor' WHERE idProfessor = 1;
UPDATE professor SET funcao = 'titular' WHERE idProfessor = 2;
UPDATE professor SET funcao = 'assistente' WHERE idProfessor = 3;
UPDATE professor SET funcao = 'titular' WHERE idProfessor = 4;
UPDATE professor SET funcao = 'monitor' WHERE idProfessor = 5;
UPDATE professor SET funcao = 'titular' WHERE idProfessor = 6;
UPDATE professor SET funcao = 'titular' WHERE idProfessor = 7;
UPDATE professor SET funcao = 'titular' WHERE idProfessor = 8;
UPDATE professor SET funcao = 'assistente' WHERE idProfessor = 9;
UPDATE professor SET funcao = 'assistente' WHERE idProfessor = 10;

INSERT INTO professor VALUES
	(11, 'Bob', 'sociologia', '1969-12-09');
    
DELETE FROM professor WHERE idProfessor = 5;

SELECT * FROM professor WHERE funcao = 'titular';

SELECT especialidade, dtNasc FROM professor WHERE funcao = 'monitor';

UPDATE professor SET dtNasc = '1949-03-06' WHERE idProfessor = 3;

TRUNCATE TABLE professor;