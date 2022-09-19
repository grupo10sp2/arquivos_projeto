-- Inserts de exemplo para entendermos melhor o funcionamento das tabelas do banco de dados

create database CoffeeTech;

use CoffeeTech;

create table Cliente (
idCliente int primary key auto_increment,
nomeCliente varchar(45),
cnpj char(14),
cep char(8),
numero varchar(10),
complemento varchar(50),
tamanhoHectares int
);

insert into Cliente (nomeCliente, cnpj, cep, numero, complemento, tamanhoHectares) values
('Recanto do Café', '35336528000110', '35576408', '122', 'Quadra B', 170000);

select * from Cliente;

create table Usuario (
idUsuario int primary key auto_increment,
nome varchar(60),
cpf char(11),
email varchar(50),
senha varchar(50),
fkCliente int, 
foreign key (fkCliente) references Cliente (idCliente)
);

insert into Usuario (nome, cpf, email, senha, fkCliente) values
('José Antonio da Silva', '40427371023', 'ze_antonio_silva@recanto.com', 'cafe3456', 1),
('Maria Conceição Marques', '00912652071', 'mariaconceicao@recanto.com', '123Maria', 1);

select * from Usuario;

select * from Usuario join Cliente on fkCliente = idCliente;

create table Silo (
idSilo int primary key auto_increment,
codigoSilo varchar(10),
tipoGrao varchar(40),
luminosidadeMin int,
luminosidadeMax int,
temperaturaMin decimal(3,1),
temperaturaMax decimal(3,1),
umidadeMin decimal(3,1),
umidadeMax decimal(3,1),
fkCliente int,
foreign key (fkCliente) references Cliente (idCliente)
);

insert into Silo (codigoSilo, tipoGrao, luminosidadeMin, luminosidadeMax, temperaturaMin, temperaturaMax, umidadeMin, umidadeMax, fkCliente) values
('SILO100', 'Café Arábica', 0, 100, 8, 10, 10.5, 11.5, 1),
('SILO101', 'Café Bourbon Vermelho', 0, 100, 8, 10, 10.5, 11.5, 1);

select * from Silo;

select * from Silo join Cliente on fkCliente = idCliente;

create table colheitaDados (
idcolheitaDados int primary key auto_increment,
dataHora datetime,
luminosidadeLDR int,
temperaturaDHT11 decimal(3,1),
umidadeDHT11 decimal(3,1),
fkSilo int,
foreign key (fkSilo) references Silo (idSilo)
);

insert into colheitaDados (datahora, luminosidadeLDR, temperaturaDHT11, umidadeDHT11, fkSilo) values
('2022-10-01 15:35:40', 85, 9, 11.2, 1),
('2022-10-01 15:35:40', 83, 10, 10.9, 2);

insert into colheitaDados (datahora, luminosidadeLDR, temperaturaDHT11, umidadeDHT11, fkSilo) values
('2022-10-01 15:36:40', 86, 10, 10.8, 1),
('2022-10-01 15:36:40', 84, 9, 11.1, 2);

select * from colheitaDados;

select * from colheitaDados join Silo on fkSilo = idSilo;
