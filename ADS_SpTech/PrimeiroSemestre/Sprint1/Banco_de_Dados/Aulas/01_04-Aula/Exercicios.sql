CREATE DATABASE exercicios;
USE exercicios;

-- EXERCICIO 01
CREATE TABLE Aluno (
ra char(8) primary key,
nome varchar(45),
telefone char(12),
constraint checkTelefone check (telefone LIKE ('_______-____')));

CREATE TABLE Projeto (
idProjeto int primary key auto_increment,
nome varchar(45),
descricao varchar(80));

ALTER TABLE Aluno ADD COLUMN fkProjeto int,
	ADD CONSTRAINT fkAlunoProjeto FOREIGN KEY (fkProjeto) REFERENCES Projeto(idProjeto);

ALTER TABLE Aluno ADD COLUMN fkRepresentante char(8),
	ADD CONSTRAINT fkAlunoRepresentante FOREIGN KEY (fkRepresentante) REFERENCES Aluno(ra);

INSERT INTO Projeto (nome, descricao) VALUES
('Controle de temperatura de morangos', 'Monitoramento e controle da temperatura nas estufas de morango'),
('Controle de umidade de café', 'Monitoramento e controle da umidade no armazenamento de café');

INSERT INTO Aluno (ra, nome, telefone, fkProjeto) VALUES
('01241123', 'Helena', '1199999-9999', 1),
('01241124', 'Jorge', '1199999-9998', 1),
('01241125', 'Gabriel', '1199999-9997', 2),
('01241126', 'Luis', '1191234-5678', 2);

UPDATE Aluno SET fkRepresentante = '01241123' WHERE ra = '01241124';
UPDATE Aluno SET fkRepresentante = '01241125' WHERE ra = '01241126';

SELECT * FROM Aluno;
SELECT * FROM Projeto;

SELECT concat(a.nome, ' - ', a.ra) AS 'Aluno', a.telefone AS 'Telefone do aluno',
	p.nome AS 'Projeto', p.descricao AS 'Descrição do projeto'
    FROM Aluno AS a JOIN Projeto AS p ON a.fkProjeto = p.idProjeto;
    
SELECT concat(a.nome, ' - ', a.ra) AS 'Aluno', a.telefone AS 'Telefone do aluno',
	concat(r.nome, ' - ', r.ra) AS 'Representante', r.telefone AS 'Telefone do representante'
    FROM Aluno AS a JOIN Aluno AS r ON a.fkRepresentante = r.ra;
    
SELECT concat(a.nome, ' - ', a.ra) AS 'Aluno', a.telefone AS 'Telefone do aluno',
	p.nome AS 'Projeto', p.descricao AS 'Descrição do projeto'
    FROM Aluno AS a JOIN Projeto AS p ON a.fkProjeto = p.idProjeto WHERE p.nome = 'Controle de temperatura de morangos';



-- EXERCICIO 02
CREATE DATABASE Campanha;
USE Campanha;

CREATE TABLE Organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
endereco varchar(80),
email varchar(80),
constraint checkEmail check (email LIKE '%@%.%'),
fkOrganizadorExperiente int,
CONSTRAINT fkOrganizadorOrganizadorExperiente FOREIGN KEY (fkOrganizadorExperiente) REFERENCES Organizador(idOrganizador)
) auto_increment = 30;

CREATE TABLE Campanha (
idCampanha int primary key auto_increment,
categoria varchar(45),
instituicao varchar(45),
dataFinal date,
fkOrganizador int,
CONSTRAINT fkCampanhaOrganizador FOREIGN KEY (fkOrganizador) REFERENCES Organizador(idOrganizador)
) auto_increment = 500;

INSERT INTO Organizador (nome, endereco, email) VALUES
('Jorge', 'Rua Mato Grosso - Morro Branco', 'jorgesilva@hotmail.com'),
('Gabriel', 'Rua Haddock Lobo - São Paulo', 'gabrielmendes@hotmail.com'),
('Gulherme', 'Rua Consolação - Mogi das Cruzes', 'guilhermesousa@hotmail.com'),
('Jailson', 'Rua 25 de Março - Jadim Helena', 'jailsonmatos@hotmail.com');

INSERT INTO Campanha (categoria, instituicao, dataFinal, fkOrganizador) VALUES
('alimento', 'Juntos Somos Mais', '2025-07-19', 30),
('máscaras de proteção', 'Alunos do Bem', '2024-12-20', 30),
('alimento', 'Alunos do Bem', '2024-09-30', 31),
('brinquedos para crianças', 'Juntos Somos Mais', '2026-12-25', 32),
('reciclagem', 'Juntos Somos Mais', '2025-01-01', 33);

UPDATE Organizador SET fkOrganizadorExperiente = 30 WHERE idOrganizador = 31;
UPDATE Organizador SET fkOrganizadorExperiente = 32 WHERE idOrganizador = 33;

SELECT * FROM Campanha;
SELECT * FROM Organizador;

SELECT o.nome AS 'Nome do organizador', o.endereco AS 'Endereço do organizador', o.email AS 'Email do organizador',
	c.categoria AS 'Categoria da campanha', c.instituicao AS 'Instituição da campanha', date_format(c.dataFinal, '%d/%m/%Y') AS 'Data final da campanha'
    FROM Campanha AS c JOIN Organizador AS o ON c.fkOrganizador = o.idOrganizador;
    
SELECT o.nome AS 'Nome do organizador', 
	c.categoria AS 'Categoria da campanha', c.instituicao AS 'Instituição da campanha', date_format(c.dataFinal, '%d/%m/%Y') AS 'Data final da campanha'
    FROM Campanha AS c JOIN Organizador AS o ON c.fkOrganizador = o.idOrganizador WHERE o.nome = 'Jorge';
    
SELECT o.nome AS 'Nome do organizador', o.endereco AS 'Endereço do organizador', o.email AS 'Email do organizador',
	oe.nome AS 'Nome do organizador experiente', oe.endereco AS 'Endereço do organizador experiente', oe.email AS 'Email do organizador experiente'
	FROM Organizador AS o JOIN Organizador AS oe ON o.fkOrganizadorExperiente = oe.idOrganizador;
    
SELECT o.nome AS 'Nome do organizador', o.endereco AS 'Endereço do organizador', o.email AS 'Email do organizador',
	oe.nome AS 'Nome do organizador experiente', oe.endereco AS 'Endereço do organizador experiente', oe.email AS 'Email do organizador experiente'
	FROM Organizador AS o JOIN Organizador AS oe ON o.fkOrganizadorExperiente = oe.idOrganizador WHERE oe.nome = 'Jorge';
    
SELECT o.nome AS 'Nome do organizador', o.endereco AS 'Endereço do organizador', o.email AS 'Email do organizador',
	c.categoria AS 'Categoria da campanha', c.instituicao AS 'Instituição da campanha', date_format(c.dataFinal, '%d/%m/%Y') AS 'Data final da campanha',
	oe.nome AS 'Nome do organizador experiente', oe.endereco AS 'Endereço do organizador experiente', oe.email AS 'Email do organizador experiente'
	FROM Organizador AS o JOIN Organizador AS oe ON o.fkOrganizadorExperiente = oe.idOrganizador
    JOIN Campanha AS c ON c.fkOrganizador = o.idOrganizador;
    
SELECT o.nome AS 'Nome do organizador', o.endereco AS 'Endereço do organizador', o.email AS 'Email do organizador',
	c.categoria AS 'Categoria da campanha', c.instituicao AS 'Instituição da campanha', date_format(c.dataFinal, '%d/%m/%Y') AS 'Data final da campanha',
	oe.nome AS 'Nome do organizador experiente', oe.endereco AS 'Endereço do organizador experiente', oe.email AS 'Email do organizador experiente'
	FROM Organizador AS o JOIN Organizador AS oe ON o.fkOrganizadorExperiente = oe.idOrganizador
    JOIN Campanha AS c ON c.fkOrganizador = o.idOrganizador WHERE o.nome = 'Jailson';