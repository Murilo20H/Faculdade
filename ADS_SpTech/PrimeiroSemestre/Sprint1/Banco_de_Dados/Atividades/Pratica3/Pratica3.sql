CREATE DATABASE sprint2;
USE sprint2;

-- EXERCÍCIO 1
CREATE TABLE Atleta (
	idAtleta int primary key,
	nome varchar(40),
	modalidade varchar(40),
    qtdMedalha int);

INSERT INTO Atleta VALUES
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

CREATE TABLE País (
	idPaís int primary key,
	nome varchar(30),
	capital varchar(40));

INSERT INTO País VALUES
	(1, 'Itália', 'Roma'),
    (2, 'Alemanha', 'Berlim'),
    (3, 'Rússia', 'Moscou'),
    (4, 'China', 'Pequim'),
    (5, 'Irlanda', 'Dublin');
    
ALTER TABLE Atleta ADD COLUMN fkPaís int, ADD CONSTRAINT fkAtletaPaís
	foreign key (fkPaís) references País(idPaís);

UPDATE Atleta SET fkPaís = 1 WHERE idAtleta IN (2, 4);
UPDATE Atleta SET fkPaís = 2 WHERE idAtleta IN (6, 5);
UPDATE Atleta SET fkPaís = 3 WHERE idAtleta IN (7, 9);
UPDATE Atleta SET fkPaís = 4 WHERE idAtleta = 8;
UPDATE Atleta SET fkPaís = 5 WHERE idAtleta IN (1, 3, 10);

SELECT * FROM País JOIN Atleta ON idPaís = fkPaís;

SELECT a.nome, p.nome FROM País as p JOIN Atleta as a ON idPaís = fkPaís;

SELECT * FROM País as p JOIN Atleta as a ON idPaís = fkPaís WHERE p.capital = 'Dublin';



-- EXERCÍCIO 2
USE sprint2;

CREATE TABLE Musica (
	idMusica int primary key,
	titulo varchar(40),
	artista varchar(40),
    genero varchar(40));
    
INSERT INTO Musica VALUES
	(1, 'Hey Jude', 'The Beatles', 'Funk'),
    (2, 'Aint No Sunshine', 'Gloria Gaynor', 'Disco'),
    (3, 'Respect', 'Aretha Franklin', 'Funk'),
    (4, 'I Will Survive', 'The Beatles', 'Disco'),
    (5, 'Imagine', 'The Beatles', 'Pop'),
    (6, 'What a Wonderful World', 'Louis Armstrong', 'Funk'),
    (7, 'Hallelujah', 'Louis Armstrong', 'Folk'),
    (8, 'Yesterday', 'The Beatles', 'Folk'),
    (9, 'Like a Virgin', 'Aretha Franklin', 'Pop'),
    (10, 'Born in the USA', 'Aretha Franklin', 'Pop');

CREATE TABLE Album (
	idAlbum int primary key,
	nome varchar(40),
	tipo varchar(7),
    dtLancamento date);
    
INSERT INTO Album VALUES
	(1, 'Thriller', 'físico', '1982-11-30'),
    (2, 'Aint No Sunshine', 'digital', '1971-06-23'),
    (3, 'Respect', 'físico', '1965-04-03'),
    (4, 'I Will Survive', 'físico', '1978-10-19');

SELECT * FROM Musica;
SELECT * FROM Album;

ALTER TABLE Musica ADD COLUMN fkAlbum int, ADD CONSTRAINT fkMusicaAlbum
	foreign key (fkAlbum) references Album(idAlbum);

UPDATE Musica SET fkAlbum = 1 WHERE idMusica IN (2, 4);
UPDATE Musica SET fkAlbum = 2 WHERE idMusica IN (1, 3, 6);
UPDATE Musica SET fkAlbum = 3 WHERE idMusica IN (5, 9, 10);
UPDATE Musica SET fkAlbum = 4 WHERE idMusica IN (7, 8);

SELECT * FROM Musica JOIN Album ON idAlbum = fkAlbum;

SELECT m.titulo, a.nome FROM Album as a JOIN Musica as m ON idAlbum = fkAlbum;

SELECT * FROM Musica as m JOIN Album as a ON idAlbum = fkAlbum WHERE a.tipo = 'físico';