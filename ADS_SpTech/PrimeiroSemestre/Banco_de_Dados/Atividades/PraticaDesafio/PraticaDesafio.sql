CREATE DATABASE Exercicio11;
USE Exercicio11;

CREATE TABLE Departamento (
	idDepto INT PRIMARY KEY,
	nomeDepto VARCHAR(45),
	fkGerente INT,
	dataInicioGer DATE
);

CREATE TABLE Funcionario (
	idFunc INT PRIMARY KEY,
    nomeFunc VARCHAR(30),
    salario FLOAT,
    sexo CHAR(1),
    fkSupervisor INT,
    dataNasc DATE,
    fkDepto INT,
    FOREIGN KEY (fkSupervisor) REFERENCES Funcionario(idFunc),
    FOREIGN KEY (fkDepto) REFERENCES Departamento(idDepto)
);

ALTER TABLE Departamento ADD CONSTRAINT fkDepartamentoGerente FOREIGN KEY (fkGerente) REFERENCES Funcionario(idFunc);

CREATE TABLE Projeto (
	idProj INT PRIMARY KEY,
    nomeProj VARCHAR(45),
    localProj VARCHAR(45),
    fkDepto INT,
    FOREIGN KEY (fkDepto) REFERENCES Departamento(idDepto)
);

CREATE TABLE FuncProj (
	fkFunc INT,
    fkProj INT,
    horas DECIMAL(3,1),
    PRIMARY KEY (fkFunc, fkProj),
    FOREIGN KEY (fkFunc) REFERENCES Funcionario(idFunc),
    FOREIGN KEY (fkProj) REFERENCES Projeto(idProj)
);





INSERT INTO Departamento (idDepto, nomeDepto, dataInicioGer) VALUES
	(105, 'Pesquisa', '2008-05-22'),
	(104, 'Administração', '2015-01-01'),
	(101, 'Matriz', '2001-06-19');

INSERT INTO Funcionario VALUES
	(8, 'Juliano Brito', 5500, 'm', null, '1957-11-10', 101),
	(2, 'Fernando Wong', 4500, 'm', 8, '1975-12-08', 105),
	(4, 'Janice Morais', 4300, 'f', 8, '1970-06-20', 104),
	(1, 'Joao Silva', 3500, 'm', 2, '1985-01-09', 105),
	(5, 'Ronaldo Lima', 3800, 'm', 1, '1982-09-15', 105),
	(6, 'Joice Leite', 2500, 'f', 1, '1992-07-31', 105),
	(7, 'Antonio Pereira', 2500, 'm', 4, '1989-03-29', 104),
	(3, 'Alice Sousa', 2500, 'f', 7, '1988-01-19', 104);
    
UPDATE Departamento SET fkGerente = 2 WHERE idDepto = 105;
UPDATE Departamento SET fkGerente = 7 WHERE idDepto = 104;
UPDATE Departamento SET fkGerente = 8 WHERE idDepto = 101;

INSERT INTO Projeto VALUES
	(1, 'Produto X', 'Santo André', 105),
	(2, 'Produto Y', 'Itu', 105),
	(3, 'Produto Z', 'São Paulo', 105),
	(10, 'Informatização', 'Mauá', 104),
	(20, 'Reorganização', 'São Paulo', 101),
	(30, 'Benefícios', 'Mauá', 104);
    
INSERT INTO FuncProj VALUES
	(1, 1, 32.5),
	(1, 2, 7.5),
	(5, 3, 40.0),
	(6, 1, 20.0),
	(6, 2, 20.0),
	(2, 2, 10.0),
	(2, 3, 10.0),
	(2, 10, 10.0),
	(2, 20, 10.0),
	(3, 30, 30.0),
	(3, 10, 10.0),
	(7, 10, 35.0),
	(7, 30, 5.0),
	(4, 30, 20.0),
	(4, 20, 15.0),
	(8, 20, null);





SELECT * FROM Departamento;
SELECT * FROM Funcionario;
SELECT * FROM Projeto;
SELECT * FROM FuncProj;



INSERT INTO Funcionario VALUES (null, 'Cecília Ribeiro', 2800, 'f', null, '1980-04-05', 104);
-- Não, pois a chave primária (idFunc) não pode ser nula (null)

INSERT INTO Funcionario VALUES (3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);
-- Não, pois a chave primária (idFunc) não pode ser igual a outra chave primária da tabela

INSERT INTO Funcionario VALUES (9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);
-- Não, pois a tabela departamento não tem nenhum idDepto igual a 107

INSERT INTO Funcionario VALUES (9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);
-- Sim, pois todos os campos estão corretos



DELETE FROM FuncProj WHERE fkFunc = 3 AND fkProj = 10;
-- Sim, pois todos os campos estão corretos

DELETE FROM Funcionario WHERE idFunc = 4;
-- Não, pois o idFunc 4 aparece em outra tupla na tabela FuncProj e Funcionario

DELETE FROM Funcionario WHERE idFunc = 2;
-- Não, pois o idFunc 4 aparece em outra tupla na tabela FuncProj, Departamento e Funcionario



UPDATE Funcionario SET salario = 2800 WHERE idFunc = 3;
-- Sim, pois o camando está correto

UPDATE Funcionario SET fkDepto = 101 WHERE idFunc = 3;
-- Sim, pois o camando está correto

UPDATE Funcionario SET fkDepto = 107 WHERE idFunc = 3;
-- Não, pois a tabela departamento não tem nenhum idDepto igual a 107





SELECT dataNasc, salario FROM Funcionario WHERE nomeFunc = 'Joao Silva';

SELECT salario FROM Funcionario;

SELECT DISTINCT salario FROM Funcionario;

SELECT * FROM Funcionario ORDER BY nomeFunc;

SELECT * FROM Funcionario ORDER BY salario DESC;

SELECT * FROM Funcionario WHERE salario >= 2000 AND salario <= 4000;

SELECT nomeFunc, salario FROM Funcionario WHERE nomeFunc LIKE 'J%';

SELECT nomeFunc, salario FROM Funcionario WHERE nomeFunc LIKE '%a';

SELECT nomeFunc FROM Funcionario WHERE nomeFunc LIKE '__n%';

SELECT nomeFunc, dataNasc FROM Funcionario WHERE nomeFunc LIKE '%S____';

SELECT * FROM Funcionario WHERE fkDepto = 105;

SELECT * FROM Funcionario WHERE fkDepto = 105 AND salario > 3500;

SELECT * FROM Funcionario WHERE fkDepto = 105 AND nomeFunc LIKE 'J%';

SELECT func.idFunc AS idFuncionario, func.nomeFunc, supervisor.idFunc AS idSupervisor, 
	supervisor.nomeFunc FROM Funcionario AS func JOIN Funcionario 
    AS supervisor ON func.fkSupervisor = supervisor.idFunc;

SELECT Projeto.idProj, Projeto.fkDepto, Projeto.nomeProj, Funcionario.nomeFunc FROM Projeto 
    JOIN Departamento ON Departamento.idDepto = Projeto.fkDepto
    JOIN Funcionario ON Departamento.fkGerente = Funcionario.idFunc
    WHERE localProj = 'São Paulo';
    
SELECT idFunc, nomeFunc, fkProj, nomeProj, horas FROM Funcionario 
    JOIN FuncProj ON fkFunc = idFunc
    JOIN Projeto ON fkProj = idProj;
    
SELECT nomeFunc FROM Funcionario WHERE dataNasc < '1980-01-01';

SELECT COUNT(DISTINCT salario) FROM Funcionario;

SELECT COUNT(DISTINCT localProj) FROM Projeto;

SELECT AVG(salario), SUM(salario) FROM Funcionario;

SELECT MIN(salario), MAX(salario) FROM Funcionario;

SELECT fkDepto, AVG(salario), SUM(salario) FROM Funcionario
	GROUP BY fkDepto;
    
SELECT fkDepto, MIN(salario), MAX(salario) FROM Funcionario
	GROUP BY fkDepto;
    
INSERT INTO Funcionario VALUES
	(10, 'José da Silva', 1800, 'm', 3, '2000-10-12', null),
	(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', null);
    
INSERT INTO Departamento VALUES
	(110, 'RH', 3, '2018-11-10');