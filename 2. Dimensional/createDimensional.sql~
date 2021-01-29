CREATE SCHEMA Dimensional;

CREATE SEQUENCE Dimensional.ChaveDespachante;
CREATE TABLE Dimensional.DimensaoDespachante(
  	ChaveDespachante int default nextval('Dimensional.ChaveDespachante'::regclass) PRIMARY KEY,
  	IDDespachante int,
  	Nome Varchar(50),
	Status Varchar(7),
	Filial Varchar(50),
  	DataInicioValidade date not null,
  	DataFimValidade date
);

CREATE SEQUENCE Dimensional.ChaveCliente;
CREATE TABLE Dimensional.DimensaoCliente(
	ChaveCliente int default nextval('Dimensional.ChaveCliente'::regclass) PRIMARY KEY,
  	IDCliente int,
	CPF Varchar(11),
	CNH Varchar(11),
	DataValidadeCNH Date,	
	Nome Varchar(150),
	DataCadastro Date,
	DataNascimento Date,
	Telefone Varchar(11),
  	Status Varchar(7),
  	DataInicioValidade date not null,
  	DataFimValidade date
);

CREATE SEQUENCE Dimensional.ChaveVeiculo;
CREATE TABLE Dimensional.DimensaoVeiculo(
  	ChaveVeiculo int default nextval('Dimensional.ChaveVeiculo'::regclass) PRIMARY KEY,
  	IDVeiculo int,
	DataAquisicao date,
	Ano int,
	Modelo Varchar(150),
	Placa Varchar(150),
	Status Varchar(12),
	PrecoDiaria Numeric(10,2),	
	DataInicioValidade date not null,
	DataFimValidade date
);

CREATE SEQUENCE Dimensional.ChaveTempo;
CREATE TABLE Dimensional.DimensaoTempo(
	ChaveTempo int default nextval('Dimensional.ChaveTempo'::regclass) PRIMARY KEY,
	Data Date,
  	Dia int,
  	Mes int,
  	Ano int,
  	DiaSemana int,
  	Trimestre int
);

CREATE SEQUENCE Dimensional.ChaveLocacao;
CREATE TABLE Dimensional.FatoLocacao(
  	ChaveLocacao int default nextval('Dimensional.ChaveLocacao'::regclass) PRIMARY KEY,
  	ChaveDespachante int references Dimensional.DimensaoDespachante (ChaveDespachante),
  	ChaveCliente int references Dimensional.DimensaoCliente (ChaveCliente),
  	ChaveVeiculo int references Dimensional.DimensaoVeiculo (Chaveveiculo),
  	ChaveTempo int references Dimensional.DimensaoTempo (ChaveTempo),
  	DataLocacao Date,
	DataEntrega Date,
	Total Numeric(10,2)
  
);

