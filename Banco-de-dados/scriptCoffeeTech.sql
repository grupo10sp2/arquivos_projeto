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
('SILO100', 25, 30, 10, 12, 1),
('SILO101', 25, 30, 10, 12, 1);

select * from Silo;

select * from Silo join Fazenda on fkFazenda = idFazenda;

create table Sensor (
idSensor int primary key auto_increment,
TipoSensor varchar(10),
fkSilo int,
foreign key (fkSilo) references Silo (idSilo)
);

insert into Sensor (TipoSensor, fkSilo) values
('DHT11', 1),
('DHT11', 2);

select * from Sensor;

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
('2022-10-01 15:35:40', 26, 10.9, 2);

insert into HistoricoMedicoes (datahora, temperatura, umidade, fkSensor) values
('2022-10-01 15:36:40', 25, 10.8, 1),
('2022-10-01 15:36:40', 27, 11.1, 2);

select * from HistoricoMedicoes;

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

select * from Contato;

select * from HistoricoMedicoes join Sensor on fkSensor = idSensor;

select nomeFazenda, nomeUsuario, codigoSilo, temperaturaMin, temperaturaMax,
umidadeMin, UmidadeMax, idSensor, tipoSensor, temperatura, umidade, dataHora 
from Fazenda join Usuario on Usuario.fkFazenda = idFazenda
join Silo on Silo.fkFazenda = idFazenda
join Sensor on Sensor.fkSilo = idSilo
join HistoricoMedicoes on fkSensor = idSensor
where nomeUsuario = 'jose_silva' and nomeFazenda = 'Recanto do Café';
