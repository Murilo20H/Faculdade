CREATE DATABASE sprint1;
USE sprint1;

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

DELETE FROM musica WHERE genero != 'Funk';

SELECT * FROM musica WHERE curtidas >= 20;

DESCRIBE musica;

TRUNCATE TABLE musica;