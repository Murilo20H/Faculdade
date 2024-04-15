CREATE DATABASE familia;
USE familia;

CREATE TABLE pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
dtNasc date,
fkMae int, -- minha mãe também é uma pessoa idPessoa
constraint fkFilhoMae foreign key (fkMae) references pessoa(idPessoa));

INSERT INTO pessoa (nome, dtNasc) VALUES
('Jorge', '1998-10-13'),
('Fátima', '1956-04-19'),
('João', '1952-03-14');

SELECT * FROM pessoa;

UPDATE pessoa SET fkMae = 2 WHERE idPessoa = 1;

-- vamos adicionar a fkPai
ALTER TABLE pessoa ADD COLUMN fkPai int,
	ADD CONSTRAINT fkFlihoPai FOREIGN KEY (fkPai) REFERENCES pessoa(idPessoa);

UPDATE pessoa SET fkPai = 3 WHERE idPessoa = 1;

SELECT * FROM pessoa;

-- nome do filho, nome do pai e nome da mãe
-- fk vai no filho
SELECT filho.nome AS 'Nome do filho', pai.nome AS 'Nome do pai', mae.nome AS 'Nome da mãe'
	FROM pessoa AS filho JOIN pessoa AS pai ON filho.fkPai = pai.idPessoa
    JOIN pessoa AS mae ON filho.fkMae = mae.idPessoa;

INSERT INTO pessoa (nome) VALUES
('Orlando');

UPDATE pessoa SET fkPai = 4 WHERE idPessoa = 3;

SELECT filho.nome AS 'Nome do filho', pai.nome AS 'Nome do pai', mae.nome AS 'Nome da mãe',	avôPaterno.nome AS 'Nome do pai do meu pai'
	FROM pessoa AS filho JOIN pessoa AS pai ON filho.fkPai = pai.idPessoa
    JOIN pessoa AS mae ON filho.fkMae = mae.idPessoa
    JOIN pessoa AS avôPaterno ON pai.fkPai = avôPaterno.idPessoa;