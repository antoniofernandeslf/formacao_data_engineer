SET DATESTYLE TO PostgreSQL,European;

CREATE SCHEMA Relacional;

CREATE SEQUENCE Relacional.IDDespachante;
CREATE TABLE Relacional.Despachantes(
  IDDespachante int default nextval('Relacional.IDDespachante'::regclass) PRIMARY KEY,
  Nome Varchar(50) not null,
  Status Varchar(7) not null,
  Filial Varchar(50) not null
);

CREATE SEQUENCE Relacional.IDVeiculo;
CREATE TABLE Relacional.Veiculos(
  IDVeiculo int default nextval('Relacional.IDVeiculo'::regclass) PRIMARY KEY,
  DataAquisicao Date not null,
  Ano int not null,
  Modelo Varchar(150) not null,
  Placa Varchar(150) not null,
  Status Varchar(12) not null,
  PrecoDiaria Numeric(10,2) not null
);

CREATE SEQUENCE Relacional.IDCliente;
CREATE TABLE Relacional.Clientes(
	IDCliente int default nextval('Relacional.IDCliente'::regclass) PRIMARY KEY,
	CPF Varchar(11) not null,
	CNH Varchar(11) not null,
	DataValidadeCNH Date not null,
	Nome Varchar(150) not null,
	DataCadastro Date not null,
	DataNascimento Date not null,
	Telefone Varchar(11),
  	Status Varchar(7) not null
);

CREATE SEQUENCE Relacional.IDLocacao;
CREATE TABLE Relacional.Locacao(
  	IDLocacao int default nextval('Relacional.IDLocacao'::regclass) PRIMARY KEY,
  	IDDespachante int not null references Relacional.Despachantes (IDDespachante),
  	IDCliente int not null references Relacional.Clientes (IDCliente),
	IDVeiculo int not null references Relacional.Veiculos (IDVeiculo),
  	DataLocacao Date not null,
	DataEntrega Date,
  	Total Numeric(10,2)
);

