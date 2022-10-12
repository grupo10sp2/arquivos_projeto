-- Inserts de exemplo para entendermos melhor o funcionamento das tabelas do banco de dados
create database CoffeeTech;

use CoffeeTech;

create table Fazenda (
idFazenda int primary key auto_increment,
nomeFazenda varchar(45),
cnpj char(14),
logradouro varchar(70),
numero varchar(10),
complemento varchar(50),
cep char(8),
tamanhoHectares int
);

insert into Fazenda (nomeFazenda, cnpj, logradouro, numero, complemento, cep, tamanhoHectares) values
('Recanto do Café', '35336528000110', 'Rua dos Milagres', '122', 'Quadra B', '35576408', 170000);

select * from Fazenda;

create table Usuario (
idUsuario int primary key auto_increment,
nome varchar(60),
nomeUsuario varchar(50),
cpf char(11),
email varchar(50),
senha varchar(20),
fkFazenda int, 
foreign key (fkFazenda) references Fazenda (idFazenda),
fkAdmin int,
foreign key (fkAdmin) references Usuario (idUsuario)
);

insert into Usuario (nome, nomeUsuario, cpf, email, senha, fkFazenda) values
('José Antonio da Silva', 'jose_silva', '40427371023', 'ze_antonio_silva@recanto.com', 'cafe3456', 1),
('Maria Conceição Marques', 'maria_marques', '00912652071', 'mariaconceicao@recanto.com', '123Maria', 1);

select * from Usuario;

update Usuario set fkAdmin = 1 where idUsuario = 2;

select * from Usuario join Fazenda on fkFazenda = idFazenda;

select * from Usuario as u join Usuario as adm on u.fkAdmin = adm.idUsuario;

create table Silo (
idSilo int auto_increment,
codigoSilo varchar(10),
temperaturaMin decimal(3,1),
temperaturaMax decimal(3,1),
umidadeMin decimal(3,1),
umidadeMax decimal(3,1),
fkFazenda int,
foreign key (fkFazenda) references Fazenda (idFazenda),
primary key (idSilo, fkFazenda)
);

insert into Silo (codigoSilo, temperaturaMin, temperaturaMax, umidadeMin, umidadeMax, fkFazenda) values
('SILO100', 25, 30, 10.5, 11.5, 1),
('SILO101', 25, 30, 10.5, 11.5, 1);

select * from Silo;

select * from Silo join Fazenda on fkFazenda = idFazenda;

create table HistoricoMedicoes (
idHistorico int auto_increment,
nomeSensor varchar(15),
dataHora datetime,
temperatura decimal(3,1),
umidade decimal(3,1),
fkSilo int,
foreign key (fkSilo) references Silo (idSilo),
primary key (idHistorico, fkSilo)
);

insert into HistoricoMedicoes (datahora, nomeSensor, temperatura, umidade, fkSilo) values
('2022-10-01 15:35:40', 'DHT11-001',  25, 11.2, 1),
('2022-10-01 15:35:40', 'DHT11-002', 26, 10.9, 2);

insert into HistoricoMedicoes (datahora, nomeSensor, temperatura, umidade, fkSilo) values
('2022-10-01 15:36:40', 'DHT11-001', 25, 10.8, 1),
('2022-10-01 15:36:40', 'DHT11-002', 27, 11.1, 2);

select * from HistoricoMedicoes;

select * from HistoricoMedicoes join Silo on fkSilo = idSilo;
