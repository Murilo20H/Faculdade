CREATE DATABASE sprint2;
USE sprint2;

-- EXERCICIO 01
CREATE TABLE Dono (
idDono int primary key auto_increment,
nome varchar(45),
bairro varchar(45),
telefone char(12),
constraint checkTelefone check (telefone LIKE ('_______-____')));

CREATE TABLE Pet (
idPet int primary key auto_increment,
nome varchar(45),
pedigree varchar(45),
constraint checkPedigree check (pedigree IN ('sim', 'não')),
raca varchar(45));

ALTER TABLE Pet ADD COLUMN fkDono int,
	ADD CONSTRAINT fkPetDono FOREIGN KEY (fkDono) REFERENCES Dono(idDono);

ALTER TABLE Pet ADD COLUMN fkPai int,
	ADD CONSTRAINT fkPetPai FOREIGN KEY (fkPai) REFERENCES Pet(idPet);
    
ALTER TABLE Pet ADD COLUMN fkMae int,
	ADD CONSTRAINT fkPetMae FOREIGN KEY (fkMae) REFERENCES Pet(idPet);

INSERT INTO Dono (nome, bairro, telefone) VALUES
('Jorge', 'Jardim Helena', '1199999-9999'),
('Fátima', 'Jardim Romano', '1191234-5678');

INSERT INTO Pet (nome, pedigree, raca, fkDono) VALUES
('Polly', 'não', 'Labrador', 1),
('Lilly', 'não', 'Labrador', 1),
('Batman', 'não', 'Labrador', 1),
('Julia', 'sim', 'Husky', 2),
('Tobby', 'sim', 'Husky', 2),
('Tom', 'sim', 'Husky', 2);

SELECT * FROM Pet;
SELECT * FROM Dono;

UPDATE Pet SET fkPai = 3 WHERE idPet = 2;
UPDATE Pet SET fkPai = 5 WHERE idPet = 6;

UPDATE Pet SET fkMae = 1 WHERE idPet = 2;
UPDATE Pet SET fkMae = 4 WHERE idPet = 6;

SELECT pet.nome AS 'Nome do cachorro', pet.pedigree AS 'Tem pedigree', pet.raca AS 'Raça do cachorro',
	dono.nome AS 'Nome do dono', dono.bairro AS 'Bairro do dono', dono.telefone AS 'Telefone do dono',
    pai.nome AS 'Nome do pai do filhote', mae.nome AS 'Nome da mãe do filhote'
	FROM Pet AS pet JOIN Pet AS pai ON pet.fkPai = pai.idPet
    JOIN Pet AS mae ON pet.fkMae = mae.idPet
    JOIN Dono AS dono ON pet.fkDono = dono.idDono;



-- EXERCICIO 02
CREATE TABLE Carro (
idCarro int primary key auto_increment,
nome varchar(45),
placa char(7),
marca varchar(45));

CREATE TABLE Motorista (
idMotorista int primary key auto_increment,
nome varchar(45),
cnh char(9),
dataValidade date);

ALTER TABLE Motorista ADD COLUMN fkCarro int,
	ADD CONSTRAINT fkMotoristaCarro FOREIGN KEY (fkCarro) REFERENCES Carro(idCarro);

ALTER TABLE Motorista ADD COLUMN fkMotoristaReserva int,
	ADD CONSTRAINT fkMotoristaMotoristaReserva FOREIGN KEY (fkMotoristaReserva) REFERENCES Motorista(idMotorista);

INSERT INTO Carro (nome, placa, marca) VALUES
('Hilux', '1234567', 'Toyota'),
('Montana', '7654321', 'Chevrolet');

INSERT INTO Motorista (nome, cnh, dataValidade, fkCarro) VALUES
('Jorge', '123456789', '2025-10-01', 1),
('Jailson', '987654321', '2027-12-01', 1),
('Nicolas', '111111111', '2026-06-01', 2),
('Mateus', '999999999', '2028-03-01', 2);

SELECT * FROM Carro;
SELECT * FROM Motorista;

UPDATE Motorista SET fkMotoristaReserva = 2 WHERE idMotorista = 1;
UPDATE Motorista SET fkMotoristaReserva = 4 WHERE idMotorista = 3;

SELECT m.nome AS 'Nome do motorista', m.cnh AS 'CNH', date_format(m.dataValidade, '%m/%Y') AS 'Data de validade da CNH',
	concat(c.marca, ' ', c.nome) 'Nome do carro', c.placa AS 'Placa do carro',
    mr.nome AS 'Nome do motorista reserva', mr.cnh AS 'CNH do motorista reserva', date_format(mr.dataValidade, '%m/%Y') AS 'Data de validade da CNH do motorista reserva'
	FROM Motorista AS m JOIN Carro AS c ON m.fkCarro = c.idCarro
    JOIN Motorista AS mr ON m.fkMotoristaReserva = mr.idMotorista;



-- EXERCICIO 03
CREATE TABLE Empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
cnpj char(14));

CREATE TABLE Funcionário (
idFuncionário int primary key auto_increment,
nome varchar(45),
area varchar(45),
salario int);

ALTER TABLE Funcionário ADD COLUMN fkEmpresa int,
	ADD CONSTRAINT fkFuncionárioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa);

ALTER TABLE Funcionário ADD COLUMN fkSupervisor int,
	ADD CONSTRAINT fkFuncionárioSupervisor FOREIGN KEY (fkSupervisor) REFERENCES Funcionário(idFuncionário);
    
ALTER TABLE Empresa ADD COLUMN fkMatriz int,
	ADD CONSTRAINT fkEmpresaMatriz FOREIGN KEY (fkMatriz) REFERENCES Empresa(idEmpresa);

INSERT INTO Empresa (nome, cnpj) VALUES
('Samsung Brazil', '12345678901234'),
('Samsung', '11111111111111'),
('Dell', '99999999999999'),
('Dell Germany', '12345678909876');

UPDATE Empresa SET fkMatriz = 2 WHERE idEmpresa = 1;
UPDATE Empresa SET fkMatriz = 3 WHERE idEmpresa = 4;

INSERT INTO Funcionário (nome, area, salario, fkEmpresa) VALUES
('Jorge', 'analista de dados', 4000, 1),
('Jailson', 'product owner', 6000, 1),
('Samuel', 'gerente', 30000, 4),
('Gabriel', 'analista de dados', 8000, 4);

UPDATE Funcionário SET fkSupervisor = 2 WHERE idFuncionário = 1;
UPDATE Funcionário SET fkSupervisor = 3 WHERE idFuncionário = 4;

SELECT * FROM Funcionário;
SELECT * FROM Empresa;

SELECT f.nome AS 'Nome do funcionário', f.area AS 'Área do funcionário', f.salario AS 'Salário do funcionário',
	e.nome 'Nome da empresa', e.cnpj AS 'CNPJ da empresa',
    m.nome 'Nome da matriz', m.cnpj AS 'CNPJ da matriz',
    s.nome AS 'Nome do supervisor', s.area AS 'Área do supervisor', s.salario AS 'Salário do supervisor'
	FROM Funcionário AS f JOIN Empresa AS e ON f.fkEmpresa = e.idEmpresa
    JOIN Empresa AS m ON e.fkMatriz = m.idEmpresa
    JOIN Funcionário AS s ON f.fkSupervisor = s.idFuncionário;