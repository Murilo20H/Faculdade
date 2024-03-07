-- NOMES: Murilo Henrique Almeida Correa, Laise Maria Martin de Almeida, Ronielli Andrade dos Santos
-- CRIANDO DO BANCO DE DADOS PARA A SPRINT 1
CREATE DATABASE sprint1;
USE sprint1;

-- CRIANDO DA TABELA SETOR
CREATE TABLE condominio (
	idCondominio int primary key auto_increment, -- identificador unico do condominio
    nomeCondominio varchar(40) not null, -- nome do condominio
    quantidadeCasas int not null, -- quantidade de casas
	quantidadeMoradores int not null, -- quantidade de moradores
    nomeSindico varchar(50) not null -- nome do sindico
);

-- CRIANDO DA TABELA MERCADO
CREATE TABLE carrinhoDeCompras (
	idCarrinho int primary key auto_increment, -- identificador unico do carrinho de compras
    quantidadeProdutos int not null, -- quantidade de produtos
    valorCompra decimal(8, 2) not null, -- valor total da compra com duas casas decimais
    frete decimal(5, 2) not null -- frete da compra com duas casas decimais
);

-- CRIANDO DA TABELA CADASTRO
CREATE TABLE endereco (
	idEndereco int primary key auto_increment, -- identificador unico do endereco
    cep char(9) not null, -- quantidade de produtos
    constraint checkCep check (cep like ('_____-___')), -- restricao para o cep ("5 caracteres" + "-" + "3 caracteres")
    rua varchar(40) not null, -- rua
    bairro varchar(40) not null, -- bairro
    cidade varchar(40) not null, -- cidade
    uf char(2) not null, -- sigla do estado
    numero int not null -- numero da casa
);

-- INSERINDO DADOS NO CONDOMINIO
INSERT INTO condominio VALUES
	(default, 'Casa Jardim - Paineiras', 20, 58, 'Jorge Oliveira'),
    (default, 'Condomínio Casa de Itália', 14, 37, 'Jailson de Matos'),
    (default, 'Casas Boa Vista', 30, 82, 'Jadson Silva');
    
-- INSERINDO DADOS NO CARRINHO DE COMPRAS
INSERT INTO carrinhoDeCompras  VALUES
	(default, 5, 320.98, 12.00),
    (default, 12, 927.39, 50.00),
    (default, 2, 115.78, 9.90);
    
-- INSERINDO DADOS NO ENDERECO
INSERT INTO endereco VALUES
	(default, '01416-001', 'Pamplona', 'Jardim Paulista', 'Itaquaquecetuba', 'SP', 1844),
    (default, '01317-001', 'Alameda Ribeirão Preto', 'Bela Vista', 'São Paulo', 'SP', 763),
    (default, '03639-070', 'Joel Rodrigues Blandy', 'Penha', 'Mogi das Cruzes', 'SP', 739);
    
-- EXIBINDO A TABELA CONDOMINIO
SELECT nomeCondominio AS 'Nome do condominio:',
	quantidadeCasas AS 'Quantidade de casas:',
	quantidadeMoradores AS 'Quantidade de moradores:',
    nomeSindico AS 'Nome do sindico:' FROM condominio;
    
-- EXIBINDO A TABELA CARRINHO DE COMPRAS
SELECT quantidadeProdutos AS 'Quantidade de produtos:',
	valorCompra AS 'Valor total da compra:',
    frete AS 'Valor do frete:' FROM carrinhoDeCompras;

-- EXIBINDO A TABELA ENDERECO
SELECT concat('CEP: ', cep,' | Rua: ', rua, ' | Bairro: ', bairro, ' | Cidade: ', cidade, ' | Estado: ', uf, ' | Nº', numero) AS 'Endereço: ' FROM endereco;

-- O SINDICO JORGE OLIVEIRA MORREU, E TEVE QUE SER SUBSTITUIDO PELO SINDICO JOAO KEVIN
UPDATE condominio SET nomeSindico = 'João Kevin' WHERE idCondominio = 1;

-- A LOJA AGORA TRABALHA COM PRODUTOS IMPORTADOS
ALTER TABLE carrinhoDeCompras ADD COLUMN tipoCompra varchar(13);

-- DEVIDO A CONFUSAO DOS CLIENTES, FOI FEITA UMA VALIDACAO
ALTER TABLE carrinhoDeCompras ADD CONSTRAINT checkTipoCompra CHECK (tipoCompra IN('nacional', 'internacional'));

-- INSERINDO TIPO DA COMPRA NA TABELA CARRINHO DE COMPRAS
UPDATE carrinhoDeCompras SET tipoCompra = 'nacional' WHERE idCarrinho IN (1,2);
UPDATE carrinhoDeCompras SET tipoCompra = 'internacional' WHERE idCarrinho = 3;

-- PARA CALCULAR O TEMPO ESTIMADO DA ENTREGA FOI NECESSARIO ADICIONAR O CAMPO DATA DA COMPRA
ALTER TABLE carrinhoDeCompras ADD COLUMN dataCompra datetime;

-- INSERINDO TIPO DA COMPRA NA TABELA CARRINHO DE COMPRAS
UPDATE carrinhoDeCompras SET dataCompra = '2024-02-26 10:50:27' WHERE idCarrinho = 1;
UPDATE carrinhoDeCompras SET dataCompra = '2023-10-18 07:32:19' WHERE idCarrinho = 2;
UPDATE carrinhoDeCompras SET dataCompra = '2024-03-03 22:43:07' WHERE idCarrinho = 3;

-- EXIBINDO OS DADOS ATULALIZADOS DA TABELA CARRINHO DE COMPRAS
SELECT quantidadeProdutos AS 'Quantidade de produtos:',
	valorCompra AS 'Valor total da compra:',
    frete AS 'Valor do frete:',
    tipoCompra AS 'Tipo da compra:',
    date_format(dataCompra, '%d/%m/%Y') AS 'Data da compra:' FROM carrinhoDeCompras;

-- PARA A REALIZACAO DA CONSTRUCAO DE UMA RODOVIA, FOI NECESSARIO A DEMOLICAO DE UMA CASA QUE ESTAVA NO CAMINHO
DELETE FROM endereco WHERE idEndereco = 3;

-- UM ITEM FOI RETIRADO DO CARRINHO DE COMPRAS
UPDATE carrinhoDeCompras SET quantidadeProdutos = 11 WHERE idCarrinho = 2;
UPDATE carrinhoDeCompras SET valorCompra = 877.81 WHERE idCarrinho = 2;

-- UMA NOVA LEI FOI CRIADA, E AGORA NAO PRECISA MAIS DE SINDICOS NOS CONDOMINIOS
ALTER TABLE condominio DROP COLUMN nomeSindico;

-- EXIBINDO OS DADOS ATUALIZADOS DA TABELA CONDOMINIO
SELECT nomeCondominio AS 'Nome do condominio:',
	quantidadeCasas AS 'Quantidade de casas:',
	quantidadeMoradores AS 'Quantidade de moradores:' FROM condominio;

-- MAIS UMA LEI FOI CRIADA, E AGORA NAO PODE MAIS EXISTIR CONDOMINIOS
TRUNCATE TABLE condominio;