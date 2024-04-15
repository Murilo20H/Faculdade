-- PRATICA 06
-- EXERCICIO 01
CREATE DATABASE AlunoProjeto;
USE AlunoProjeto;

CREATE TABLE Projeto (
idProjeto int primary key auto_increment,
nome varchar(45),
descricao varchar(80)
);

CREATE TABLE Aluno (
ra char(8),
fkProjeto int,
constraint pkComposta primary key (ra, fkProjeto),
nome varchar(45),
telefoneCelular char(11),
fkRepresentante char(8),
constraint fkAlunoRepresentante foreign key (fkRepresentante) references Aluno(ra), 
constraint fkProjetoAluno foreign key (fkProjeto) references Projeto(idProjeto)
);

CREATE TABLE Acompanhante (
idAcompanhante int auto_increment,
fkAluno char(8),
constraint pkComposta primary key (idAcompanhante, fkAluno),
nome varchar(45),
relacao varchar(45),
constraint fkAlunoAcompanhante foreign key (fkAluno) references Aluno(ra)
);

INSERT INTO Projeto VALUES
	(default, 'Monitoramento de temperatura do café', 'Projeto para monitorar a temperatura dos grãos do café'),
	(default, 'Monitoramento de umidade do morango', 'Projeto para monitorar a umidade dos morangos na estufa');
 
INSERT INTO Aluno VALUES
	('01241010', 1, 'Wanderley', '11913983684', null),
	('01241014', 1, 'Miguel', '11935617998', null),
	('01241112', 2, 'Gustavo', '11944393617', '01241010'),
	('01241011', 2, 'Dionísio', '11954354979', '01241010'),
	('01241018', 1, 'Matheus', '11981892859', '01241014');
 
INSERT INTO Acompanhante VALUES
	(default, '01241010', 'Pietro', 'pai'),
	(default, '01241014', 'Silvana', 'mãe'),
	(default, '01241011', 'Gerson', 'irmão'),
	(default, '01241011', 'Caroline', 'irmã'),
	(default, '01241011', 'Abner', 'irmão'),
	(default, '01241018', 'Juan', 'pai');
    
SELECT * FROM Projeto;
SELECT * FROM Aluno;
SELECT * FROM Acompanhante;

SELECT a.ra, a.nome, a.telefoneCelular, p.nome, p.descricao FROM Aluno AS a 
	JOIN Projeto AS p ON p.idProjeto = a.fkProjeto;
    
SELECT al.ra, al.nome, al.telefoneCelular, ac.nome, ac.relacao FROM Aluno AS al 
	JOIN Acompanhante AS ac ON ac.fkAluno = al.ra;
    
SELECT al.ra, al.nome, al.telefoneCelular, r.ra, r.nome, r.telefoneCelular FROM Aluno AS al 
	JOIN Aluno AS r ON r.ra = al.fkRepresentante;
    
SELECT a.ra, a.nome, a.telefoneCelular, p.nome, p.descricao FROM Aluno AS a 
	JOIN Projeto AS p ON p.idProjeto = a.fkProjeto WHERE p.nome = 'Monitoramento de umidade do morango';

SELECT al.ra, al.nome, al.telefoneCelular, p.nome, p.descricao, ac.nome, ac.relacao FROM Aluno AS al 
	JOIN Projeto AS p ON al.fkProjeto = p.idProjeto JOIN Acompanhante AS ac ON ac.fkAluno = al.ra;
 

 
-- EXERCICIO 02
CREATE DATABASE Campanha;
USE Campanha;

CREATE TABLE Organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
rua varchar(45),
bairro varchar(45),
email varchar(45),
fkExperiente int,
constraint fkOrganizadorExperiente foreign key (fkExperiente) references Organizador(idOrganizador)
) auto_increment = 30;

CREATE TABLE Campanha (
idCampanha int auto_increment,
fkOrganizador int,
constraint pkComposta primary key (idCampanha, fkOrganizador),
categoria varchar(45),
instituicao1 varchar(45),
instituicao2 varchar(45),
dataFinal date,
constraint fkOrganizadorCampanha foreign key (fkOrganizador) references Organizador(idOrganizador)
) auto_increment = 500;

INSERT INTO Organizador VALUES
	(default, 'William', 'Rua Mato Grosso', 'Morro Branco', 'william@gmail.com', null),
	(default, 'Luan', 'Rua 15 de Novembro', 'Vila Mara', 'luan@gmail.com', 30),
	(default, 'Otavio', 'Rua Guairá', 'Haddock Lobo', 'otavio@gmail.com', 30);
    
INSERT INTO Campanha VALUES
	(default, 30, 'produto de higiene', 'GPNG', null, '2026-10-19'),
	(default, 31, 'alimento', 'ESPD', null, '2027-12-12'),
	(default, 31, 'alimento', 'SPQ', 'ESPD', '2025-09-01'),
	(default, 32, 'máscaras de proteção', 'TVES', null, '2026-01-09');
    
SELECT * FROM Organizador;
SELECT * FROM Campanha;
    
SELECT o.nome, o.rua, o.bairro, o.email, c.categoria, c.instituicao1, ifnull(c.instituicao2, 'Somente uma instituição'), c.dataFinal FROM Organizador AS o
	JOIN Campanha AS c ON c.fkOrganizador = o.idOrganizador;
    
SELECT o.nome, o.rua, o.bairro, o.email, c.categoria, c.instituicao1, ifnull(c.instituicao2, 'Somente uma instituição'), c.dataFinal FROM Organizador AS o
	JOIN Campanha AS c ON c.fkOrganizador = o.idOrganizador WHERE o.nome = 'Luan';

SELECT o.nome, o.rua, o.bairro, o.email, oe.nome, oe.rua, oe.bairro, oe.email FROM Organizador AS oe
	JOIN Organizador AS o ON oe.idOrganizador = o.fkExperiente;
    
SELECT o.nome, o.rua, o.bairro, o.email, oe.nome, oe.rua, oe.bairro, oe.email FROM Organizador AS oe
	JOIN Organizador AS o ON oe.idOrganizador = o.fkExperiente WHERE oe.nome = 'William';

SELECT o.nome, o.rua, o.bairro, o.email, c.categoria, c.instituicao1, ifnull(c.instituicao2, 'Somente uma instituição'), c.dataFinal, oe.nome, oe.rua, oe.bairro, oe.email FROM Organizador AS o
	JOIN Campanha AS c ON o.idOrganizador = c.fkOrganizador 
    JOIN Organizador AS oe ON oe.idOrganizador = o.fkExperiente;
    
SELECT o.nome, o.rua, o.bairro, o.email, c.categoria, c.instituicao1, ifnull(c.instituicao2, 'Somente uma instituição'), c.dataFinal, oe.nome, oe.rua, oe.bairro, oe.email FROM Organizador AS o
	JOIN Campanha AS c ON o.idOrganizador = c.fkOrganizador 
    JOIN Organizador AS oe ON oe.idOrganizador = o.fkExperiente WHERE o.nome = 'Otavio';