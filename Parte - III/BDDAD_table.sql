CREATE TABLE Armazem (
  cod_armazem number(19) GENERATED AS IDENTITY, 
  cod_zona    number(19) NOT NULL, 
  nome        varchar2(255) NOT NULL, 
  morada      varchar2(255) NOT NULL, 
  latitude    number(10, 8) NOT NULL, 
  longitude   number(10, 8) NOT NULL);
CREATE TABLE ZonaFisica (
  cod_zona_fisica number(19) GENERATED AS IDENTITY, 
  cod_armazem     number(19) NOT NULL, 
  volume_maximo   number(10, 2) NOT NULL);
CREATE TABLE Produto (
  cod_produto number(19) GENERATED AS IDENTITY, 
  cod_unidade number(19) NOT NULL, 
  nome        varchar2(255) NOT NULL, 
  descrição   varchar2(255) NOT NULL, 
  peso        number(10, 2), 
  volume      number(10, 2));
CREATE TABLE precoProduto (
  dataInicio   timestamp(7) NOT NULL, 
  cod_produto  number(19) NOT NULL, 
  precoVenda   number(10, 2) NOT NULL, 
  preço_compra number(10, 2) NOT NULL);
CREATE TABLE NotaEncomenda (
  cod_nota_encomenda  number(19) GENERATED AS IDENTITY, 
  nr_fatura           number(19), 
  cod_cliente         number(19), 
  cod_vendedor        number(19) NOT NULL, 
  cod_fiel_armazem    number(19), 
  cod_guia_transporte number(19), 
  data                timestamp(0) NOT NULL, 
  estado              number(1) NOT NULL);
CREATE TABLE ZonaGeografica (
  cod_zona  number(19) GENERATED AS IDENTITY, 
  descrição varchar2(255) NOT NULL);
CREATE TABLE Funcionario (
  cod_funcionario number(19) GENERATED AS IDENTITY, 
  cod_supervisor  number(19), 
  cod_armazem     number(19) NOT NULL, 
  nome            varchar2(255) NOT NULL, 
  cartaoCidadao   char(8) NOT NULL UNIQUE, 
  NIF             char(9) NOT NULL UNIQUE, 
  morada          varchar2(255) NOT NULL, 
  data_nascimento timestamp(0) NOT NULL, 
  salario         float(10) NOT NULL, 
  categoria       varchar2(255) NOT NULL);
CREATE TABLE Motorista (
  cod_funcionario number(19) NOT NULL);
CREATE TABLE FielArmazem (
  cod_funcionario number(19) NOT NULL);
CREATE TABLE Cliente (
  cod_cliente        number(19) GENERATED AS IDENTITY, 
  nome               varchar2(255) NOT NULL, 
  morada             varchar2(255) NOT NULL, 
  codigoPostal       number(10) NOT NULL, 
  telemovel          number(10) NOT NULL, 
  NIF                char(9) NOT NULL UNIQUE, 
  cod_zonaGeografica number(19) NOT NULL, 
  cod_tipo           number(19) NOT NULL, 
  data_atualizacao   timestamp(0));
CREATE TABLE TipoCliente (
  cod_tipo      number(19) GENERATED AS IDENTITY, 
  descricao     varchar2(255) NOT NULL, 
  volume_minimo number(10, 2), 
  volume_maximo number(10, 2));
CREATE TABLE GuiaSaidaProduto (
  linha               number(19) GENERATED AS IDENTITY, 
  cod_nota_encomenda  number(19) NOT NULL, 
  cod_produto         number(19) NOT NULL, 
  cod_zona_fisica     number(19), 
  cod_armazem         number(19), 
  cod_guia_transporte number(19), 
  quantidade          number(10) NOT NULL);
CREATE TABLE TipoVeiculo (
  cod_tipo_veiculo number(19) GENERATED AS IDENTITY, 
  numero_eixos     number(10) NOT NULL);
CREATE TABLE Viagem (
  cod_viagem     number(19) GENERATED AS IDENTITY, 
  cod_motorista  number(19) NOT NULL, 
  matricula      char(8) NOT NULL, 
  data           timestamp(0) NOT NULL, 
  peso_ocupado   number(10, 2) NOT NULL, 
  volume_ocupado number(10, 2) NOT NULL);
CREATE TABLE Etapa (
  nr_etapa            number(19) GENERATED AS IDENTITY, 
  cod_cliente_inicial number(19), 
  cod_cliente_final   number(19), 
  cod_viagem          number(19) NOT NULL);
CREATE TABLE Relatorio (
  cod_relatorio number(19) GENERATED AS IDENTITY, 
  cod_viagem    number(19));
CREATE TABLE Incidente (
  cod_incidente      number(19) GENERATED AS IDENTITY, 
  cod_tipo_incidente number(19) NOT NULL, 
  nr_etapa           number(19), 
  nr_viagem          number(19) NOT NULL);
CREATE TABLE Fatura (
  nr_fatura      number(19) GENERATED AS IDENTITY, 
  cod_cliente    number(19) NOT NULL, 
  cod_vendedor   number(19) NOT NULL, 
  data_emissao   timestamp(0) NOT NULL, 
  preco_base     number(10, 2) NOT NULL, 
  valor_IVA      number(10, 2) NOT NULL, 
  valor_desconto number(10, 2));
CREATE TABLE Vendedor (
  cod_funcionario number(19) NOT NULL);
CREATE TABLE Pagamento (
  cod_pagamento number(19) GENERATED AS IDENTITY, 
  cod_cliente   number(19) NOT NULL, 
  nr_fatura     number(19) NOT NULL, 
  data          timestamp(7) NOT NULL, 
  valor         number(10, 2) NOT NULL);
CREATE TABLE ArmazemProduto (
  cod_produto  number(19) NOT NULL, 
  cod_armazem  number(19) NOT NULL, 
  stock_minimo number(10, 2) NOT NULL);
CREATE TABLE Marca (
  cod_marca  number(19) GENERATED AS IDENTITY, 
  nome_marca varchar2(255) NOT NULL);
CREATE TABLE Veiculo (
  matricula      char(8) NOT NULL, 
  cod_modelo     number(19) NOT NULL, 
  cod_marca      number(19), 
  apolice_seguro number(10) NOT NULL, 
  kilometragem   number(10) NOT NULL, 
  estado_servico number(10) NOT NULL);
CREATE TABLE Modelo (
  cod_modelo       number(19) GENERATED AS IDENTITY, 
  cod_marca        number(19) NOT NULL, 
  cod_tipo_veiculo number(19) NOT NULL, 
  nome_modelo      varchar2(255) NOT NULL, 
  peso_maximo      number(10, 2) NOT NULL, 
  volume_maximo    number(10, 2) NOT NULL);
CREATE TABLE Unidade (
  cod_unidade number(19) GENERATED AS IDENTITY, 
  descricao   varchar2(255) NOT NULL);
CREATE TABLE TipoIncidente (
  cod_tipo_incidente number(19) GENERATED AS IDENTITY, 
  descricao          nvarchar2(255) NOT NULL);
CREATE TABLE ProdutoZonaFisica (
  cod_produto     number(19) NOT NULL, 
  cod_zona_fisica number(19) NOT NULL, 
  cod_armazem     number(19) NOT NULL, 
  corredor        number(10) NOT NULL, 
  prateleira      number(10) NOT NULL, 
  stock           number(10) NOT NULL);
CREATE TABLE GuiaTransporte (
  cod_guia_transporte number(19) GENERATED AS IDENTITY, 
  cod_viagem          number(19));
