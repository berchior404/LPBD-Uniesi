-- 1
CREATE DATABASE innerjoin_estacionamento;

-- 2
USE innerjoin_estacionamento;

CREATE TABLE Cliente(
cpf int NOT NULL UNIQUE,
nome varchar(60) NOT NULL,
dtNasc date NOT NULL,
PRIMARY KEY(cpf));

CREATE TABLE Modelo(
codMod int NOT NULL,
desc_2 varchar(40),
PRIMARY KEY(codMod));

CREATE TABLE Patio(
num int NOT NULL,
ender varchar(40) NOT NULL,
capacidade int NOT NULL,
PRIMARY KEY(num));

CREATE TABLE Veiculo(
placa varchar(8) NOT NULL,
modelo_codMod int NOT NULL,
cliente_cpf int NOT NULL,
cor varchar(20) NOT NULL,
PRIMARY KEY(placa),
FOREIGN KEY(modelo_codMod) references Modelo(codMod),
FOREIGN KEY(cliente_cpf) references Cliente(cpf));

CREATE TABLE Estaciona(
cod int NOT NULL,
patio_Num int NOT NULL,
veiculo_Placa varchar(8) NOT NULL,
dtEntrada varchar(10) NOT NULL,
dtSaida varchar(10) NOT NULL,
hsEntrada varchar(10) NOT NULL,
hsSaida varchar(10) NOT NULL,
primary key(cod),
foreign key(patio_Num) references Patio(num),
foreign key(veiculo_Placa) references Veiculo(placa));

insert into cliente(cpf, nome, dtNasc) values ('123456789', 'Isadora dos Santos', '1990/04/21'),
('987654321', 'Paulo Gonçalves', '1992/08/02'), ('147258369', 'Pedro Cardoso', '1998/09/23');

insert into modelo(codMod, desc_2) values ('10', 'Sedã'), ('20', 'Caminhonete'), ('30', 'SUV');

insert into patio(num, ender, capacidade) values ('1010', 'Rua Um', '15'), ('2020', 'Rua Dois', '17'),
('3030', 'Rua Trezentos', '9');

insert into veiculo(placa, modelo_codMod, cliente_cpf, cor) values ('JJJ-2020', '10', '123456789', 'Preto'),
('JEG-2010', '30', '987654321', 'Verde'), ('SEX-1224', '20', '147258369', 'Vermelho');

insert into estaciona(cod, patio_Num, veiculo_Placa, dtEntrada, dtSaida, hsEntrada, hsSaida) values 
('1', '1010', 'JEG-2010', '10/08/20', '11/08/20', '11:30', '10:49'),
('2', '3030', 'JJJ-2020', '12/08/20', '12/08/20', '12:02', '18:43'),
('3', '2020', 'SEX-1224', '24/08/20', '10/09/20', '23:59', '06:55');

-- 3
select c.nome Nomes, v.placa Placas from cliente c inner join veiculo v on c.cpf = v.cliente_cpf; 

-- 4
select c.nome Nome, v.placa Placa from cliente c inner join veiculo v on c.cpf = v.cliente_cpf where v.placa = 'JJJ-2020'; 

-- 5
select v.placa Placa, v.cor from veiculo v inner join estaciona e on v.placa = e.veiculo_Placa  where e.cod = '1';

-- 6
select p.ender Endereço, e.dtEntrada DataEntrada, e.dtSaida DataSaida from patio p
inner join estaciona e on p.num = e.patio_Num   where e.veiculo_Placa = 'JEG-2010';

-- 7
select count(*) Veiculos_Verdes from veiculo v inner join estaciona e on v.placa = e.veiculo_Placa where v.cor = 'Verde'; 

-- 8
select c.nome Cliente  from cliente c inner join veiculo v on c.cpf = v.cliente_cpf where v.modelo_codMod = '1';

-- 9
select v.placa , e.hsEntrada, e.hsSaida from veiculo v inner join estaciona e on v.placa = e.veiculo_Placa where v.cor = 'Verde';

-- 10
select p.ender, e.dtEntrada Data_Entrada, e.dtSaida Data_Saida, e.hsEntrada Hora_Entrada, e.hsSaida Hora_Saida 
from estaciona e inner join patio p on e.patio_Num = p.num where e.veiculo_Placa = 'JJJ-2020';
 
 -- 11
 select c.nome from cliente c inner join veiculo v on c.cpf = v.cliente_cpf
 inner join estaciona e on v.placa = e.veiculo_Placa where e.cod = '2';
 
 -- 12
 select c.cpf from cliente c inner join veiculo v on c.cpf = v.cliente_cpf
 inner join estaciona e on v.placa = e.veiculo_Placa where e.cod = '3';
 
 -- 13
 select m.desc_2 from modelo m inner join veiculo v on m.codMod = v.modelo_codMod
 inner join estaciona e on v.placa = e.veiculo_Placa where e.cod = '2';

-- 14
 select v.placa, c.nome, m.desc_2 from veiculo v inner join cliente c on  v.cliente_cpf = c.cpf
 inner join modelo m on m.codMod = v.modelo_codMod;

