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

INSERT INTO Atleta VALUES
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

INSERT INTO Atleta VALUES
	(1, 'Thriller', 'The Beatles', 'Funk'),
    (2, 'Aint No Sunshine', 'Gloria Gaynor', 'Disco'),
    (3, 'Respect', 'Aretha Franklin', 'Funk'),
    (4, 'I Will Survive', 'The Beatles', 'Disco'),
    (5, 'Thriller', 'The Beatles', 'Pop');
• Inserir pelo menos 2 albuns;
• Fazer a modelagem lógica conforme a regra de negócio:
• 1 album pode ter 1 ou muitas músicas;
• 1 música é de 1 e somente 1 album;
Execute os comandos para:
a) Exibir todos os dados das tabelas separadamente;
b) Criar a chave estrangeira na tabela de acordo com a regra de negócio;
c) Atualizar os álbuns de cada música;
d) Exibir as músicas e seus respectivos álbuns;
e) Exibir somente o título da música e o nome do seu respectivo álbum;
f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.




CREATE TABLE empresa (
	idEmpresa int primary key auto_increment,
	nome varchar(45),
	responsavel varchar(45));
    
INSERT INTO empresa VALUES
	(default, 'STEFANINI', 'DANIELA'),
	(default, 'C6BANK', 'VANESSA');

SELECT * FROM empresa;

CREATE TABLE aluno (
	ra char(8) primary key,
	nome varchar(45),
	bairro varchar(45),
	fkEmpresa int not null,
	constraint fkAlunoEmpresa foreign key (fkEmpresa) references empresa(idEmpresa));

-- CASO NÃO TENHA CRIADO A FK NA TABELA
ALTER TABLE aluno ADD COLUMN fkEmpresa int not null,
	ADD CONSTRAINT fkAlunoEmpresa foreign key (fkEmpresa) references empresa(idEmpresa);

INSERT INTO aluno VALUES
	('01241999', 'WILL', 'CONSOLAÇÃO', 1),
	('01241998', 'WALL', 'TRIANON MASP', 1),
	('01241997', 'WELL', 'PARAÍSO', 2);

SELECT * FROM aluno;

SELECT * FROM empresa JOIN aluno
	ON idEmpresa = fkEmpresa;

-- SÃO IGUAIS, PORÉM EM ALGUNS SGBDS DO MYSQL PRECISA DE INNER
SELECT * FROM empresa INNER JOIN aluno
	ON idEmpresa = fkEmpresa;
    
SELECT responsavel, bairro FROM empresa JOIN aluno 
	ON idEmpresa = fkEmpresa WHERE bairro = 'PARAÍSO';
    
SELECT empresa.nome, aluno.nome FROM empresa
JOIN aluno ON idEmpresa = fkEmpresa;
    
SELECT a.nome as 'Nome do Aluno', e.nome as 'Nome da Empresa'
FROM empresa as e JOIN aluno as a ON e.idEmpresa = a.fkEmpresa;