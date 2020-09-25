-- 1a
select avg(salario) Média_Salarial from Funcionarios;

-- 1b
select f.primeiro_Nome Nome, f.funcao Função, d.nome Nome from funcionarios f inner join departamentos d on f.codigo_Depto = d.codigo_Depto order by d.nome;

-- 1c
select f.primeiro_Nome Nome, f.endereco Endereço, f.rg RG, f.cpf CPF from funcionarios f inner join departamentos d on f.codigo_Depto = d.codigo_Depto where d.nome = 'TI';

-- 1d
select f.primeiro_Nome Nome, f.salario Salário from funcionarios f where f.data_Nasc > '1980/01/01' and f.data_Nasc < '1990/12/31';

-- Alternando para modelagem do exercício 2
use world;

-- 2a
select co.Name, co.Continent from country co;

-- 2b
select co.Name, co.Region, co.Population from country co where co.Continent = 'Europe';

-- 2c
select sum(LifeExpectancy) from country co where co.Continent = 'Asia';

-- 2d
create view vw_Paises1 as select co.Name, co.HeadOfState, co.GovernmentForm, co.Population from country co where co.Continent = 'South America'
and co.Population > 2000000;

select * from vw_Paises1;

-- 2e
create view vw_Paises2 as select co.Name, co.SurfaceArea, cl.Language from country co inner join countrylanguage cl on co.Code = cl.CountryCode
where cl.Language = 'English' and cl.IsOfficial = 'T' order by co.SurfaceArea asc;

select * from vw_Paises2;

-- 2f
alter view vw_Paises2 as select co.Name, co.SurfaceArea, cl.Language, cl.Percentage from country co inner join countrylanguage cl on co.Code = cl.CountryCode
where cl.Language = 'English' and cl.IsOfficial = 'T' order by co.SurfaceArea asc;

select * from vw_Paises2;
