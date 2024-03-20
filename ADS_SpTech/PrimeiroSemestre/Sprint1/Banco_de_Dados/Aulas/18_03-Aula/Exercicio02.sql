USE sprint1;

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