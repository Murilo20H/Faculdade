-- EXERCICIO 01
CREATE DATABASE Pet;
USE Pet;

CREATE TABLE Cliente (
idCliente int primary key auto_increment,
nome varchar(45),
telefoneFixo char(11),
telefoneCelular char(11),
cep char(9),
numero varchar(10),
bairro varchar(45),
complemento varchar(45)
) auto_increment = 1;

CREATE TABLE Pet (
idPet int auto_increment,
fkCliente int,
constraint pkComposta primary key (idPet, fkCliente),
tipo varchar(45),
nome varchar(45),
raca varchar(45),
dataNascimento date
) auto_increment = 101;

INSERT INTO Cliente VALUES 
	(default, 'Jorge da SIlva', '11987654321', '11912345678', '08572338', '197', 'São Paulo' , 'Bloco: 2 - Apartamento: 403'),
	(default, 'Thiago da SIlva', '11982254321', '11911345678', '08571338', '59', 'Guaianases', 'Casa: 2'),
	(default, 'Daniel Sousa', '11987699321', '11912311678', '085875638', '18', 'São Paulo', 'Bloco: 1 - Apartamento: 102');

INSERT INTO Pet VALUES
	(default, 1, 'cachorro', 'Bucky', 'Husky', '2012-02-01'),
	(default, 1, 'cachorro', 'Jack', 'Golden Retriever', '2013-07-01'),
	(default, 2, 'gato', 'Tom', 'Siamês', '2017-01-01'),
	(default, 3, 'coelho', 'Judy', 'Netherland Dwarf', '2018-12-01'),
	(default, 3, 'cachorro', 'John', 'Beagle', '2020-03-01');
    
SELECT * FROM Cliente;
SELECT * FROM Pet;

ALTER TABLE Cliente MODIFY COLUMN nome varchar(60);

SELECT * FROM Pet WHERE tipo = 'cachorro';
SELECT nome AS 'Nome do pet', date_format(dataNascimento, '%d/%m/%Y') AS 'Data de nascimento' FROM Pet;
SELECT * FROM Pet ORDER BY nome ASC;

SELECT * FROM Cliente ORDER BY bairro DESC;

SELECT * FROM Pet WHERE nome LIKE 'J%';

SELECT * FROM Cliente WHERE nome LIKE '%Silva%';

UPDATE Cliente SET telefoneFixo = '11999999999' WHERE idCliente = 2;

SELECT * FROM Cliente;

SELECT * FROM Pet AS p JOIN Cliente AS c ON p.fkCliente = c.idCliente;
SELECT * FROM Pet AS p JOIN Cliente AS c ON p.fkCliente = c.idCliente WHERE c.nome = 'Jorge da Silva';

DELETE FROM Pet WHERE idPet = 102;

SELECT * FROM Pet;

DROP TABLE Pet;
DROP TABLE Cliente;



-- EXERCICIO 02
CREATE DATABASE pratica5;
USE pratica5;

CREATE TABLE Pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
dataNascimento date,
profissao varchar(45)
);

CREATE TABLE Gasto (
idGasto int auto_increment,
fkPessoa int,
constraint pkComposta primary key (idGasto, fkPessoa),
dataGasto date,
valor float,
descricao varchar(45)
);

INSERT INTO Pessoa VALUES 
	(default, 'Jorge da SIlva', '1994-01-01', 'jornalista'),
	(default, 'Thiago da SIlva', '1987-05-07', 'arquiteto'),
	(default, 'Daniel Sousa', '1970-02-01', 'analista de dados');

INSERT INTO Gasto VALUES
	(default, 1, '2023-04-01', 500.00, 'aluguel'),
	(default, 1, '2023-05-01', 1298.70, 'mercado'),
	(default, 2, '2023-04-01', 900.00, 'aluguel'),
	(default, 2, '2023-04-01', 400.00, 'água e luz'),
	(default, 2, '2023-04-01', 99.99, 'jantar'),
	(default, 3, '2023-05-01', 700.00, 'aluguel'),
	(default, 3, '2023-04-01', 1980.00, 'mercado');
    
SELECT * FROM Pessoa;
SELECT * FROM Gasto;

SELECT * FROM Pessoa WHERE profissao = 'jornalista';
SELECT * FROM Gasto WHERE valor > 800;

SELECT * FROM Pessoa AS p JOIN Gasto AS g ON g.fkPessoa = p.idPessoa;
SELECT * FROM Pessoa AS p JOIN Gasto AS g ON g.fkPessoa = p.idPessoa WHERE p.nome = 'Daniel Sousa';

UPDATE Pessoa SET nome = 'Jorge Henrique da Silva' WHERE idPessoa = 1;
UPDATE Pessoa SET dataNascimento = '1987-05-09' WHERE idPessoa = 2;
UPDATE Pessoa SET profissao = 'desenvolvedor back-end' WHERE idPessoa = 3;

UPDATE Gasto SET valor = 600.00 WHERE idGasto = 1;
UPDATE Gasto SET valor = 1400.00 WHERE idGasto = 2;
UPDATE Gasto SET valor = 850.00 WHERE idGasto = 3;
UPDATE Gasto SET dataGasto = '2023-04-15' WHERE idGasto = 4;
UPDATE Gasto SET valor = 199.99 WHERE idGasto = 5;
UPDATE Gasto SET valor = 600.00 WHERE idGasto = 6;
UPDATE Gasto SET valor = 2000.00 WHERE idGasto = 7;

DELETE FROM Gasto WHERE idGasto = 1;
DELETE FROM Gasto WHERE idGasto = 2;
DELETE FROM Pessoa WHERE idPessoa = 1;



-- EXERCICIO 03
CREATE DATABASE PraticaFuncionario;
USE PraticaFuncionario;

CREATE TABLE Setor (
idSetor int primary key auto_increment,
nome varchar(45),
numeroAndar int
);

CREATE TABLE Funcionario (
idFuncionario int auto_increment,
fkSetor int,
constraint pkComposta primary key (idFuncionario, fkSetor),
nome varchar(45),
telefone char(11),
salario float,
constraint checkSalario check (salario > 0)
);

CREATE TABLE Acompanhante (
idAcompanhante int auto_increment,
fkFuncionario int,
constraint pkComposta primary key (idAcompanhante, fkFuncionario),
nome varchar(45),
relacao varchar(45),
dataNascimento date
);

INSERT INTO Setor VALUES 
	(default, 'back-end', 2),
	(default, 'fron-end', 3),
	(default, 'qa', 4),
	(default, 'database', 5);

INSERT INTO Funcionario VALUES
	(default, 1, 'Pedro', '11987654321', 2200),
	(default, 1, 'Paulo', '11912345678', 5000),
	(default, 2, 'José', '11987654333', 3000),
	(default, 2, 'Marcos', '11987655321', 5300),
	(default, 3, 'Carlos', '11912335678', 6000),
	(default, 4, 'Fernando', '11987653412', 3500),
	(default, 4, 'William', '11918273645', 2700);
    
INSERT INTO Acompanhante VALUES
	(default, 1, 'Chloe', 'irmã', '1980-7-13'),
	(default, 1, 'Ricardo', 'irmão', '1990-10-8'),
	(default, 2, 'Rafael', 'pai', '1970-9-23'),
	(default, 3, 'Lucy', 'irmã', '1997-4-11'),
	(default, 6, 'Tatiana', 'esposa', '1993-11-27'),
	(default, 7, 'Marcos', 'pai', '1966-4-11'),
	(default, 7, 'Eliane', 'irmã', '1991-12-4');
    
SELECT * FROM Setor;
SELECT * FROM Funcionario;
SELECT * FROM Acompanhante;

SELECT * FROM Setor AS s JOIN Funcionario AS f ON f.fkSetor = s.idSetor;
SELECT * FROM Setor AS s JOIN Funcionario AS f ON f.fkSetor = s.idSetor WHERE s.nome = 'database';

SELECT * FROM Funcionario AS f LEFT JOIN Acompanhante AS a ON a.fkFuncionario = f.idFuncionario;
SELECT * FROM Funcionario AS f LEFT JOIN Acompanhante AS a ON a.fkFuncionario = f.idFuncionario WHERE f.nome = 'William';

/* FIZ COM O LEFT, POIS EXISTEM FUNCIONÁRIOS QUE NÃO TEM ACOMPANHANTE */
SELECT * FROM Funcionario AS f LEFT JOIN Acompanhante AS a ON a.fkFuncionario = f.idFuncionario JOIN Setor AS s ON s.idSetor = f.fkSetor;



-- EXERCICIO 03
CREATE DATABASE Treinador;
USE Treinador;

CREATE TABLE Treinador (
idTreinador int primary key auto_increment,
nome varchar(45),
telefone char(11),
email varchar(80),
fkExperiente int,
constraint fkTreinadorExperiente foreign key (fkExperiente) references Treinador(idTreinador)
) auto_increment = 10;

CREATE TABLE Nadador (
idNadador int auto_increment,
fkTreinador int,
constraint pkComposta primary key (idNadador, fkTreinador),
nome varchar(45),
estadoOrigem varchar(45),
dataNascimento date
) auto_increment = 100;

INSERT INTO Treinador (nome, telefone, email) VALUES
	('Rodrigo', '11592583967', 'rodrigo@outlook.com'),
	('Mateus', '11932235488', 'mateus@hotmail.com'),
	('Diego', '11925672397', 'diegocorrea@gmail.com'),
	('Antônio', '11987655321', 'antoniiio@outlook.com'),
	('Carlos', '11999694254', 'carlos.sousa@hotmail.com');

UPDATE Treinador SET fkExperiente = 10 WHERE idTreinador = 11;
UPDATE Treinador SET fkExperiente = 10 WHERE idTreinador = 12;
UPDATE Treinador SET fkExperiente = 13 WHERE idTreinador = 14;
    
INSERT INTO Nadador VALUES
	(default, 10, 'Jadson', 'Minas Gerais', '1980-7-13'),
	(default, 10, 'Clayton', 'São Paulo', '1990-10-8'),
	(default, 11, 'Renato', 'Rio Grande do Sul', '1970-9-23'),
	(default, 12, 'Joelinton', 'São Paulo', '1997-4-11'),
	(default, 13, 'Jefferson', 'Mato Grosso do Sul', '1993-11-27'),
	(default, 14, 'Cláudio', 'São Paulo', '1966-4-11'),
	(default, 14, 'Leonardo', 'Rio de Janeiro', '1991-12-4');
    
SELECT * FROM Treinador;
SELECT * FROM Nadador;

SELECT * FROM Treinador AS t JOIN Nadador AS n ON n.fkTreinador = t.idTreinador;
SELECT * FROM Treinador AS t JOIN Nadador AS n ON n.fkTreinador = t.idTreinador WHERE t.nome = 'Carlos';

SELECT * FROM Treinador AS novato JOIN Treinador AS experiente ON novato.fkExperiente = experiente.idTreinador;
SELECT * FROM Treinador AS novato JOIN Treinador AS experiente ON novato.fkExperiente = experiente.idTreinador WHERE experiente.nome = 'Rodrigo';

SELECT * FROM Treinador AS experiente JOIN Treinador AS novato ON novato.fkExperiente = experiente.idTreinador JOIN Nadador AS nadador ON nadador.fkTreinador = novato.idTreinador;
SELECT * FROM Treinador AS novato JOIN Treinador AS experiente ON novato.fkExperiente = experiente.idTreinador JOIN Nadador AS nadador ON nadador.fkTreinador = novato.idTreinador WHERE novato.nome = 'Diego';