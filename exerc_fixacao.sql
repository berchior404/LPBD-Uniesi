-- 1
CREATE DATABASE Exerc_Fixacao;

USE Exerc_Fixacao;

CREATE TABLE Departamentos(
codigo_Depto int,
nome varchar(30),
localizacao varchar(30),
PRIMARY KEY(codigo_Depto));

CREATE TABLE Funcionarios(
codigo_Func int,
codigo_Depto int,
primeiro_Nome varchar(20),
segundo_Nome varchar(20),
ultimo_Nome varchar(20),
data_Nasc date,
cpf varchar(14) unique,
rg varchar(13),
endereco varchar(60),
cep varchar(10),
cidade varchar(30) default 'Itapira',
fone_Res varchar(14),
fone_Cel varchar(15),
funcao varchar(30),
salario decimal(8,2),
PRIMARY KEY(codigo_Func),
FOREIGN KEY(codigo_Depto) REFERENCES Departamentos(codigo_Depto));

INSERT INTO departamentos (codigo_Depto, nome, localizacao) VALUES ('1010', 'Administrativo', 'RH');
INSERT INTO departamentos (codigo_Depto, nome, localizacao) VALUES ('2020', 'Financeiro', 'RH');
INSERT INTO departamentos (codigo_Depto, nome, localizacao) VALUES ('3030', 'Recursos Humanos', 'RH');
INSERT INTO departamentos (codigo_Depto, nome, localizacao) VALUES ('4040', 'Operacional', 'Produção');
INSERT INTO departamentos (codigo_Depto, nome, localizacao) VALUES ('5050', 'Comercial', 'Front-End');

INSERT INTO funcionarios (codigo_Func, codigo_Depto, primeiro_Nome, segundo_Nome, ultimo_Nome, data_Nasc, cpf, rg, endereco, cep, cidade, fone_Res, fone_Cel, funcao, salario) VALUES ('0001', '1010', 'Paula', 'Santos', 'Araújo', '1980/08/14', '410410754-88', '557733x', 'Rua Amazonas, 33', '1300015', 'Mogi Guaçu', '38881699', '74168855', 'Aux. Administrativa', '1600.00');
INSERT INTO funcionarios (codigo_Func, codigo_Depto, primeiro_Nome, segundo_Nome, ultimo_Nome, data_Nasc, cpf, rg, endereco, cep, cidade, fone_Res, fone_Cel, funcao, salario) VALUES ('0002', '1010', 'Charles', 'César', 'Oliveira', '1992/05/25', '123456789', '987654321', 'Rua Chapolin, 2223', '0444991', 'Limeira', '68749092', '13455541', 'Secretário', '2458.25');
INSERT INTO funcionarios (codigo_Func, codigo_Depto, primeiro_Nome, segundo_Nome, ultimo_Nome, data_Nasc, cpf, rg, endereco, cep, cidade, fone_Res, fone_Cel, funcao, salario) VALUES ('0003', '2020', 'Margarida', 'Lopez', 'de Souza', '1995/12/01', '147258369', '58216739', 'Rua das Flores. 10', '789789445', 'Mogi Mirim', '55228741', '54509966', 'Gestora de Contas', '1800.88');
INSERT INTO funcionarios (codigo_Func, codigo_Depto, primeiro_Nome, segundo_Nome, ultimo_Nome, data_Nasc, cpf, rg, endereco, cep, cidade, fone_Res, fone_Cel, funcao, salario) VALUES ('0004', '2020', 'Rosa', 'Oliveira', 'Silva', '2000/01/05', '132465798', '879456213', 'Av. Cobol, 1223', '1425328', 'Campinas', '74710231', '88776655', 'Estágiaria', '987.65');
INSERT INTO funcionarios (codigo_Func, codigo_Depto, primeiro_Nome, segundo_Nome, ultimo_Nome, data_Nasc, cpf, rg, endereco, cep, cidade, fone_Res, fone_Cel, funcao, salario) VALUES ('0005', '3030', 'Marcos', 'Pacheco', 'Costa', '1991/09/04', '33228855', '77446658', 'Av. Paulista, 21', '13845777', 'Mogi Guaçu', '36019922', '96457852', 'Capacitador', '1977.55');
INSERT INTO funcionarios (codigo_Func, codigo_Depto, primeiro_Nome, segundo_Nome, ultimo_Nome, data_Nasc, cpf, rg, endereco, cep, cidade, fone_Res, fone_Cel, funcao, salario) VALUES ('0006', '4040', 'Pedro', 'Henrique', 'Cardoso', '1998/09/23', '41003630871', '531990436', 'Av. Melvin Jones, 372', '13845339', 'Mogi Guaçu', '38118144', '983019092', 'Desenvolvedor', '4500.00');
INSERT INTO funcionarios (codigo_Func, codigo_Depto, primeiro_Nome, segundo_Nome, ultimo_Nome, data_Nasc, cpf, rg, endereco, cep, cidade, fone_Res, fone_Cel, funcao, salario) VALUES ('0007', '5050', 'Júlia', 'Persona', 'Pervarello', '1999/04/28', '3158459052', '47513551', 'Rua Castelo Rosa', '77885566', 'Limeira', '40028922', '94168827', 'UI Designer', '3242.00');

-- 2
SELECT primeiro_Nome, ultimo_Nome FROM Funcionarios ORDER BY ultimo_Nome;

-- 3
SELECT * FROM Funcionarios ORDER BY cidade;

-- 4
SELECT * FROM Funcionarios WHERE salario > 1000 ORDER BY primeiro_nome, segundo_Nome, ultimo_Nome;

-- 5
SELECT data_Nasc, primeiro_Nome FROM Funcionarios ORDER BY data_Nasc DESC;

-- 6
SELECT primeiro_Nome, segundo_Nome, ultimo_Nome, fone_Res, fone_Cel FROM Funcionarios ORDER BY primeiro_Nome;

-- 7
SELECT SUM(salario) AS Salário FROM Funcionarios;

-- 8
SELECT count(*) FROM Funcionarios;

-- 9
SELECT AVG(salario) AS Média_Salarial FROM Funcionarios;

-- 10
SELECT * FROM Funcionarios WHERE cidade = 'Itapira' AND funcao = 'Recepcionista';