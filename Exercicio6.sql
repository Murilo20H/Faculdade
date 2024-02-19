CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE revista (
idRevista int auto_increment PRIMARY KEY,
nome varchar(40),
categoria varchar(30));

ALTER TABLE revista auto_increment = 1;

INSERT INTO revista (nome) VALUES
	('10 homens mais ricos do Brasil'),
    ('Ana Maria Braga cozinha um bolo'),
    ('BBB24: a treta do Joelinton'),
    ('BMW I8: a nova tecnologia');
    
SELECT * FROM revista;

UPDATE revista SET categoria = 'Isto é' WHERE idRevista = 1;
UPDATE revista SET categoria = 'Veja' WHERE idRevista = 2;
UPDATE revista SET categoria = 'Veja' WHERE idRevista = 3;
UPDATE revista SET categoria = 'Quatro Rodas' WHERE idRevista = 4;

INSERT INTO revista VALUES
	(default, 'Novo Honda Civic', 'Quatro Rodas'),
    (default, 'Como a caixa registradora foi criada', 'Epoca'),
    (default, 'Veja como os antepassados escreviam', 'Epoca'),
    (default, 'TikToker viraliza com vídeo novo', 'Veja');
    
    
    
    
    
    
    
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