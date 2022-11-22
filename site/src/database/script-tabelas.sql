-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

create database coffeeTech;

use coffeeTech;

create table fazenda (
idFazenda int primary key auto_increment,
nomeFazenda varchar(45),
cnpj char(14),
logradouro varchar(70),
numero varchar(10),
complemento varchar(50),
cep char(8)
);


create table usuario (
idUsuario int primary key auto_increment,
nome varchar(60),
cpf char(11),
email varchar(50),
senha varchar(20),
fkAdmin int,
foreign key (fkAdmin) references usuario(idUsuario)
);

create table fazendaTemUsuario (
fkFazenda int,
foreign key (fkFazenda) references Fazenda (idFazenda),
fkUsuario int,
foreign key (fkUsuario) references Usuario (idUsuario),
primary key (fkFazenda, fkUsuario)
);


create table silo (
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



create table sensor (
idSensor int primary key auto_increment,
TipoSensor varchar(10),
fkSilo int,
foreign key (fkSilo) references Silo (idSilo)
);


create table historicoMedicoes (
idHistorico int auto_increment,
dataHora datetime,
temperatura decimal(3,1),
umidade decimal(3,1),
fkSensor int,
foreign key (fkSensor) references Sensor (idSensor),
primary key (idHistorico, fkSensor)
);


create table contato (
idContato int primary key auto_increment,
nome varchar(45),
email varchar(45),
telefone char(10),
assunto varchar(45),
descricao varchar(130)
);

