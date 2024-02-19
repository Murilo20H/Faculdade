CREATE DATABASE sprint1;
USE sprint1;

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