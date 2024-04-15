-- EXERCICIO 01
USE sprint1;

CREATE TABLE Professor (
idProfessor int primary key auto_increment,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40));

INSERT INTO Professor VALUES 
(default, 'João', 'da Silva', 'matemática', 'física'),
(default, 'Joelinton', 'Sampaio', 'história', 'geografia'),
(default, 'Jack', 'Almeida', 'filosofia', 'sociologia'),
(default, 'Nicolas', 'Pereira', 'biologia', 'química'),
(default, 'Pedro', 'Ferreira', 'português', 'geografia'),
(default, 'Lucas', 'de Sousa', 'química', 'matemática');

CREATE TABLE Disciplina (
idDisc int primary key auto_increment,
nomeDisc varchar(45));

INSERT INTO Disciplina VALUES
(default, 'matemática'),
(default, 'filosofia'),
(default, 'português'),
(default, 'física'),
(default, 'biologia'),
(default, 'química'),
(default, 'geografia'),
(default, 'história');

ALTER TABLE Disciplina ADD COLUMN fkProfessor int, ADD CONSTRAINT fkDisciplinaProfessor
	foreign key (fkProfessor) references Professor(idProfessor);

UPDATE Disciplina SET fkProfessor = 1 WHERE idDisc IN (1, 4);
UPDATE Disciplina SET fkProfessor = 2 WHERE idDisc = 7;
UPDATE Disciplina SET fkProfessor = 3 WHERE idDisc IN (2, 8);
UPDATE Disciplina SET fkProfessor = 4 WHERE idDisc = 5;
UPDATE Disciplina SET fkProfessor = 5 WHERE idDisc = 3;
UPDATE Disciplina SET fkProfessor = 6 WHERE idDisc = 6;

SELECT * FROM Professor JOIN Disciplina ON idProfessor = fkProfessor;

SELECT d.nomeDisc AS 'Nome da disciplina:', p.nome AS 'Nome do professor:' FROM Professor AS p JOIN Disciplina AS d ON idProfessor = fkProfessor;

SELECT * FROM Professor AS p JOIN Disciplina AS d ON idProfessor = fkProfessor WHERE p.sobrenome = 'da Silva';

SELECT p.especialidade1 AS 'Especialidade 1:', d.nomeDisc AS 'Nome da disciplina:' FROM Professor AS p JOIN Disciplina AS d ON idProfessor = fkProfessor WHERE p.nome = 'João' ORDER BY p.especialidade1 ASC;



-- EXERCICIO 02
USE sprint2;

CREATE TABLE Curso (
idCurso int primary key auto_increment,
nome varchar(50),
sigla char(3),
coordenador varchar(50));

INSERT INTO Curso VALUES
(default, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Jerson'),
(default, 'CIências da Computação', 'CCO', 'Marise'),
(default, 'Sistemas da Informação', 'SIS', 'João');

CREATE TABLE Aluno (
idAluno int primary key auto_increment,
nome varchar(50),
idade int,
ra varchar(8),
constraint checkRa check (ra LIKE ('01241___')));

INSERT INTO Aluno VALUES
(default, 'Guilherme', 19, '01241099'),
(default, 'Mike', 17, '01241599'),
(default, 'João', 24, '01241567'),
(default, 'Kevin', 18, '01241098'),
(default, 'Vitor', 18, '01241345'),
(default, 'Luis', 22, '01241124'),
(default, 'Gabriel', 21, '01241853'),
(default, 'Samuel', 17, '01241981'),
(default, 'Jorge', 32, '01241777'),
(default, 'Joaquim', 18, '01241001');

ALTER TABLE Aluno ADD COLUMN fkCurso int, ADD CONSTRAINT fkAlunoCurso
	foreign key (fkCurso) references Curso(idCurso);
    
UPDATE Aluno SET fkCurso = 1 WHERE idAluno IN (1, 3, 5, 9, 10);
UPDATE Aluno SET fkCurso = 2 WHERE idAluno IN (2, 4, 6);
UPDATE Aluno SET fkCurso = 3 WHERE idAluno IN (7, 8);

SELECT * FROM Aluno JOIN Curso ON idCurso = fkCurso;

SELECT * FROM Curso AS c JOIN Aluno AS a ON idCurso = fkCurso WHERE c.coordenador = 'Marise';
SELECT * FROM Curso AS c JOIN Aluno AS a ON idCurso = fkCurso WHERE a.idade = 18;



-- DESAFIO 1
USE sprint2;

CREATE TABLE Notebook (
idNotebook int primary key auto_increment,
modelo varchar(30),
preco int);

INSERT INTO Notebook VALUES
(default, 'inspiron 15 3520', 3000),
(default, 'Macbook air m2', 7000),
(default, 'inspiron 15', 2489),
(default, 'Nitro 5', 4500),
(default, 'Galaxy Book Go', 1890),
(default, 'Galaxy Book 2', 3998),
(default, 'Aspire A315', 2699);

CREATE TABLE Marca (
idMarca int primary key auto_increment,
nome varchar(20),
sistemaOperacional varchar(40));

INSERT INTO Marca VALUES
(default, 'Dell', 'Windows 11'),
(default, 'Acer', 'Windows 11'),
(default, 'MacBook', 'MacOS'),
(default, 'Samsung', 'Windows 11');

ALTER TABLE Notebook ADD COLUMN fkMarca int, ADD CONSTRAINT fkNotebookMarca
	foreign key (fkMarca) references Marca(idMarca);
    
UPDATE Notebook SET fkMarca = 1 WHERE idNotebook IN (1, 3);
UPDATE Notebook SET fkMarca = 2 WHERE idNotebook IN (4, 7);
UPDATE Notebook SET fkMarca = 3 WHERE idNotebook = 2;
UPDATE Notebook SET fkMarca = 4 WHERE idNotebook IN (5, 6);

SELECT * FROM Notebook JOIN Marca ON idMarca = fkMarca;

SELECT * FROM Notebook AS n JOIN Marca AS m ON idMarca = fkMarca WHERE m.nome = 'Acer';



-- DESAFIO 2
USE sprint2;

CREATE TABLE Carro (
idCarro int primary key auto_increment,
modelo varchar(45),
marca varchar(45),
preco int);

INSERT INTO Carro VALUES
(default, 'Hilux', 'Toyota', 334890),
(default, 'Celta', 'Chevrolet', 28120),
(default, 'Creta', 'Hyundai', 160990),
(default, 'Mobi', 'Fiat', 71990),
(default, 'Renault', 'Kwid', 72640),
(default, 'Montana', 'Chevrolet', 125260);

CREATE TABLE Motor (
idMotor int primary key auto_increment,
modelo varchar(20),
cavalos int);

INSERT INTO Motor VALUES
(default, 'V6 3.5', 415),
(default, '1.0 Flexpower VHCE', 78),
(default, '1.5 Turbo', 160),
(default, '1.0 Fire 8V', 74),
(default, '1.0 SCe 12V', 71),
(default, '1.2 Turbo', 133);

ALTER TABLE Carro ADD COLUMN fkMotor int, ADD CONSTRAINT fkCarroMotor
	foreign key (fkMotor) references Motor(idMotor);
    
UPDATE Carro SET fkMotor = 1 WHERE idCarro = 1;
UPDATE Carro SET fkMotor = 2 WHERE idCarro = 2;
UPDATE Carro SET fkMotor = 3 WHERE idCarro = 3;
UPDATE Carro SET fkMotor = 4 WHERE idCarro = 4;
UPDATE Carro SET fkMotor = 5 WHERE idCarro = 5;
UPDATE Carro SET fkMotor = 6 WHERE idCarro = 6;

SELECT * FROM Carro JOIN Motor ON idMotor = fkMotor;

SELECT * FROM Carro AS c JOIN Motor AS m ON idMotor = fkMotor WHERE m.cavalos >= 120 ORDER BY m.cavalos DESC;