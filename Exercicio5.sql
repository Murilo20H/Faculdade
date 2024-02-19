CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE curso (
idCurso int PRIMARY KEY,
nome varchar(50),
sigla char(3),
coordenador varchar(50));

INSERT INTO curso VALUES
	(1, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Jorge'),
    (2, 'Sistemas da Informação', 'SIS', 'Bruno'),
    (3, 'Ciências da Computação', 'CCO', 'Tobby'),
    (4, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Jorge'),
    (5, 'Sistemas da Informação', 'SIS', 'Bruno'),
    (6, 'Ciências da Computação', 'CCO', 'Tobby'),
    (7, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Jorge'),
    (8, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Jorge'),
    (9, 'Sistemas da Informação', 'SIS', 'Bruno'),
    (10, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Jorge');
    
SELECT coordenador FROM curso;
SELECT * FROM curso WHERE sigla = 'ADS';
SELECT * FROM curso ORDER BY nome ASC;
SELECT * FROM curso ORDER BY coordenador DESC;
SELECT * FROM curso WHERE nome LIKE 'A%';
SELECT * FROM curso WHERE nome LIKE '%o';
SELECT * FROM curso WHERE nome LIKE '_i%';
SELECT * FROM curso WHERE nome LIKE '%a_';

TRUNCATE TABLE curso;