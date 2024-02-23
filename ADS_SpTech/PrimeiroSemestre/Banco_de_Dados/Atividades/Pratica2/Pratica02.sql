CREATE DATABASE sprint1;
USE sprint1;

-- EXERCICIO 1

CREATE TABLE atleta (
idAtleta int PRIMARY KEY,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int);

INSERT INTO atleta VALUES
	(1, 'Gabriel', 'natação', 3),
    (2, 'Miguel', 'basquete', 0),
    (3, 'Arthur', 'natação', 9),
    (4, 'Gael', 'futebol', 4),
    (5, 'Noah', 'futebol', 1),
    (6, 'Heitor', 'vôlei', 0),
    (7, 'Bernardo', 'basquete', 1),
    (8, 'Ravi', 'futebol', 2),
    (9, 'Lucas', 'natação', 3),
    (10, 'Davi', 'vôlei', 0);

SELECT * FROM atleta;

UPDATE atleta SET qtdMedalha = 4 WHERE idAtleta = 1;
UPDATE atleta SET qtdMedalha = 5 WHERE idAtleta IN (2,3);
UPDATE atleta SET nome = 'Murilo' WHERE idAtleta = 4;

ALTER TABLE atleta ADD COLUMN dtNasc date;

UPDATE atleta SET dtNasc = '1999-02-19' WHERE idAtleta = 1;
UPDATE atleta SET dtNasc = '1989-05-09' WHERE idAtleta = 2;
UPDATE atleta SET dtNasc = '1987-10-26' WHERE idAtleta = 3;
UPDATE atleta SET dtNasc = '1994-12-04' WHERE idAtleta = 4;
UPDATE atleta SET dtNasc = '1983-11-28' WHERE idAtleta = 5;
UPDATE atleta SET dtNasc = '1975-07-30' WHERE idAtleta = 6;
UPDATE atleta SET dtNasc = '1984-03-13' WHERE idAtleta = 7;
UPDATE atleta SET dtNasc = '1999-02-17' WHERE idAtleta = 8;
UPDATE atleta SET dtNasc = '1984-02-03' WHERE idAtleta = 9;
UPDATE atleta SET dtNasc = '1973-09-01' WHERE idAtleta = 10;

DELETE FROM atleta WHERE idAtleta = 5;

SELECT * FROM atleta WHERE modalidade != 'natação';

SELECT * FROM atleta WHERE qtdMedalha >= 3;

ALTER TABLE atleta MODIFY COLUMN modalidade varchar(60);

DESCRIBE atleta;

TRUNCATE TABLE atleta;


-- EXERCICIO 2

CREATE TABLE musica (
idMusica int PRIMARY KEY,
titulo varchar(40),
artista varchar(40),
genero varchar(40));

INSERT INTO musica VALUES
	(1, 'Hey Jude', 'The Beatles', 'Funk'),
    (2, 'Aint No Sunshine', 'Bill Withers', 'Soul'),
    (3, 'Respect', 'Aretha Franklin', 'Funk'),
    (4, 'I Will Survive', 'Gloria Gaynor', 'Disco'),
    (5, 'Imagine', 'John Lennon', 'Pop'),
    (6, 'What a Wonderful World', 'Louis Armstrong', 'Funk'),
    (7, 'Hallelujah', 'Leonard Cohen', 'Folk'),
    (8, 'Yesterday', 'The Beatles', 'Pop Rock'),
    (9, 'Like a Virgin', 'Madonna ', 'Pop'),
    (10, 'Born in the USA', 'Bruce Springsteen', 'Rock');

SELECT * FROM musica;

ALTER TABLE musica ADD COLUMN curtidas int;

UPDATE musica SET curtidas = 640 WHERE idMusica = 1;
UPDATE musica SET curtidas = 900 WHERE idMusica = 2;
UPDATE musica SET curtidas = 135 WHERE idMusica = 3;
UPDATE musica SET curtidas = 792 WHERE idMusica = 4;
UPDATE musica SET curtidas = 884 WHERE idMusica = 5;
UPDATE musica SET curtidas = 450 WHERE idMusica = 6;
UPDATE musica SET curtidas = 647 WHERE idMusica = 7;
UPDATE musica SET curtidas = 837 WHERE idMusica = 8;
UPDATE musica SET curtidas = 205 WHERE idMusica = 9;
UPDATE musica SET curtidas = 726 WHERE idMusica = 10;

ALTER TABLE musica MODIFY COLUMN artista varchar(80);

UPDATE musica SET curtidas = 475 WHERE idMusica = 1;
UPDATE musica SET curtidas = 593 WHERE idAtleta IN (2,3);
UPDATE musica SET titulo = 'Imagine Again' WHERE idMusica = 5;

DELETE FROM musica WHERE idMusica = 4;

SELECT * FROM musica WHERE genero != 'Funk';

SELECT * FROM musica WHERE curtidas >= 20;

DESCRIBE musica;

TRUNCATE TABLE musica;


-- EXERCICIO 3

CREATE TABLE filme (
idFilme int PRIMARY KEY,
titulo varchar(50),
genero varchar(40),
diretor varchar(40));

INSERT INTO filme VALUES
	(1, 'Jorge: o despertar', 'ação', 'Braian'),
    (2, 'Como se fosse a segunda vez', 'drama', 'Bruno'),
    (3, 'Como treinar o seu dinossauro', 'suspense', 'Jorge'),
    (4, 'Toy story', 'aventura', 'Gabriel'),
    (5, 'Wall-e', 'suspense', 'Nicolas'),
    (6, 'Pixels', 'drama', 'Bob'),
    (7, 'Toy story 2', 'aventura', 'Gabriel'),
    (8, 'Divertidamente', 'suspense', 'Davi'),
    (9, 'Valente', 'ação ', 'Jailson'),
    (10, 'Patrulha canina', 'terror', 'Jorge');

SELECT * FROM filme;

ALTER TABLE filme ADD COLUMN protagonista varchar(50);

UPDATE filme SET protagonista = 'Adam' WHERE idFilme = 1;
UPDATE filme SET protagonista = 'Woody' WHERE idFilme = 2;
UPDATE filme SET protagonista = 'Jasie' WHERE idFilme = 3;
UPDATE filme SET protagonista = 'Jonny' WHERE idFilme = 4;
UPDATE filme SET protagonista = 'Kevin' WHERE idFilme = 5;
UPDATE filme SET protagonista = 'Tom' WHERE idFilme = 6;
UPDATE filme SET protagonista = 'Ana' WHERE idFilme = 7;
UPDATE filme SET protagonista = 'Tatiana' WHERE idFilme = 8;
UPDATE filme SET protagonista = 'Juliana' WHERE idFilme =9;
UPDATE filme SET protagonista = 'Amanda' WHERE idFilme = 10;

ALTER TABLE filme MODIFY COLUMN diretor varchar(150);

UPDATE filme SET diretor = 'David' WHERE idFilme = 5;
UPDATE filme SET diretor = 'Tarcila' WHERE idFilme IN (2,7);
UPDATE filme SET titulo = 'A fuga das galinhas' WHERE idFilme = 6;

DELETE FROM filme WHERE idFilme = 3;

SELECT * FROM filme WHERE genero != 'drama';

SELECT * FROM filme WHERE genero = 'suspense';

DESCRIBE filme;

TRUNCATE TABLE filme;


-- EXERCICIO 4

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
	(11, 'Bob', 'sociologia', '1969-12-09', 'titular');
    
DELETE FROM professor WHERE idProfessor = 5;

SELECT * FROM professor WHERE funcao = 'titular';

SELECT especialidade, dtNasc FROM professor WHERE funcao = 'monitor';

UPDATE professor SET dtNasc = '1949-03-06' WHERE idProfessor = 3;

TRUNCATE TABLE professor;


-- EXERCICIO 5

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


-- EXERCICIO 6

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
    
SELECT * FROM revista;
    
DESCRIBE revista;

ALTER TABLE revista MODIFY COLUMN categoria varchar(40);

DESCRIBE revista;

ALTER TABLE revista ADD COLUMN periodicidade varchar(15);

SELECT * FROM revista;

ALTER TABLE revista DROP COLUMN periodicidade;