-- criar e usar o banco de dados adsb.
CREATE DATABASE adsb;
USE adsb;

-- criar a tabela musica.
CREATE TABLE musica (
idMusica int PRIMARY KEY,
titulo varchar(40),
artista varchar(40),
genero varchar(40));

-- exibir a tabela musica.
DESCRIBE musica;

-- criar musicas para a tabela. 
INSERT INTO musica VALUES
	(201, 'Hey Jude', 'The Beatles', 'Pop Rock'),
    (202, 'Aint No Sunshine', 'Bill Withers', 'Soul'),
    (203, 'Respect', 'Aretha Franklin', 'Soul'),
    (204, 'I Will Survive', 'Gloria Gaynor', 'Disco'),
    (205, 'Imagine', 'John Lennon', 'Pop'),
    (206, 'What a Wonderful World', 'Louis Armstrong', 'Jazz'),
    (207, 'Hallelujah', 'Leonard Cohen', 'Folk'),
    (208, 'Yesterday', 'The Beatles', 'Pop Rock'),
    (209, 'Like a Virgin', 'Madonna ', 'Pop'),
    (210, 'Born in the USA', 'Bruce Springsteen', 'Rock');

-- exibir todos os dados da tabela.  
SELECT * FROM musica;
-- exibir apenas os títulos e os artistas das músicas.
SELECT titulo, artista FROM musica;
-- exibir apenas os dados das músicas de um determinado gênero.
SELECT * FROM musica WHERE genero = 'Pop Rock';
-- exibir apenas os dados das músicas de um determinado artista.
SELECT * FROM musica WHERE artista = 'The Beatles';
-- exibir os dados da tabela, das músicas cujo título comece com uma determinada letra. 
SELECT * FROM musica WHERE titulo LIKE 'H%';
-- exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
SELECT * FROM musica WHERE artista LIKE '%n';
-- exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM musica WHERE genero LIKE '_o%';
-- exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM musica WHERE titulo LIKE '%a_';