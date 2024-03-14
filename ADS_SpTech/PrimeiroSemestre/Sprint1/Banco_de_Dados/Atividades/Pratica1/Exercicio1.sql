-- criar e usar o banco de dados adsb.
CREATE DATABASE adsb;
USE adsb;

-- criar a tabela atleta.
CREATE TABLE atleta (
idAtleta int PRIMARY KEY,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int);

-- exibir a tabela atleta.
DESCRIBE atleta;

-- criar atletas para a tabela. 
INSERT INTO atleta VALUES
	(101, 'Gabriel', 'natação', 3),
    (102, 'Miguel', 'basquete', 0),
    (103, 'Arthur', 'natação', 9),
    (104, 'Gael', 'futebol', 4),
    (105, 'Noah', 'futebol', 1),
    (106, 'Heitor', 'vôlei', 0),
    (107, 'Bernardo', 'basquete', 1),
    (108, 'Ravi', 'futebol', 2),
    (109, 'Lucas', 'natação', 3),
    (110, 'Davi', 'vôlei', 0);
    
-- exibir todos os dados da tabela.  
SELECT * FROM atleta;
-- exibir apenas os nomes e quantidade de medalhas dos atletas. 
SELECT nome, qtdMedalha FROM atleta;
-- exibir apenas os dados dos atletas de uma determinada modalidade.  
SELECT * FROM atleta WHERE modalidade = 'basquete';
-- exibir os dados da tabela, dos atletas cujo nome contenha a letra s.  
SELECT * FROM atleta WHERE nome LIKE '%s%';
-- exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra. 
SELECT * FROM atleta WHERE nome LIKE 'G%';
-- exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
SELECT * FROM atleta WHERE nome LIKE '%o';
-- exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
SELECT * FROM atleta WHERE nome LIKE '%r_';