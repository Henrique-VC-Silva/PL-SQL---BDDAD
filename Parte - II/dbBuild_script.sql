<<<<<<< Updated upstream
-- Drop tables--
drop table Pagamento CASCADE CONSTRAINTS PURGE;
drop table Fatura CASCADE CONSTRAINTS PURGE;
drop table GuiaTransporte CASCADE CONSTRAINTS PURGE;
drop table GuiaSaida CASCADE CONSTRAINTS PURGE;
drop table Carregamento CASCADE CONSTRAINTS PURGE;
drop table OrdemCompraProduto CASCADE CONSTRAINTS PURGE;
drop table OrdemCompra CASCADE CONSTRAINTS PURGE;
drop table ProdutoZonaFisca CASCADE CONSTRAINTS PURGE;
drop table FornecedorProduto CASCADE CONSTRAINTS PURGE;
drop table VeiculoMotorista CASCADE CONSTRAINTS PURGE;
drop table NotaEncomenda CASCADE CONSTRAINTS PURGE;
drop table Visita CASCADE CONSTRAINTS PURGE;
drop table Motorista CASCADE CONSTRAINTS PURGE;
drop table FielArmazem CASCADE CONSTRAINTS PURGE;
drop table Vendedor CASCADE CONSTRAINTS PURGE;
drop table Funcionario CASCADE CONSTRAINTS PURGE;
drop table ZonaFisica CASCADE CONSTRAINTS PURGE;
drop table Armazem CASCADE CONSTRAINTS PURGE;
drop table Capacidade CASCADE CONSTRAINTS PURGE;
drop table Tipo4Eixos CASCADE CONSTRAINTS PURGE;
drop table Tipo3Eixos CASCADE CONSTRAINTS PURGE;
drop table Tipo2Eixos CASCADE CONSTRAINTS PURGE;
drop table Veiculo CASCADE CONSTRAINTS PURGE;
drop table Cliente CASCADE CONSTRAINTS PURGE;
drop table PrecoVenda CASCADE CONSTRAINTS PURGE;
drop table Produto CASCADE CONSTRAINTS PURGE;
drop table Fornecedor CASCADE CONSTRAINTS PURGE;
drop table ZonaGeografica CASCADE CONSTRAINTS PURGE;
drop table CoordenadasWGS84 CASCADE CONSTRAINTS PURGE;

-- Create tables--
create table ZonaGeografica(
  cod_zona_geografica number GENERATED BY DEFAULT AS IDENTITY,
  descricao VARCHAR2 (255) constraint nn_zona_geografica not null,
  constraint pk_zona_geografica PRIMARY KEY (cod_zona_geografica)
);

create table CoordenadasWGS84 (
  cod_localizacao number GENERATED BY DEFAULT AS IDENTITY,
  latitude number(10,8),
  longitude number(10,8),
  cod_zona_geografica number references ZonaGeografica(cod_zona_geografica)
);

create table Fornecedor (
  cod_fornecedor number GENERATED BY DEFAULT AS IDENTITY,
  nome VARCHAR2(255) constraint nn_fornecedor_nome not null,
  morada VARCHAR2(255) constraint nn_fornecedor_morada not null,
  nif CHAR(9) UNIQUE constraint nn_fornecedor_nif not null,
  telefone CHAR(9) UNIQUE constraint nn_fornecedor_telefone not null,
  constraint pk_cod_fornecedor PRIMARY KEY (cod_fornecedor)
);

create table Produto(
  cod_produto number GENERATED BY DEFAULT AS IDENTITY,
  descricao VARCHAR2(255) constraint nn_produto_descricao not null,
  unidade_medida VARCHAR2(5) constraint nn_produto_unidade_medida not null,
  volume number(*,2),
  peso number(*,2),
  preco number(*,2) constraint ck_produto_preco check (preco > 0),
  constraint pk_cod_produto PRIMARY KEY (cod_produto)
);

create table PrecoVenda (
  cod_precovenda number GENERATED BY DEFAULT AS IDENTITY,
  cod_produto number references Produto(cod_produto),
  data_inicio timestamp,
  data_fim timestamp,
  preco number(*,2),
  constraint pk_cod_precovenda PRIMARY KEY (cod_precovenda)
);

create table TipoCliente(
  cod_tipo number GENERATED BY DEFAULT AS IDENTITY,
  descricao VARCHAR2(50),
  volume_negocios number(*,2),
  constraint pk_cod_tipo PRIMARY KEY (cod_tipo)
);

create table Cliente(
  cod_cliente number GENERATED BY DEFAULT AS IDENTITY,
  nome VARCHAR2(255),
  morada VARCHAR2(255),
  codigoPostal CHAR(8),
  telemovel CHAR(9) UNIQUE,
  nif CHAR(9) UNIQUE constraint nn_fornecedor_nif not null,
  cod_zona_geografica number references ZonaGeografica(cod_zona_geografica),
  cod_tipo number references TipoCliente(cod_tipo),
  constraint pk_cod_cliente PRIMARY KEY (cod_cliente)
);

create table FornecedorProduto (
  cod_fornecedor number references Fornecedor (cod_fornecedor),
  cod_produto number references Produto (cod_produto),
  preco_venda number(*,2) constraint ck_preco_venda check (preco_venda > 0),
  desconto number(*,2),
  constraint pk_fornecedor_produto PRIMARY KEY (cod_fornecedor, cod_produto)
);

create table Armazem (
  cod_armazem number GENERATED BY DEFAULT AS IDENTITY,
  nome VARCHAR2 (255) constraint nn_armazem_nome not null,
  morada VARCHAR2 (255) constraint nn_armazem_morada not null,
  cod_localizacao number references CoordenadasWGS84(cod_localizacao),
  constraint pk_cod_armazem PRIMARY KEY (cod_armazem)
);

create table ZonaFisica (
  cod_zona_fisica number GENERATED BY DEFAULT AS IDENTITY,
  cod_armazem number references Armazem(cod_armazem),
  volume number(*,2),
  constraint pk_cod_zona_fisica PRIMARY KEY (cod_zona_fisica)
);

create table TipoVeiculo (
  cod_tipo_veiculo number GENERATED BY DEFAULT AS IDENTITY,
  descricao VARCHAR2(255),
  constraint pk_tipo_veiculo PRIMARY KEY (cod_tipo_veiculo)
);

create table Capacidade (
  cod_capacidade number GENERATED BY DEFAULT AS IDENTITY,
  volume_minimo number (*,2) not null,
  volume_maximo number (*,2) not null,
  peso_maximo number (*,2) not null,
  constraint pk_capacidade PRIMARY KEY (cod_capacidade)
);

create table Veiculo (
  cod_veiculo number GENERATED BY DEFAULT AS IDENTITY,
  matricula CHAR(8) UNIQUE,
  marca VARCHAR2(255),
  modelo VARCHAR2(255),
  apolice_seguro number GENERATED BY DEFAULT AS IDENTITY,
  kilometragem number(10,2),
  estado_servico INTEGER default 1,
  cod_tipo_veiculo number references TipoVeiculo(cod_tipo_veiculo),
  cod_capacidade number references Capacidade(cod_capacidade),
  constraint pk_veiculo PRIMARY KEY (cod_veiculo)
);

create table Funcionario (
 nr_funcionario number GENERATED BY DEFAULT AS IDENTITY,
 cod_supervisor number references Funcionario(nr_funcionario) null,
 cod_armazem  number references Armazem(cod_armazem),
 cartao_cidadao char(8) UNIQUE,
 nome VARCHAR2(255) constraint nn_funcionario_nome not null,
 morada VARCHAR2(255) constraint nn_funcionario_morada not null,
 salario_mensal number(*,2) constraint ck_salario_mensal check (salario_mensal > 0),
 formacao VARCHAR2(255),
 nif CHAR(9) UNIQUE constraint nn_fornecedor_nif not null,
 cod_zona_geografica number references ZonaGeografica(cod_zona_geografica),
 constraint pk_cod_empregado PRIMARY KEY (nr_funcionario)
);

create table Vendedor(
  nr_vendedor number GENERATED BY DEFAULT AS IDENTITY,
  nr_funcionario number references Funcionario(nr_funcionario),
  constraint pk_cod_vendedor PRIMARY KEY (nr_vendedor)
);

create table FielArmazem(
  nr_fiel_armazem number GENERATED BY DEFAULT AS IDENTITY,
  nr_funcionario number references Funcionario(nr_funcionario),
  constraint pk_cod_fielArmazem PRIMARY KEY (nr_fiel_armazem)
);

create table Motorista(
  nr_motorista number GENERATED BY DEFAULT AS IDENTITY,
  nr_funcionario number references Funcionario(nr_funcionario),
  constraint pk_cod_motorista PRIMARY KEY (nr_motorista)
);

create table Visita (
  cod_cliente number references Cliente(cod_cliente),
  cod_vendedor number references Vendedor(cod_vendedor),
  data timestamp,
  constraint pk_visita PRIMARY KEY (cod_cliente, cod_vendedor)
);

create table NotaEncomenda (
  nr_encomenda number GENERATED BY DEFAULT AS IDENTITY,
  data timestamp,
  estado INTEGER default 1,
  cod_cliente number references Visita(cod_cliente),
  cod_vendedor number references Visita(cod_vendedor),
  constraint pk_nota_encomenda PRIMARY KEY(nr_encomenda)
);

create table VeiculoMotorista (
  cod_veiculo number references Veiculo(cod_veiculo),
  nr_motorista number references Motorista(nr_motorista),
  constraint pk_veiculo_motorista PRIMARY KEY (cod_veiculo, nr_motorista)
);

create table ProdutoZonaFisca (
  cod_zona_fisica number references ZonaFisica(cod_zona_fisica),
  cod_produto number references Produto(cod_produto),
  stock INTEGER constraint nn_stock not null,
  stock_minimo INTEGER constraint nn_stock_minimo not null,
  corredor INTEGER constraint nn_armazemProduto_corredor not null,
  prateleira INTEGER constraint nn_armazemProduto_prateleira not null,
  constraint ck_stock check (stock >= stock_minimo),
  constraint pk_produto_zonaFisica PRIMARY KEY(cod_zona_fisica, cod_produto)
);

create table OrdemCompra (
 nr_ordem number GENERATED BY DEFAULT AS IDENTITY,
 cod_fornecedor number references Fornecedor(cod_fornecedor),
 nr_funcionario number references Funcionario(nr_funcionario),
 data_compra DATE default sysdate,
 valor_total number(*,2) constraint nn_valor_total not null,
 data_entrega DATE,
 estado INTEGER default 1,
 constraint pk_nr_ordem PRIMARY KEY(nr_ordem)
 );

create table OrdemCompraProduto (
 nr_ordem number references OrdemCompra(nr_ordem),
 linha number GENERATED BY DEFAULT AS IDENTITY,
 cod_produto number references Produto(cod_produto),
 quantidade_solicitada INTEGER,
 desconto_pedido number(*,2) constraint ck_desconto_pedido check (desconto_pedido >= 0),
 constraint ck_quantidade_solicitada check (quantidade_solicitada > 0),
 constraint pk_ordem_compra_produto PRIMARY KEY(nr_ordem, linha)
);

create table Viagem(
  nr_viagem number GENERATED BY DEFAULT AS IDENTITY,
  data timestamp,
  nr_motorista number references VeiculoMotorista(nr_motorista),
  cod_veiculo number references VeiculoMotorista(cod_veiculo),
  constraint pk_viagem PRIMARY KEY(nr_viagem)
);

create table GuiaSaida (
  cod_guia_saida number GENERATED BY DEFAULT AS IDENTITY,
  nr_nota_encomenda number references NotaEncomenda(nr_nota_encomenda),
  nr_fiel_armazem number references FielArmazem(nr_fiel_armazem),
  constraint pk_guia_saida PRIMARY KEY (cod_guia_saida)
);

create table NotaEncomendaProduto(
  linha number GENERATED BY DEFAULT AS IDENTITY,
  nr_nota_encomenda number references NotaEncomenda(nr_nota_encomenda),
  cod_produto number references Produto(cod_produto),
  qt_solicitada integer,
  constraint pk_nota_encomenda_produto PRIMARY KEY (linha)
);

create table GuiaSaidaProduto(
  linha number GENERATED BY DEFAULT AS IDENTITY,
  cod_guia_saida number references GuiaSaida(cod_guia_saida),
  constraint pk_nr_guia_transporte PRIMARY KEY(nr_guia_saida_produto, linha)
);

create table GuiaTransporte (
  nr_guia_transporte number GENERATED BY DEFAULT AS IDENTITY,
  cod_cliente number references Cliente(cod_cliente),
  data timestamp,
  constraint pk_nr_guia_transporte PRIMARY KEY(nr_guia_transporte)
);

create table GuiaTransporteProduto(
  linha number GENERATED BY DEFAULT AS IDENTITY,
  nr_guia_transporte number references GuiaTransporte(nr_guia_transporte),
  cod_produto number references Produto(cod_produto),
  constraint pk_guia_transporte_produto PRIMARY KEY (linha, nr_guia_transporte)
);

create table Etapa(
  nr_etapa number GENERATED BY DEFAULT AS IDENTITY,
  nr_viagem number references Viagem(nr_viagem),
  cod_localizacao number references CoordenadasWGS84(cod_localizacao),
  nr_guia_transporte number references GuiaTransporte(nr_guia_transporte),
  constraint pk_nr_etapa PRIMARY KEY(nr_etapa)
);

create table Relatorio(
  nr_relatorio number GENERATED BY DEFAULT AS IDENTITY,
  nr_viagem number references Viagem(nr_viagem),
  constraint pk_nr_relatorio PRIMARY KEY(nr_relatorio)
);

create table Incidente(
  cod_incidente number GENERATED BY DEFAULT AS IDENTITY,
  descricao VARCHAR2(255),
  constraint pk_incidente PRIMARY KEY(cod_incidente)
);

create table Fatura (
  nr_fatura number GENERATED BY DEFAULT AS IDENTITY,
  cod_cliente number references Cliente(cod_cliente),
  cod_vendedor number references Vendedor(cod_vendedor),
  data_emissao timestamp,
  preco_base number(*,2),
  valor_iva number(2,2),
  valor_desconto number(*,2),
  constraint pk_fatura PRIMARY KEY(nr_fatura)
);

create table FaturaProduto (
  linha number GENERATED BY DEFAULT AS IDENTITY,
  nr_fatura number references Fatura(nr_fatura),
  cod_produto number references Produto(cod_produto),
  quantidade integer,
  constraint pk_fatura_produto PRIMARY KEY(linha)
);

create table Pagamento (
  cod_pagamento number GENERATED BY DEFAULT AS IDENTITY,
  nr_fatura number references Fatura(nr_fatura),
  data timestamp,
  valor number(*,2)
  constraint pk_pagamento PRIMARY KEY(cod_pagamento)
);
=======
-- Drop tables--
drop table Pagamento CASCADE CONSTRAINTS PURGE;
drop table Fatura CASCADE CONSTRAINTS PURGE;
drop table GuiaTransporte CASCADE CONSTRAINTS PURGE;
drop table GuiaSaida CASCADE CONSTRAINTS PURGE;
drop table Carregamento CASCADE CONSTRAINTS PURGE;
drop table OrdemCompraProduto CASCADE CONSTRAINTS PURGE;
drop table OrdemCompra CASCADE CONSTRAINTS PURGE;
drop table ProdutoZonaFisca CASCADE CONSTRAINTS PURGE;
drop table FornecedorProduto CASCADE CONSTRAINTS PURGE;
drop table VeiculoMotorista CASCADE CONSTRAINTS PURGE;
drop table NotaEncomenda CASCADE CONSTRAINTS PURGE;
drop table Visita CASCADE CONSTRAINTS PURGE;
drop table Motorista CASCADE CONSTRAINTS PURGE;
drop table FielArmazem CASCADE CONSTRAINTS PURGE;
drop table Vendedor CASCADE CONSTRAINTS PURGE;
drop table Funcionario CASCADE CONSTRAINTS PURGE;
drop table ZonaFisica CASCADE CONSTRAINTS PURGE;
drop table Armazem CASCADE CONSTRAINTS PURGE;
drop table Capacidade CASCADE CONSTRAINTS PURGE;
drop table Tipo4Eixos CASCADE CONSTRAINTS PURGE;
drop table Tipo3Eixos CASCADE CONSTRAINTS PURGE;
drop table Tipo2Eixos CASCADE CONSTRAINTS PURGE;
drop table Veiculo CASCADE CONSTRAINTS PURGE;
drop table Cliente CASCADE CONSTRAINTS PURGE;
drop table PrecoVenda CASCADE CONSTRAINTS PURGE;
drop table Produto CASCADE CONSTRAINTS PURGE;
drop table Fornecedor CASCADE CONSTRAINTS PURGE;
drop table ZonaGeografica CASCADE CONSTRAINTS PURGE;
drop table CoordenadasWGS84 CASCADE CONSTRAINTS PURGE;

-- Create tables--
create table ZonaGeografica(
  cod_zona_geografica number GENERATED BY DEFAULT AS IDENTITY,
  descricao VARCHAR2 (255) constraint nn_zona_geografica not null,
  constraint pk_zona_geografica PRIMARY KEY (cod_zona_geografica)
);

create table CoordenadasWGS84 (
  cod_localizacao number GENERATED BY DEFAULT AS IDENTITY,
  latitude number(10,8),
  longitude number(10,8),
  cod_zona_geografica number references ZonaGeografica(cod_zona_geografica)
);

create table Fornecedor (
  cod_fornecedor number GENERATED BY DEFAULT AS IDENTITY,
  nome VARCHAR2(255) constraint nn_fornecedor_nome not null,
  morada VARCHAR2(255) constraint nn_fornecedor_morada not null,
  nif CHAR(9) UNIQUE constraint nn_fornecedor_nif not null,
  telefone CHAR(9) UNIQUE constraint nn_fornecedor_telefone not null,
  constraint pk_cod_fornecedor PRIMARY KEY (cod_fornecedor)
);

create table Produto(
  cod_produto number GENERATED BY DEFAULT AS IDENTITY,
  descricao VARCHAR2(255) constraint nn_produto_descricao not null,
  unidade_medida VARCHAR2(5) constraint nn_produto_unidade_medida not null,
  volume number(*,2),
  peso number(*,2),
  preco number(*,2) constraint ck_produto_preco check (preco > 0),
  constraint pk_cod_produto PRIMARY KEY (cod_produto)
);

create table PrecoVenda (
  cod_precovenda number GENERATED BY DEFAULT AS IDENTITY,
  cod_produto number references Produto(cod_produto),
  data_inicio timestamp,
  data_fim timestamp,
  preco number(*,2),
  constraint pk_cod_precovenda PRIMARY KEY (cod_precovenda)
);

create table TipoCliente(
  cod_tipo number GENERATED BY DEFAULT AS IDENTITY,
  descricao VARCHAR2(50),
  volume_negocios number(*,2),
  constraint pk_cod_tipo PRIMARY KEY (cod_tipo)
);

create table Cliente(
  cod_cliente number GENERATED BY DEFAULT AS IDENTITY,
  nome VARCHAR2(255),
  morada VARCHAR2(255),
  codigoPostal CHAR(8),
  telemovel CHAR(9) UNIQUE,
  nif CHAR(9) UNIQUE constraint nn_fornecedor_nif not null,
  cod_zona_geografica number references ZonaGeografica(cod_zona_geografica),
  cod_tipo number references TipoCliente(cod_tipo),
  constraint pk_cod_cliente PRIMARY KEY (cod_cliente)
);

create table FornecedorProduto (
  cod_fornecedor number references Fornecedor (cod_fornecedor),
  cod_produto number references Produto (cod_produto),
  preco_venda number(*,2) constraint ck_preco_venda check (preco_venda > 0),
  desconto number(*,2),
  constraint pk_fornecedor_produto PRIMARY KEY (cod_fornecedor, cod_produto)
);

create table Armazem (
  cod_armazem number GENERATED BY DEFAULT AS IDENTITY,
  nome VARCHAR2 (255) constraint nn_armazem_nome not null,
  morada VARCHAR2 (255) constraint nn_armazem_morada not null,
  cod_localizacao number references CoordenadasWGS84(cod_localizacao),
  constraint pk_cod_armazem PRIMARY KEY (cod_armazem)
);

create table ZonaFisica (
  cod_zona_fisica number GENERATED BY DEFAULT AS IDENTITY,
  cod_armazem number references Armazem(cod_armazem),
  volume number(*,2),
  constraint pk_cod_zona_fisica PRIMARY KEY (cod_zona_fisica)
);

create table TipoVeiculo (
  cod_tipo_veiculo number GENERATED BY DEFAULT AS IDENTITY,
  descricao VARCHAR2(255),
  constraint pk_tipo_veiculo PRIMARY KEY (cod_tipo_veiculo)
);

create table Capacidade (
  cod_capacidade number GENERATED BY DEFAULT AS IDENTITY,
  volume_minimo number (*,2) not null,
  volume_maximo number (*,2) not null,
  peso_maximo number (*,2) not null,
  constraint pk_capacidade PRIMARY KEY (cod_capacidade)
);

create table Veiculo (
  cod_veiculo number GENERATED BY DEFAULT AS IDENTITY,
  matricula CHAR(8) UNIQUE,
  marca VARCHAR2(255),
  modelo VARCHAR2(255),
  apolice_seguro number GENERATED BY DEFAULT AS IDENTITY,
  kilometragem number(10,2),
  estado_servico INTEGER default 1,
  cod_tipo_veiculo number references TipoVeiculo(cod_tipo_veiculo),
  cod_capacidade number references Capacidade(cod_capacidade),
  constraint pk_veiculo PRIMARY KEY (cod_veiculo)
);

create table Funcionario (
 nr_funcionario number GENERATED BY DEFAULT AS IDENTITY,
 cod_supervisor number references Funcionario(nr_funcionario) null,
 cod_armazem  number references Armazem(cod_armazem),
 cartao_cidadao char(8) UNIQUE,
 nome VARCHAR2(255) constraint nn_funcionario_nome not null,
 morada VARCHAR2(255) constraint nn_funcionario_morada not null,
 salario_mensal number(*,2) constraint ck_salario_mensal check (salario_mensal > 0),
 formacao VARCHAR2(255),
 nif CHAR(9) UNIQUE constraint nn_fornecedor_nif not null,
 cod_zona_geografica number references ZonaGeografica(cod_zona_geografica),
 constraint pk_cod_empregado PRIMARY KEY (nr_funcionario)
);

create table Vendedor(
  nr_vendedor number GENERATED BY DEFAULT AS IDENTITY,
  nr_funcionario number references Funcionario(nr_funcionario),
  constraint pk_cod_vendedor PRIMARY KEY (nr_vendedor)
);

create table FielArmazem(
  nr_fiel_armazem number GENERATED BY DEFAULT AS IDENTITY,
  nr_funcionario number references Funcionario(nr_funcionario),
  constraint pk_cod_fielArmazem PRIMARY KEY (nr_fiel_armazem)
);

create table Motorista(
  nr_motorista number GENERATED BY DEFAULT AS IDENTITY,
  nr_funcionario number references Funcionario(nr_funcionario),
  constraint pk_cod_motorista PRIMARY KEY (nr_motorista)
);

create table Visita (
  cod_cliente number references Cliente(cod_cliente),
  cod_vendedor number references Vendedor(cod_vendedor),
  data timestamp,
  constraint pk_visita PRIMARY KEY (cod_cliente, cod_vendedor)
);

create table NotaEncomenda (
  nr_encomenda number GENERATED BY DEFAULT AS IDENTITY,
  data timestamp,
  estado INTEGER default 1,
  cod_cliente number references Visita(cod_cliente),
  cod_vendedor number references Visita(cod_vendedor),
  constraint pk_nota_encomenda PRIMARY KEY(nr_encomenda)
);

create table VeiculoMotorista (
  cod_veiculo number references Veiculo(cod_veiculo),
  nr_motorista number references Motorista(nr_motorista),
  constraint pk_veiculo_motorista PRIMARY KEY (cod_veiculo, nr_motorista)
);

create table ProdutoZonaFisca (
  cod_zona_fisica number references ZonaFisica(cod_zona_fisica),
  cod_produto number references Produto(cod_produto),
  stock INTEGER constraint nn_stock not null,
  stock_minimo INTEGER constraint nn_stock_minimo not null,
  corredor INTEGER constraint nn_armazemProduto_corredor not null,
  prateleira INTEGER constraint nn_armazemProduto_prateleira not null,
  constraint ck_stock check (stock >= stock_minimo),
  constraint pk_produto_zonaFisica PRIMARY KEY(cod_zona_fisica, cod_produto)
);

create table OrdemCompra (
 nr_ordem number GENERATED BY DEFAULT AS IDENTITY,
 cod_fornecedor number references Fornecedor(cod_fornecedor),
 nr_funcionario number references Funcionario(nr_funcionario),
 data_compra DATE default sysdate,
 valor_total number(*,2) constraint nn_valor_total not null,
 data_entrega DATE,
 estado INTEGER default 1,
 constraint pk_nr_ordem PRIMARY KEY(nr_ordem)
 );

create table OrdemCompraProduto (
 nr_ordem number references OrdemCompra(nr_ordem),
 linha number GENERATED BY DEFAULT AS IDENTITY,
 cod_produto number references Produto(cod_produto),
 quantidade_solicitada INTEGER,
 desconto_pedido number(*,2) constraint ck_desconto_pedido check (desconto_pedido >= 0),
 constraint ck_quantidade_solicitada check (quantidade_solicitada > 0),
 constraint pk_ordem_compra_produto PRIMARY KEY(nr_ordem, linha)
);

create table Viagem(
  nr_viagem number GENERATED BY DEFAULT AS IDENTITY,
  data timestamp,
  nr_motorista number references VeiculoMotorista(nr_motorista),
  cod_veiculo number references VeiculoMotorista(cod_veiculo),
  constraint pk_viagem PRIMARY KEY(nr_viagem)
);

create table GuiaSaida (
  cod_guia_saida number GENERATED BY DEFAULT AS IDENTITY,
  nr_nota_encomenda number references NotaEncomenda(nr_nota_encomenda),
  nr_fiel_armazem number references FielArmazem(nr_fiel_armazem),
  constraint pk_guia_saida PRIMARY KEY (cod_guia_saida)
);

create table NotaEncomendaProduto(
  linha number GENERATED BY DEFAULT AS IDENTITY,
  nr_nota_encomenda number references NotaEncomenda(nr_nota_encomenda),
  cod_produto number references Produto(cod_produto),
  qt_solicitada integer,
  constraint pk_nota_encomenda_produto PRIMARY KEY (linha)
);

create table GuiaSaidaProduto(
  linha number GENERATED BY DEFAULT AS IDENTITY,
  cod_guia_saida number references GuiaSaida(cod_guia_saida),
  constraint pk_nr_guia_transporte PRIMARY KEY(nr_guia_saida_produto, linha)
);

create table GuiaTransporte (
  nr_guia_transporte number GENERATED BY DEFAULT AS IDENTITY,
  cod_cliente number references Cliente(cod_cliente),
  data timestamp,
  constraint pk_nr_guia_transporte PRIMARY KEY(nr_guia_transporte)
);

create table GuiaTransporteProduto(
  linha number GENERATED BY DEFAULT AS IDENTITY,
  nr_guia_transporte number references GuiaTransporte(nr_guia_transporte),
  cod_produto number references Produto(cod_produto),
  constraint pk_guia_transporte_produto PRIMARY KEY (linha, nr_guia_transporte)
);

create table Etapa(
  nr_etapa number GENERATED BY DEFAULT AS IDENTITY,
  nr_viagem number references Viagem(nr_viagem),
  cod_localizacao number references CoordenadasWGS84(cod_localizacao),
  nr_guia_transporte number references GuiaTransporte(nr_guia_transporte),
  constraint pk_nr_etapa PRIMARY KEY(nr_etapa)
);

create table Relatorio(
  nr_relatorio number GENERATED BY DEFAULT AS IDENTITY,
  nr_viagem number references Viagem(nr_viagem),
  constraint pk_nr_relatorio PRIMARY KEY(nr_relatorio)
);

create table Incidente(
  cod_incidente number GENERATED BY DEFAULT AS IDENTITY,
  descricao VARCHAR2(255),
  constraint pk_incidente PRIMARY KEY(cod_incidente)
);

create table Fatura (
  nr_fatura number GENERATED BY DEFAULT AS IDENTITY,
  cod_cliente number references Cliente(cod_cliente),
  cod_vendedor number references Vendedor(cod_vendedor),
  data_emissao timestamp,
  preco_base number(*,2),
  valor_iva number(2,2),
  valor_desconto number(*,2),
  constraint pk_fatura PRIMARY KEY(nr_fatura)
);

create table FaturaProduto (
  linha number GENERATED BY DEFAULT AS IDENTITY,
  nr_fatura number references Fatura(nr_fatura),
  cod_produto number references Produto(cod_produto),
  quantidade integer,
  constraint pk_fatura_produto PRIMARY KEY(linha)
);

create table Pagamento (
  cod_pagamento number GENERATED BY DEFAULT AS IDENTITY,
  nr_fatura number references Fatura(nr_fatura),
  data timestamp,
  valor number(*,2)
  constraint pk_pagamento PRIMARY KEY(cod_pagamento)
);
>>>>>>> Stashed changes
