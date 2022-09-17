-- Inserts de exemplo para entendermos melhor o funcionamento das tabelas do banco de dados

create database CoffeeTech;

use CoffeeTech;

create table Fazenda (
idFazenda int primary key auto_increment,
nomeFazenda varchar(45),
cnpj char(14),
cep char(8),
numero varchar(10),
complemento varchar(50),
tamanhoHectares int
);

insert into Fazenda (nomeFazenda, cnpj, cep, numero, complemento, tamanhoHectares) values
('Recanto do Café', '35336528000110', '35576408', '122', 'Quadra B', 170000);

select * from Fazenda;

create table Usuario (
idUsuario int primary key auto_increment,
nome varchar(60),
cpf char(11),
email varchar(50),
senha varchar(50),
fkFazenda int, 
foreign key (fkFazenda) references Fazenda (idFazenda)
);

insert into Usuario (nome, cpf, email, senha, fkFazenda) values
('José Antonio da Silva', '40427371023', 'ze_antonio_silva@recanto.com', 'cafe3456', 1),
('Maria Conceição Marques', '00912652071', 'mariaconceicao@recanto.com', '123Maria', 1);

select * from Usuario;

select * from Usuario join Fazenda on fkFazenda = idFazenda;

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
fkFazenda int,
foreign key (fkFazenda) references Fazenda (idFazenda)
);

insert into Silo (codigoSilo, tipoGrao, luminosidadeMin, luminosidadeMax, temperaturaMin, temperaturaMax, umidadeMin, umidadeMax, fkFazenda) values
('SILO100', 'Café Arábica', 0, 100, 8, 10, 10.5, 11.5, 1),
('SILO101', 'Café Bourbon Vermelho', 0, 100, 8, 10, 10.5, 11.5, 1);

select * from Silo;

select * from Silo join Fazenda on fkFazenda = idFazenda;

create table HistoricoMedicoes (
idHistorico int primary key auto_increment,
dataHora datetime,
luminosidadeLDR int,
temperaturaDHT11 decimal(3,1),
umidadeDHT11 decimal(3,1),
fkSilo int,
foreign key (fkSilo) references Silo (idSilo)
);

insert into HistoricoMedicoes (datahora, luminosidadeLDR, temperaturaDHT11, umidadeDHT11, fkSilo) values
('2022-10-01 15:35:40', 85, 9, 11.2, 1),
('2022-10-01 15:35:40', 83, 10, 10.9, 2);

insert into HistoricoMedicoes (datahora, luminosidadeLDR, temperaturaDHT11, umidadeDHT11, fkSilo) values
('2022-10-01 15:36:40', 86, 10, 10.8, 1),
('2022-10-01 15:36:40', 84, 9, 11.1, 2);

select * from HistoricoMedicoes;

select * from HistoricoMedicoes join Silo on fkSilo = idSilo;
