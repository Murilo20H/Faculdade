-- MOSTRA TODOS OS BANCOS DE DADOS
SHOW DATABASES;

USE sprint1;

CREATE TABLE produto (
id int primary key auto_increment,
nome varchar(60) not null, -- este campo não pode ser nulo
tipo varchar(50),
constraint checkTipo check (tipo in ('Comida', 'Variedades')),
preco decimal(5,2),
dataValidade datetime, -- 'YYYY-MM-DD HH:MM:SS'
dataCadastro datetime default current_timestamp -- data que esta no meu servidor na hora que cria um produto
);

INSERT INTO produto (nome, tipo, preco, dataValidade) VALUES
	('Amaciante', 'Variedades', 16.99, null),
    ('Requeijão', 'Comida', 13.76, '2024-05-26 23:59:59');
    
SELECT * FROM produto;

SELECT dataValidade FROM produto WHERE id = 2;
SELECT date_format(dataValidade, '%d/%m/%Y') FROM produto WHERE id = 2;

-- APELIDAR OS CAMPOS - ALIAS - APELIDO
SELECT date_format(dataValidade, '%d/%m/%Y') AS 'Data da Validade' FROM produto WHERE id = 2;

SELECT nome AS NomeProduto, date_format(dataValidade, '%d/%m/%Y') AS 'Data da Validade' FROM produto WHERE id = 2;

-- concat()
SELECT nome, preco FROM produto;
SELECT concat('Nome do produto: ', nome,', preço do produto: R$' , preco) FROM produto;
SELECT concat('Nome do produto: ', nome,', preço do produto: R$' , preco) AS 'Frase' FROM produto;

-- ADICIONAR A COLUNA MARCA QUE EH UNICA
ALTER TABLE produto ADD COLUMN marca varchar(50) unique;

UPDATE produto SET marca = 'Downy' WHERE id = 1;
UPDATE produto SET marca = 'Vigor' WHERE id = 2;

-- default = padrao
ALTER TABLE produto ADD COLUMN desconto int default 0;

INSERT INTO produto (nome) VALUES
('Cerveja');

SELECT * FROM produto;

-- ORDENAR POR ORDEM ALFABETICA
SELECT nome, tipo FROM produto ORDER BY nome;

SELECT nome FROM produto WHERE nome LIKE '%c%' ORDER BY preco;

SELECT nome FROM produto WHERE nome LIKE '%c%' ORDER BY preco DESC;

DELETE FROM produto WHERE id = 3;

TRUNCATE TABLE produto;

DROP TABLE produto;