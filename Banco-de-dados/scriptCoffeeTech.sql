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
insert into Fazenda (nomeFazenda, cnpj, logradouro, numero, complemento, cep, tamanhoHectares) values
('Fazenda Palhares', '35336528001234', 'Rua Drummond', '234', '', '09090200', 140000);

create table Usuario (
idUsuario int primary key auto_increment,
nome varchar(60),
nomeUsuario varchar(50),
cpf char(11),
email varchar(50),
senha varchar(20),
fkAdmin int,
foreign key (fkAdmin) references Usuario (idUsuario)
);

create table Fazenda_tem_Usuario (
fkFazenda int,
foreign key (fkFazenda) references Fazenda (idFazenda),
fkUsuario int,
foreign key (fkUsuario) references Usuario (idUsuario),
primary key (fkFazenda, fkUsuario)
);

insert into Usuario (nome, nomeUsuario, cpf, email, senha, fkAdmin) values
('José Antonio da Silva', 'jose_silva', '40427371023', 'ze_antonio_silva@recanto.com', 'cafe3456', null),
('Maria Conceição Marques', 'maria_marques', '00912652071', 'mariaconceicao@recanto.com', '123Maria', 1);

insert into Fazenda_tem_Usuario (fkFazenda, fkUsuario) values
(1, 1),
(1, 2),
(2, 1),
(2, 2);

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
('SILO100', 25, 30, 10, 12, 1),
('SILO101', 25, 30, 10, 12, 1),
('SILO102', 25, 30, 10, 12, 2),
('SILO103', 25, 30, 10, 12, 2);

create table Sensor (
idSensor int primary key auto_increment,
TipoSensor varchar(10),
fkSilo int,
foreign key (fkSilo) references Silo (idSilo)
);

insert into Sensor (TipoSensor, fkSilo) values
('DHT11', 1),
('DHT11', 2),
('DHT11', 3),
('DHT11', 4);

create table HistoricoMedicoes (
idHistorico int auto_increment,
dataHora datetime,
temperatura decimal(3,1),
umidade decimal(3,1),
fkSensor int,
foreign key (fkSensor) references Sensor (idSensor),
primary key (idHistorico, fkSensor)
);

insert into HistoricoMedicoes (datahora, temperatura, umidade, fkSensor) values
('2022-10-01 15:35:40',  25, 11.2, 1),
('2022-10-01 15:35:40', 26, 10.9, 2),
('2022-10-01 15:35:40',  27, 10.2, 3),
('2022-10-01 15:35:40', 24, 11.5, 4);

insert into HistoricoMedicoes (datahora, temperatura, umidade, fkSensor) values
('2022-10-01 15:36:40', 25, 10.8, 1),
('2022-10-01 15:36:40', 27, 11.1, 2),
('2022-10-01 15:36:40', 26, 11.4, 3),
('2022-10-01 15:36:40', 25, 11.3, 4);

create table Contato (
idContato int primary key auto_increment,
nome varchar(45),
email varchar(45),
telefone char(10),
assunto varchar(45),
descricao varchar(130)
);

insert into Contato (nome, email, telefone, assunto, descricao) values
('Carlos', 'carlosantos@gamil.com', '1199845622', 'Sobre o Contrato', 'Gostaria de marcar uma reunião para contratar seus serviços.'),
('Alberto', 'alberto@gamil.com', '1199115825', 'Produto', 'Como funciona seus produtos e quais os meios de instalação.');
