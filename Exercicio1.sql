CREATE DATABASE sprint1;
USE sprint1;

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