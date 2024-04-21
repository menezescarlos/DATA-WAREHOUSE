CREATE DATABASE DWTESTE

USE DWTESTE

/*
 Criação de tabelas dimensionais
*/

CREATE TABLE D_PRODUTO(
IdProduto INT NOT NULL IDENTITY PRIMARY KEY,
Nome_produto VARCHAR(255),
Categoria VARCHAR(255),
Marca VARCHAR(50)
);

CREATE TABLE D_LOJA(
IdLoja INT NOT NULL IDENTITY PRIMARY KEY,
Nome_loja VARCHAR(255)
);

CREATE TABLE D_DATA(
IdData INT NOT NULL IDENTITY PRIMARY KEY,
Data_venda VARCHAR(255),
Semestre INT,
Ano INT,
);

/*
Criação da tabela fato
*/
CREATE TABLE F_VENDA(
IdProduto INT NOT NULL,
IdLoja INT NOT NULL,
IdData INT NOT NULL,
Valor INT,
Quantidade INT,
CONSTRAINT FK_IdProduto foreign key (IdProduto) references D_PRODUTO(IdProduto),
CONSTRAINT FK_IdLoja foreign key (IdProduto) references D_PRODUTO(IdProduto),
CONSTRAINT FK_IdData foreign key (IdProduto) references D_PRODUTO(IdProduto)
);

/*
   Popular as tabelas dimensionais
*/

insert into D_LOJA (Nome_loja) values 
('Central'),
('Baixada');

insert into D_PRODUTO (Nome_produto, Categoria, Marca) values 
('Geladeira','Eletrodoméstico','Frozen'),
('Celular','Telefonia','Radar'),
('Pneu','Automotivo','Frota');

insert into D_DATA (Data_venda, Semestre, Ano) values 
('01/02/2015',1,2015),
('10/07/2017',2,2017),
('06/11/2018',2,2018),
('25/12/2017',2,2017),
('01/02/2017',1,2017),
('06/11/2018',2,2018),
('09/03/2016',1,2016);

/*
   Popular a tabela fato
*/

insert into F_VENDA (IdLoja, IdProduto, IdData, Valor, Quantidade) values 
(1,1,1,1000,2),
(2,1,2,1000,1),
(1,1,3,1000,1),
(2,2,4,700,3),
(2,2,4,700,1),
(1,3,5,150,4),
(1,3,6,150,4),
(2,3,5,150,2),
(2,3,7,150,1);

/*
   Consultar todos os elementos do Data Warehouse
*/

select * from F_VENDA 
join D_PRODUTO on D_PRODUTO.IdProduto = F_VENDA.IdProduto 
join D_LOJA on D_LOJA.IdLoja = F_VENDA.IdLoja
join D_DATA on D_DATA.IdData = F_VENDA.IdData;

/*
   Utilizar filtro ao consultar os elementos do Data Warehouse
*/

select * from F_VENDA 
join D_PRODUTO on D_PRODUTO.IdProduto = F_VENDA.IdProduto 
join D_LOJA on D_LOJA.IdLoja = F_VENDA.IdLoja 
join D_DATA on D_DATA.IdData = F_VENDA.IdData 
where D_LOJA.Nome_loja = 'Central';

