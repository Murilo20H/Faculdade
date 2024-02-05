CREATE TABLE aluno (
ra char(8) primary key,
nome varchar(45),
bairro varchar(45));

INSERT INTO aluno VALUES
	('01241000', 'Jorge', 'Bairroa'),
    ('01241001', 'Pedro', 'Bairrob'),
    ('01241002', 'Lucas', 'Bairroc');

DESCRIBE aluno;

SELECT ra, nome, bairro FROM aluno;
SELECT * FROM aluno;
SELECT * FROM aluno WHERE bairro = 'Bairroa';
SELECT * FROM aluno WHERE nome LIKE '%e';
SELECT * FROM aluno WHERE nome LIKE 'J%';
SELECT * FROM aluno WHERE nome LIKE '%r%';
SELECT * FROM aluno WHERE nome LIKE '_o%';
SELECT * FROM aluno WHERE nome LIKE '%g_';
SELECT * FROM aluno WHERE nome != 'Jorge';
SELECT * FROM aluno WHERE nome <> 'Jorge';