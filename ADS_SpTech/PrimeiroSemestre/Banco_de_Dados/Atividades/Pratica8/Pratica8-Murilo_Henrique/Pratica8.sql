CREATE DATABASE Venda;
USE Venda;

CREATE TABLE endereco (
idEndereco int primary key auto_increment,
complemento varchar(45),
numero varchar(10),
cep char(9)
);

CREATE TABLE cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
fkEndereco int,
fkIndicador int,
foreign key (fkEndereco) references endereco(idEndereco),
foreign key (fkIndicador) references cliente(idCliente)
);

CREATE TABLE venda (
idVenda int primary key auto_increment,
valorTotal decimal(7,2),
dataVenda datetime,
fkCliente int,
foreign key (fkCliente) references cliente(idCliente)
);

CREATE TABLE produto (
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
preco decimal(6,2)
);

CREATE TABLE carrinhoCompras (
idCarrinhoCompras int,
fkProduto int,
fkVenda int,
primary key (idCarrinhoCompras, fkProduto, fkVenda),
quantidadeProdutos int,
desconto decimal(6,2),
foreign key (fkProduto) references produto(idProduto),
foreign key (fkVenda) references venda(idVenda)
);



INSERT INTO endereco VALUES
(default, 'Ap 103', '193', '56787-345'),
(default, 'Ap 407', '27', '23512-345'),
(default, '', '194B', '09876-345');

INSERT INTO cliente VALUES
(default, 'Murilo', 'murilohenrique@gmail.com', 1, null),
(default, 'Jorge', 'jorgemateus@gmail.com', 2, 1),
(default, 'João', 'joaokevin@gmail.com', 3, 1);

INSERT INTO venda VALUES
(default, 1200.00, '2024-05-06 15:30:00', 1),
(default, 1000.00, '2024-05-06 17:20:00', 1),
(default, 300.00, '2024-05-06 10:10:00', 2),
(default, 199.99, '2024-05-06 09:45:00', 2),
(default, 2400.00, '2024-05-06 23:50:00', 3);

INSERT INTO produto VALUES
(default, 'tênis nike', 'tênis verde', 700),
(default, 'tênis adidas', 'tênis vermelho', 500),
(default, 'camisa adidas', 'camisa PP azul', 500),
(default, 'calça nike', 'calça 38 preta', 300),
(default, 'camisa puma', 'camisa GG cinza', 199.99),
(default, 'notebook dell', 'notebook inspiron, i5, cinza', 2400);

INSERT INTO carrinhoCompras VALUES
(1, 1, 1, 1, 0),
(1, 2, 1, 1, 0),
(1, 3, 2, 2, 0),
(1, 4, 3, 1, 0),
(1, 5, 4, 1, 0),
(1, 6, 5, 1, 0);



-- E
SELECT * FROM endereco;
SELECT * FROM cliente;
SELECT * FROM venda;
SELECT * FROM produto;
SELECT * FROM carrinhoCompras;

-- G
SELECT * FROM cliente JOIN venda
	ON idCliente = fkCliente;

-- H
SELECT * FROM cliente JOIN venda
	ON idCliente = fkCliente
    WHERE cliente.nome = 'Murilo';

-- I
SELECT * FROM cliente JOIN cliente as indicador
	ON indicador.idCliente = cliente.fkIndicador;

-- J
SELECT * FROM cliente JOIN cliente as indicador
	ON indicador.idCliente = cliente.fkIndicador
    WHERE indicador.nome = 'Murilo';

-- L
SELECT * FROM cliente JOIN cliente as indicador
	ON indicador.idCliente = cliente.fkIndicador
    JOIN venda ON venda.fkCliente = cliente.idCliente
    JOIN carrinhoCompras ON carrinhoCompras.fkVenda = venda.idVenda
    JOIN produto ON carrinhoCompras.fkProduto = produto.idProduto;

-- M
SELECT date_format(venda.dataVenda, '%d/%m/%Y %h:%m:%s') as 'Data da compra:',
	produto.nome as 'Nome do produto:',
    carrinhoCompras.quantidadeProdutos as 'Quantidade de produtos no carrinho:'
	FROM venda 
    JOIN carrinhoCompras ON carrinhoCompras.fkVenda = venda.idVenda
    JOIN produto ON carrinhoCompras.fkProduto = produto.idProduto
    WHERE venda.idVenda = 2;
    
-- N
SELECT produto.nome as 'Nome do produto:',
    produto.preco as 'Valor do produto:',
    SUM(carrinhoCompras.quantidadeProdutos) FROM produto 
    JOIN carrinhoCompras ON idProduto = fkProduto
    GROUP BY produto.nome, produto.preco;
    
-- O
INSERT INTO cliente VALUES
(default, 'Anne', 'annematos@gmail.com', 2, 3);

-- P
SELECT MIN(preco) as 'Produto mais barato:' FROM produto;
SELECT MAX(preco) as 'Produto mais caro:' FROM produto;

-- Q
SELECT SUM(preco) as 'Soma dos preços dos produto:' FROM produto;
SELECT ROUND(AVG(preco),2) as 'Média dos preços dos produtos:' FROM produto;

-- R
SELECT preco as 'Preços acima da média' FROM produto 
	WHERE preco >= (SELECT AVG(preco) FROM produto);
    
-- S
SELECT SUM(DISTINCT preco) as 'Soma dos preços dos produto:' FROM produto;

-- T
SELECT SUM(produto.preco) as 'Soma dos preços dos produtos de uma venda:' FROM venda
	JOIN carrinhoCompras ON carrinhoCompras.fkVenda = venda.idVenda
	JOIN produto ON carrinhoCompras.fkProduto = produto.idProduto
	WHERE venda.idVenda = 1 GROUP BY venda.idVenda;