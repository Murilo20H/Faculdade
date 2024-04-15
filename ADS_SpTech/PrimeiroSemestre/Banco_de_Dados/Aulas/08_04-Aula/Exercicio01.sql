-- Tipos de Atributos
-- simples e composto

-- simples: não pode ser dividido em subpartes
-- Exemplo simples: bairro

-- compostos: pode/deve ser dividido em subpartes
-- Exemplo composto: endereço
-- dividido em: logradouro, número, cep, bairro, cidade, complemento

-- INSERT INTO Pessoa (endereco) VALUES
-- 	('Rua Haddock Lobo, 595, Bairro Cerqueira Cesar, São Paulo')
-- SELECT * FROM Pessoa WHERE endereco LIKE '%São Paulo%';
-- CAso eu queira achar a rua São Paulo, chegaria a cidade São Paulo também

-- Telefone DDI.DDD e prefixo e sufixo
-- +55 11 987654311
-- SELECT * FROM Pessoa WHERE Telefone LIKE '%11%';
-- Caso eu queira achar o DDD 11 e ele esteja junto, não chegaria somente ddd

-- dividir ao máximo


-- Atributo monovalorado: atributos diferentes
-- Exemplo monovalorado: bairro

-- Atributo multivalorado: atributos iguais
-- o sistema precisa ter pelo menos 2 telefones cadastrados

-- Atributo derivado: atributo que vem de outro atributo
-- idade: vem da data de nascimento

-- Atributo identificador: chave primária

CREATE DATABASE adsb;
USE adsb;

CREATE TABLE Funcionario (
idFuncionario int primary key auto_increment, -- atributo identificador
nome varchar(45), -- atributo simples
cep char(8), -- atributo composto (endereco) cep + numero + complemento
numero varchar(45),
telefoneCelular varchar(45), -- atributos multivalorados (telefone fixo e telefone celular)
complemento varchar(45),
telefoneFixo varchar(45)
);

INSERT INTO Funcionario VALUES
	(default, 'Picapau', '04253000', '1500', 'Apto 76', '11987654321', '11987654333'),
	(default, 'Smurf', '04223000', '150', 'Apto 16', '11986654321', '11967654333');
    
SELECT * FROM Funcionario;

CREATE TABLE Dependente (
idDependente int, -- atributo identificador
fkFuncionario int,
constraint pkComposta primary key (idDependente, fkFuncionario),
nome varchar(45), -- atributo simples
parentesco varchar(45),
dataNascimento date,
constraint fkFuncionarioDependente foreign key (fkFuncionario) references Funcionario(idFuncionario)
);

INSERT INTO Dependente VALUES
	(1, 1, 'João', 'irmão', '1999-01-01'),
	(2, 1, 'Joana', 'irmã', '1993-01-01'),
	(1, 2, 'Douglas', 'pai', '1954-01-01');
    
SELECT * FROM Dependente;

SELECT f.nome as 'Nome do funcionário',	d.nome as 'Nome do dependente'
	FROM Funcionario as f JOIN Dependente as d ON idFuncionario = fkFuncionario;
    
    
SELECT nome as 'Nome do dependente', concat(timestampdiff(YEAR, dataNascimento, now()), ' anos') as 'Idade do dependente' FROM Dependente;

SELECT nome as 'Nome do dependente', concat(timestampdiff(MONTH, dataNascimento, now()), ' anos em meses') as 'Idade em meses do dependente' FROM Dependente;

SELECT nome as 'Nome do dependente', concat(timestampdiff(SECOND, dataNascimento, now()), ' anos em segundos') as 'Idade em segundos do dependente' FROM Dependente;


INSERT INTO Funcionario VALUES
	(default, 'Bob Esponja', '04253100', '10', 'Apto 101', '11987651321', '11987154333');

-- Para aparecer o Bob Esponja mesmo que não tenha dependente
SELECT * FROM Funcionario LEFT JOIN Dependente ON idFuncionario = fkFuncionario;
SELECT * FROM Dependente RIGHT JOIN Funcionario ON idFuncionario = fkFuncionario;