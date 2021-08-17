CREATE TABLE Armazem (
  cod_armazem number(19) GENERATED AS IDENTITY, 
  cod_zona    number(19) NOT NULL, 
  nome        varchar2(255) NOT NULL, 
  morada      varchar2(255) NOT NULL, 
  latitude    number(10, 8) NOT NULL, 
  longitude   number(10, 8) NOT NULL, 
  CONSTRAINT cod_Armazem 
    PRIMARY KEY (cod_armazem));
CREATE TABLE ZonaFisica (
  cod_zona_fisica number(19) GENERATED AS IDENTITY, 
  cod_armazem     number(19) NOT NULL, 
  volume_maximo   number(10, 2) NOT NULL, 
  CONSTRAINT cod_armazem 
    PRIMARY KEY (cod_zona_fisica, 
  cod_armazem));
CREATE TABLE Produto (
  cod_produto number(19) GENERATED AS IDENTITY, 
  cod_unidade number(19) NOT NULL, 
  nome        varchar2(255) NOT NULL, 
  descrição   varchar2(255) NOT NULL, 
  peso        number(10, 2), 
  volume      number(10, 2), 
  PRIMARY KEY (cod_produto));
CREATE TABLE precoProduto (
  dataInicio   timestamp(7) NOT NULL, 
  cod_produto  number(19) NOT NULL, 
  precoVenda   number(10, 2) NOT NULL, 
  preço_compra number(10, 2) NOT NULL, 
  PRIMARY KEY (dataInicio, 
  cod_produto));
CREATE TABLE NotaEncomenda (
  cod_nota_encomenda  number(19) GENERATED AS IDENTITY, 
  nr_fatura           number(19), 
  cod_cliente         number(19), 
  cod_vendedor        number(19) NOT NULL, 
  cod_fiel_armazem    number(19), 
  cod_guia_transporte number(19), 
  data                timestamp(0) NOT NULL, 
  estado              number(1) NOT NULL, 
  PRIMARY KEY (cod_nota_encomenda));
CREATE TABLE ZonaGeografica (
  cod_zona  number(19) GENERATED AS IDENTITY, 
  descrição varchar2(255) NOT NULL, 
  CONSTRAINT cod_zona 
    PRIMARY KEY (cod_zona));
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
  categoria       varchar2(255) NOT NULL, 
  PRIMARY KEY (cod_funcionario));
CREATE TABLE Motorista (
  cod_funcionario number(19) NOT NULL, 
  PRIMARY KEY (cod_funcionario));
CREATE TABLE FielArmazem (
  cod_funcionario number(19) NOT NULL, 
  PRIMARY KEY (cod_funcionario));
CREATE TABLE Cliente (
  cod_cliente        number(19) GENERATED AS IDENTITY, 
  nome               varchar2(255) NOT NULL, 
  morada             varchar2(255) NOT NULL, 
  codigoPostal       number(10) NOT NULL, 
  telemovel          number(10) NOT NULL, 
  NIF                char(9) NOT NULL UNIQUE, 
  cod_zonaGeografica number(19) NOT NULL, 
  cod_tipo           number(19) NOT NULL, 
  data_atualizacao   timestamp(0), 
  PRIMARY KEY (cod_cliente));
CREATE TABLE TipoCliente (
  cod_tipo      number(19) GENERATED AS IDENTITY, 
  descricao     varchar2(255) NOT NULL, 
  volume_minimo number(10, 2), 
  volume_maximo number(10, 2), 
  PRIMARY KEY (cod_tipo));
CREATE TABLE GuiaSaidaProduto (
  linha               number(19) GENERATED AS IDENTITY, 
  cod_nota_encomenda  number(19) NOT NULL, 
  cod_produto         number(19) NOT NULL, 
  cod_zona_fisica     number(19), 
  cod_armazem         number(19), 
  cod_guia_transporte number(19), 
  quantidade          number(10) NOT NULL, 
  PRIMARY KEY (linha, 
  cod_nota_encomenda));
CREATE TABLE TipoVeiculo (
  cod_tipo_veiculo number(19) GENERATED AS IDENTITY, 
  numero_eixos     number(10) NOT NULL, 
  PRIMARY KEY (cod_tipo_veiculo));
CREATE TABLE Viagem (
  cod_viagem     number(19) GENERATED AS IDENTITY, 
  cod_motorista  number(19) NOT NULL, 
  matricula      char(8) NOT NULL, 
  data           timestamp(0) NOT NULL, 
  peso_ocupado   number(10, 2) NOT NULL, 
  volume_ocupado number(10, 2) NOT NULL, 
  PRIMARY KEY (cod_viagem));
CREATE TABLE Etapa (
  nr_etapa            number(19) GENERATED AS IDENTITY, 
  cod_cliente_inicial number(19), 
  cod_cliente_final   number(19), 
  cod_viagem          number(19) NOT NULL, 
  PRIMARY KEY (nr_etapa));
CREATE TABLE Relatorio (
  cod_relatorio number(19) GENERATED AS IDENTITY, 
  cod_viagem    number(19), 
  PRIMARY KEY (cod_relatorio));
CREATE TABLE Incidente (
  cod_incidente      number(19) GENERATED AS IDENTITY, 
  cod_tipo_incidente number(19) NOT NULL, 
  nr_etapa           number(19), 
  nr_viagem          number(19) NOT NULL, 
  PRIMARY KEY (cod_incidente));
CREATE TABLE Fatura (
  nr_fatura      number(19) GENERATED AS IDENTITY, 
  cod_cliente    number(19) NOT NULL, 
  cod_vendedor   number(19) NOT NULL, 
  data_emissao   timestamp(0) NOT NULL, 
  preco_base     number(10, 2) NOT NULL, 
  valor_IVA      number(10, 2) NOT NULL, 
  valor_desconto number(10, 2), 
  PRIMARY KEY (nr_fatura));
CREATE TABLE Vendedor (
  cod_funcionario number(19) NOT NULL, 
  PRIMARY KEY (cod_funcionario));
CREATE TABLE Pagamento (
  cod_pagamento number(19) GENERATED AS IDENTITY, 
  cod_cliente   number(19) NOT NULL, 
  nr_fatura     number(19) NOT NULL, 
  data          timestamp(7) NOT NULL, 
  valor         number(10, 2) NOT NULL, 
  PRIMARY KEY (cod_pagamento));
CREATE TABLE ArmazemProduto (
  cod_produto  number(19) NOT NULL, 
  cod_armazem  number(19) NOT NULL, 
  stock_minimo number(10, 2) NOT NULL, 
  PRIMARY KEY (cod_produto, 
  cod_armazem));
CREATE TABLE Marca (
  cod_marca  number(19) GENERATED AS IDENTITY, 
  nome_marca varchar2(255) NOT NULL, 
  PRIMARY KEY (cod_marca));
CREATE TABLE Veiculo (
  matricula      char(8) NOT NULL, 
  cod_modelo     number(19) NOT NULL, 
  cod_marca      number(19), 
  apolice_seguro number(10) NOT NULL, 
  kilometragem   number(10) NOT NULL, 
  estado_servico number(10) NOT NULL, 
  PRIMARY KEY (matricula));
CREATE TABLE Modelo (
  cod_modelo       number(19) GENERATED AS IDENTITY, 
  cod_marca        number(19) NOT NULL, 
  cod_tipo_veiculo number(19) NOT NULL, 
  nome_modelo      varchar2(255) NOT NULL, 
  peso_maximo      number(10, 2) NOT NULL, 
  volume_maximo    number(10, 2) NOT NULL, 
  PRIMARY KEY (cod_modelo, 
  cod_marca));
CREATE TABLE Unidade (
  cod_unidade number(19) GENERATED AS IDENTITY, 
  descricao   varchar2(255) NOT NULL, 
  PRIMARY KEY (cod_unidade));
CREATE TABLE TipoIncidente (
  cod_tipo_incidente number(19) GENERATED AS IDENTITY, 
  descricao          nvarchar2(255) NOT NULL, 
  PRIMARY KEY (cod_tipo_incidente));
CREATE TABLE ProdutoZonaFisica (
  cod_produto     number(19) NOT NULL, 
  cod_zona_fisica number(19) NOT NULL, 
  cod_armazem     number(19) NOT NULL, 
  corredor        number(10) NOT NULL, 
  prateleira      number(10) NOT NULL, 
  stock           number(10) NOT NULL, 
  PRIMARY KEY (cod_produto, 
  cod_zona_fisica, 
  cod_armazem));
CREATE TABLE GuiaTransporte (
  cod_guia_transporte number(19) GENERATED AS IDENTITY, 
  cod_viagem          number(19), 
  PRIMARY KEY (cod_guia_transporte));
ALTER TABLE precoProduto ADD CONSTRAINT FKprecoProdu725535 FOREIGN KEY (cod_produto) REFERENCES Produto (cod_produto);
ALTER TABLE Funcionario ADD CONSTRAINT FKFuncionari469625 FOREIGN KEY (cod_supervisor) REFERENCES Funcionario (cod_funcionario);
ALTER TABLE Cliente ADD CONSTRAINT FKCliente598947 FOREIGN KEY (cod_zonaGeografica) REFERENCES ZonaGeografica (cod_zona);
ALTER TABLE Etapa ADD CONSTRAINT FKEtapa603481 FOREIGN KEY (cod_viagem) REFERENCES Viagem (cod_viagem);
ALTER TABLE Relatorio ADD CONSTRAINT FKRelatorio142034 FOREIGN KEY (cod_viagem) REFERENCES Viagem (cod_viagem);
ALTER TABLE Pagamento ADD CONSTRAINT FKPagamento488847 FOREIGN KEY (nr_fatura) REFERENCES Fatura (nr_fatura);
ALTER TABLE Cliente ADD CONSTRAINT FKCliente775987 FOREIGN KEY (cod_tipo) REFERENCES TipoCliente (cod_tipo);
ALTER TABLE Incidente ADD CONSTRAINT FKIncidente402840 FOREIGN KEY (nr_etapa) REFERENCES Etapa (nr_etapa);
ALTER TABLE FielArmazem ADD CONSTRAINT FKFielArmaze193183 FOREIGN KEY (cod_funcionario) REFERENCES Funcionario (cod_funcionario);
ALTER TABLE Vendedor ADD CONSTRAINT FKVendedor635427 FOREIGN KEY (cod_funcionario) REFERENCES Funcionario (cod_funcionario);
ALTER TABLE Motorista ADD CONSTRAINT FKMotorista525507 FOREIGN KEY (cod_funcionario) REFERENCES Funcionario (cod_funcionario);
ALTER TABLE Viagem ADD CONSTRAINT FKViagem911850 FOREIGN KEY (cod_motorista) REFERENCES Motorista (cod_funcionario);
ALTER TABLE ArmazemProduto ADD CONSTRAINT FKArmazemPro727088 FOREIGN KEY (cod_produto) REFERENCES Produto (cod_produto);
ALTER TABLE Armazem ADD CONSTRAINT FKArmazem559222 FOREIGN KEY (cod_zona) REFERENCES ZonaGeografica (cod_zona);
ALTER TABLE Incidente ADD CONSTRAINT FKIncidente389439 FOREIGN KEY (nr_viagem) REFERENCES Relatorio (cod_relatorio);
ALTER TABLE NotaEncomenda ADD CONSTRAINT FKNotaEncome86377 FOREIGN KEY (nr_fatura) REFERENCES Fatura (nr_fatura);
ALTER TABLE Funcionario ADD CONSTRAINT FKFuncionari811647 FOREIGN KEY (cod_armazem) REFERENCES Armazem (cod_armazem);
ALTER TABLE Fatura ADD CONSTRAINT FKFatura935191 FOREIGN KEY (cod_vendedor) REFERENCES Vendedor (cod_funcionario);
ALTER TABLE Produto ADD CONSTRAINT FKProduto268681 FOREIGN KEY (cod_unidade) REFERENCES Unidade (cod_unidade);
ALTER TABLE Fatura ADD CONSTRAINT FKFatura77681 FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente);
ALTER TABLE Pagamento ADD CONSTRAINT FKPagamento269802 FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente);
ALTER TABLE ZonaFisica ADD CONSTRAINT FKZonaFisica241751 FOREIGN KEY (cod_armazem) REFERENCES Armazem (cod_armazem);
ALTER TABLE Incidente ADD CONSTRAINT FKIncidente228661 FOREIGN KEY (cod_tipo_incidente) REFERENCES TipoIncidente (cod_tipo_incidente);
ALTER TABLE Modelo ADD CONSTRAINT FKModelo698288 FOREIGN KEY (cod_marca) REFERENCES Marca (cod_marca);
ALTER TABLE Modelo ADD CONSTRAINT FKModelo965304 FOREIGN KEY (cod_tipo_veiculo) REFERENCES TipoVeiculo (cod_tipo_veiculo);
ALTER TABLE Veiculo ADD CONSTRAINT FKVeiculo136430 FOREIGN KEY (cod_modelo, cod_marca) REFERENCES Modelo (cod_modelo, cod_marca);
ALTER TABLE Viagem ADD CONSTRAINT FKViagem703870 FOREIGN KEY (matricula) REFERENCES Veiculo (matricula);
ALTER TABLE Etapa ADD CONSTRAINT FKEtapa661602 FOREIGN KEY (cod_cliente_inicial) REFERENCES Cliente (cod_cliente);
ALTER TABLE NotaEncomenda ADD CONSTRAINT FKNotaEncome867331 FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente);
ALTER TABLE GuiaSaidaProduto ADD CONSTRAINT FKGuiaSaidaP443367 FOREIGN KEY (cod_produto, cod_zona_fisica, cod_armazem) REFERENCES ProdutoZonaFisica (cod_produto, cod_zona_fisica, cod_armazem);
ALTER TABLE ProdutoZonaFisica ADD CONSTRAINT FKProdutoZon716990 FOREIGN KEY (cod_produto) REFERENCES Produto (cod_produto);
ALTER TABLE ArmazemProduto ADD CONSTRAINT FKArmazemPro484589 FOREIGN KEY (cod_armazem) REFERENCES Armazem (cod_armazem);
ALTER TABLE NotaEncomenda ADD CONSTRAINT FKNotaEncome650739 FOREIGN KEY (cod_fiel_armazem) REFERENCES FielArmazem (cod_funcionario);
ALTER TABLE GuiaSaidaProduto ADD CONSTRAINT FKGuiaSaidaP665988 FOREIGN KEY (cod_nota_encomenda) REFERENCES NotaEncomenda (cod_nota_encomenda);
ALTER TABLE GuiaTransporte ADD CONSTRAINT FKGuiaTransp783331 FOREIGN KEY (cod_viagem) REFERENCES Viagem (cod_viagem);
ALTER TABLE GuiaSaidaProduto ADD CONSTRAINT FKGuiaSaidaP849356 FOREIGN KEY (cod_guia_transporte) REFERENCES GuiaTransporte (cod_guia_transporte);
ALTER TABLE Etapa ADD CONSTRAINT FKEtapa912421 FOREIGN KEY (cod_cliente_final) REFERENCES Cliente (cod_cliente);
ALTER TABLE NotaEncomenda ADD CONSTRAINT FKNotaEncome528765 FOREIGN KEY (cod_guia_transporte) REFERENCES GuiaTransporte (cod_guia_transporte);
ALTER TABLE NotaEncomenda ADD CONSTRAINT FKNotaEncome908613 FOREIGN KEY (cod_vendedor) REFERENCES Vendedor (cod_funcionario);
ALTER TABLE ProdutoZonaFisica ADD CONSTRAINT FKProdutoZon559367 FOREIGN KEY (cod_zona_fisica, cod_armazem) REFERENCES ZonaFisica (cod_zona_fisica, cod_armazem);
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (1, 'Aveiro');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (2, 'Beja');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (3, 'Braga');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (4, 'Braganca');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (5, 'Castelo Branco');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (6, 'Coimbra');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (7, 'Evora');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (8, 'Faro');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (9, 'Guarda');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (10, 'Leiria');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (11, 'Lisboa');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (12, 'Portalegre');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (13, 'Porto');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (14, 'Santarem');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (15, 'Setubal');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (16, 'Viana do Castelo');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (17, 'Vila Real');
INSERT INTO ZonaGeografica(cod_zona, descrição) VALUES (18, 'Viseu');
INSERT INTO Armazem(cod_armazem, cod_zona, nome, morada, latitude, longitude) VALUES (1, 13, 'Armazem 1', 'Morada 1', 41.191622, -8.67094);
INSERT INTO Armazem(cod_armazem, cod_zona, nome, morada, latitude, longitude) VALUES (2, 13, 'Armazem 2', 'Morada 2', 41.178829, -8.569154);
INSERT INTO Armazem(cod_armazem, cod_zona, nome, morada, latitude, longitude) VALUES (3, 3, 'Armazem 3', 'Morada 3', 41.454992, -8.600654);
INSERT INTO Armazem(cod_armazem, cod_zona, nome, morada, latitude, longitude) VALUES (4, 16, 'Armazem 4', 'Morada 4', 41.882909, -8.81941);
INSERT INTO Armazem(cod_armazem, cod_zona, nome, morada, latitude, longitude) VALUES (5, 11, 'Armazem 5', 'Morada 5', 38.808571, -9.369541);
INSERT INTO Armazem(cod_armazem, cod_zona, nome, morada, latitude, longitude) VALUES (6, 11, 'Armazem 6', 'Morada 6', 38.751338, -9.100821);
INSERT INTO Unidade(cod_unidade, descricao) VALUES (1, 'kilograma');
INSERT INTO Unidade(cod_unidade, descricao) VALUES (2, 'metro');
INSERT INTO Unidade(cod_unidade, descricao) VALUES (3, 'litro');
INSERT INTO Unidade(cod_unidade, descricao) VALUES (4, 'caixa');
INSERT INTO Unidade(cod_unidade, descricao) VALUES (5, 'saco');
INSERT INTO Unidade(cod_unidade, descricao) VALUES (6, 'unidade');
INSERT INTO Produto(cod_produto, cod_unidade, nome, descrição, peso, volume) VALUES (1, 1, 'Areia', 'Areia', 1, 2);
INSERT INTO Produto(cod_produto, cod_unidade, nome, descrição, peso, volume) VALUES (2, 6, 'Madeira', 'Madeira', .2, 0.5);
INSERT INTO Produto(cod_produto, cod_unidade, nome, descrição, peso, volume) VALUES (3, 3, 'Tinta', 'Tinta', null, 5);
INSERT INTO Produto(cod_produto, cod_unidade, nome, descrição, peso, volume) VALUES (4, 4, 'Parafusos', 'Parafusos', 1, 0.1);
INSERT INTO Produto(cod_produto, cod_unidade, nome, descrição, peso, volume) VALUES (5, 5, 'Cimento', 'Cimento', 50, 2);
INSERT INTO Produto(cod_produto, cod_unidade, nome, descrição, peso, volume) VALUES (6, 5, 'Cal', 'Cal', 25, 1);
INSERT INTO Produto(cod_produto, cod_unidade, nome, descrição, peso, volume) VALUES (7, 2, 'Papel de parede', 'Papel de parede', 0.6, 0.1);
INSERT INTO Produto(cod_produto, cod_unidade, nome, descrição, peso, volume) VALUES (8, 6, 'Lavatorio', 'Lavatorio', 2.5, 2);
INSERT INTO Produto(cod_produto, cod_unidade, nome, descrição, peso, volume) VALUES (9, 4, 'Lampada', 'Lampada', 0.1, 0.1);
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (1, 2, 1, 'Nome 1', '12345678', '112233445', 'Morada Emp 1', '01-10-1982', 800, 'Motorista');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (2, null, 1, 'Nome 2', '12134567', '342342344', 'Morada Emp 2', '23-4-1978', 900, 'Fiel de armazem');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (3, 2, 1, 'Nome 3', '21345678', '343545232', 'Morada Emp 3', '3-5-1990', 1200, 'Vendedor');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (4, null, 2, 'Nome 4', '31245678', '347654235', 'Morada Emp 4', '4-12-1975', 800, 'Fiel de armazem');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (5, 4, 2, 'Nome 5', '41235678', '434688643', 'Morada Emp 5', '3-7-1991', 1100, 'Vendedor');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (6, 17, 3, 'Nome 6', '51234678', '222255567', 'Morada Emp 6', '25-7-1994', 850, 'Motorista');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (7, 17, 3, 'Nome 7', '61234578', '335455755', 'Morada Emp 7', '23-9-1989', 980, 'Fiel de armazem');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (8, 17, 3, 'Nome 8', '71234568', '357885565', 'Morada Emp 7', '24-5-1984', 1100, 'Vendedor');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (9, null, 4, 'Nome 9', '81234567', '557568675', 'Morada Emp 8', '3-11-1976', 1100, 'Vendedor');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (10, 9, 4, 'Nome 10', '23123456', '858456345', 'Morada Emp 8', '3-1-2000', 800, 'Motorista');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (11, 9, 4, 'Nome 11', '43125432', '546457666', 'Morada Emp 9', '2-4-1997', 930, 'Fiel de armazem');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (12, 20, 5, 'Nome 12', '42354353', '345668884', 'Morada Emp 12', '1-5-1978', 930, 'Fiel de armazem');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (13, 20, 5, 'Nome 13', '12433632', '566775457', 'Morada Emp 13', '4-7-1990', 825, 'Motorista');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (14, 20, 5, 'Nome 14', '12467753', '564578998', 'Morada Emp 14', '21-12-1987', 1200, 'Vendedor');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (15, 16, 6, 'Nome 15', '12234689', '345645789', 'Morada Emp 15', '4-6-1991', 1250, 'Vendedor');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (16, null, 6, 'Nome 16', '98765432', '575687645', 'Morada Emp 16', '6-3-1982', 980, 'Fiel de armazem');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (17, null, 3, 'Nome 17', '34875424', '796794456', 'Morada Emp 17', '4-10-1982', 990, 'Fiel de armazem');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (18, 16, 6, 'Nome 18', '24686742', '346346555', 'Morada Emp 18', '4-6-1999', 800, 'Motorista');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (19, 16, 6, 'Nome 19', '78964324', '467887555', 'Morada Emp 19', '7-2-1985', 800, 'Motorista');
INSERT INTO Funcionario(cod_funcionario, cod_supervisor, cod_armazem, nome, cartaoCidadao, NIF, morada, data_nascimento, salario, categoria) VALUES (20, null, 5, 'Nome 20', '90908765', '346346765', 'Morada Emp 20', '7-8-1977', 880, 'Fiel de armazem');
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (1, 1, 10);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (2, 1, 14);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (3, 1, 12);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (4, 1, 30);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (1, 2, 60);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (2, 2, 100);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (1, 3, 30);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (2, 3, 20);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (3, 3, 20);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (4, 3, 30);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (1, 4, 50);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (2, 4, 20);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (1, 5, 70);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (2, 5, 40);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (3, 5, 30);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (4, 5, 20);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (1, 6, 50);
INSERT INTO ZonaFisica(cod_zona_fisica, cod_armazem, volume_maximo) VALUES (2, 6, 50);
INSERT INTO Motorista(cod_funcionario) VALUES (1);
INSERT INTO Motorista(cod_funcionario) VALUES (6);
INSERT INTO Motorista(cod_funcionario) VALUES (10);
INSERT INTO Motorista(cod_funcionario) VALUES (13);
INSERT INTO Motorista(cod_funcionario) VALUES (18);
INSERT INTO Motorista(cod_funcionario) VALUES (19);
INSERT INTO FielArmazem(cod_funcionario) VALUES (2);
INSERT INTO FielArmazem(cod_funcionario) VALUES (4);
INSERT INTO FielArmazem(cod_funcionario) VALUES (7);
INSERT INTO FielArmazem(cod_funcionario) VALUES (11);
INSERT INTO FielArmazem(cod_funcionario) VALUES (12);
INSERT INTO FielArmazem(cod_funcionario) VALUES (16);
INSERT INTO FielArmazem(cod_funcionario) VALUES (17);
INSERT INTO FielArmazem(cod_funcionario) VALUES (20);
INSERT INTO TipoCliente(cod_tipo, descricao, volume_minimo, volume_maximo) VALUES (1, 'Pequeno Cliente', null, 29999.99);
INSERT INTO TipoCliente(cod_tipo, descricao, volume_minimo, volume_maximo) VALUES (2, 'Grande Cliente', 30000.00, 50000.00);
INSERT INTO TipoCliente(cod_tipo, descricao, volume_minimo, volume_maximo) VALUES (3, 'VIP', 50000.01, null);
INSERT INTO Cliente(cod_cliente, nome, morada, codigoPostal, telemovel, NIF, cod_zonaGeografica, cod_tipo, data_atualizacao) VALUES (1, 'Cliente 1', 'Morada C1', 4450, 911111111, '993243124', 13, 1, null);
INSERT INTO Cliente(cod_cliente, nome, morada, codigoPostal, telemovel, NIF, cod_zonaGeografica, cod_tipo, data_atualizacao) VALUES (2, 'Cliente 2', 'Morada C2', 4000, 911111112, '995428731', 13, 1, null);
INSERT INTO Cliente(cod_cliente, nome, morada, codigoPostal, telemovel, NIF, cod_zonaGeografica, cod_tipo, data_atualizacao) VALUES (3, 'Cliente 3', 'Morada C3', 4755, 911111113, '994572624', 3, 1, null);
INSERT INTO Cliente(cod_cliente, nome, morada, codigoPostal, telemovel, NIF, cod_zonaGeografica, cod_tipo, data_atualizacao) VALUES (4, 'Cliente 4', 'Morada C4', 4910, 911111114, '997623231', 16, 1, null);
INSERT INTO Cliente(cod_cliente, nome, morada, codigoPostal, telemovel, NIF, cod_zonaGeografica, cod_tipo, data_atualizacao) VALUES (5, 'Cliente 5', 'Morada C5', 2780, 911111115, '993895865', 11, 1, null);
INSERT INTO Cliente(cod_cliente, nome, morada, codigoPostal, telemovel, NIF, cod_zonaGeografica, cod_tipo, data_atualizacao) VALUES (6, 'Cliente 6', 'Morada C6', 2050, 911111116, '993636484', 11, 1, null);
INSERT INTO Cliente(cod_cliente, nome, morada, codigoPostal, telemovel, NIF, cod_zonaGeografica, cod_tipo, data_atualizacao) VALUES (7, 'Cliente', 'Morada C7', 4000, 930000007, '994527424', 13, 1, null);
INSERT INTO TipoVeiculo(cod_tipo_veiculo, numero_eixos) VALUES (1, 2);
INSERT INTO TipoVeiculo(cod_tipo_veiculo, numero_eixos) VALUES (2, 3);
INSERT INTO TipoVeiculo(cod_tipo_veiculo, numero_eixos) VALUES (3, 4);
INSERT INTO TipoVeiculo(cod_tipo_veiculo, numero_eixos) VALUES (4, 6);
INSERT INTO Marca(cod_marca, nome_marca) VALUES (1, 'Ford');
INSERT INTO Marca(cod_marca, nome_marca) VALUES (2, 'Honda');
INSERT INTO Marca(cod_marca, nome_marca) VALUES (3, 'Toyota');
INSERT INTO Marca(cod_marca, nome_marca) VALUES (4, 'Mitsubishi');
INSERT INTO Marca(cod_marca, nome_marca) VALUES (5, 'Volkswagen');
INSERT INTO Marca(cod_marca, nome_marca) VALUES (6, 'GMC');
INSERT INTO Marca(cod_marca, nome_marca) VALUES (7, 'Mercedes');
INSERT INTO Marca(cod_marca, nome_marca) VALUES (8, 'MAC');
INSERT INTO Marca(cod_marca, nome_marca) VALUES (9, 'Renault');
INSERT INTO Vendedor(cod_funcionario) VALUES (3);
INSERT INTO Vendedor(cod_funcionario) VALUES (5);
INSERT INTO Vendedor(cod_funcionario) VALUES (8);
INSERT INTO Vendedor(cod_funcionario) VALUES (9);
INSERT INTO Vendedor(cod_funcionario) VALUES (14);
INSERT INTO Vendedor(cod_funcionario) VALUES (15);
INSERT INTO Fatura(nr_fatura, cod_cliente, cod_vendedor, data_emissao, preco_base, valor_IVA, valor_desconto) VALUES (2, 2, 3, '15-3-2018', null, null, 0);
INSERT INTO Fatura(nr_fatura, cod_cliente, cod_vendedor, data_emissao, preco_base, valor_IVA, valor_desconto) VALUES (3, 7, 5, '15-3-2018', null, null, 0);
INSERT INTO Modelo(cod_modelo, cod_marca, cod_tipo_veiculo, nome_modelo, peso_maximo, volume_maximo) VALUES (1, 1, 1, 'Transit Courier', 450, 6);
INSERT INTO Modelo(cod_modelo, cod_marca, cod_tipo_veiculo, nome_modelo, peso_maximo, volume_maximo) VALUES (2, 1, 1, 'Transit Custom', 800, 5.5);
INSERT INTO Modelo(cod_modelo, cod_marca, cod_tipo_veiculo, nome_modelo, peso_maximo, volume_maximo) VALUES (3, 3, 2, 'Dyna', 900, 10);
INSERT INTO Modelo(cod_modelo, cod_marca, cod_tipo_veiculo, nome_modelo, peso_maximo, volume_maximo) VALUES (4, 3, 1, 'Proace', 600, 8);
INSERT INTO Modelo(cod_modelo, cod_marca, cod_tipo_veiculo, nome_modelo, peso_maximo, volume_maximo) VALUES (5, 5, 1, 'Caddy', 450, 3);
INSERT INTO Modelo(cod_modelo, cod_marca, cod_tipo_veiculo, nome_modelo, peso_maximo, volume_maximo) VALUES (6, 5, 1, 'Kombi', 400, 5.5);
INSERT INTO Modelo(cod_modelo, cod_marca, cod_tipo_veiculo, nome_modelo, peso_maximo, volume_maximo) VALUES (7, 7, 4, 'Actros', 3000, 60);
INSERT INTO Modelo(cod_modelo, cod_marca, cod_tipo_veiculo, nome_modelo, peso_maximo, volume_maximo) VALUES (8, 7, 2, 'Antos', 1000, 20);
INSERT INTO Modelo(cod_modelo, cod_marca, cod_tipo_veiculo, nome_modelo, peso_maximo, volume_maximo) VALUES (9, 9, 1, 'Kangoo Express', 500, 6);
INSERT INTO Veiculo(matricula, cod_modelo, cod_marca, apolice_seguro, kilometragem, estado_servico) VALUES ('00-AA-00', 1, 1, 3254534, 4444, 0);
INSERT INTO Veiculo(matricula, cod_modelo, cod_marca, apolice_seguro, kilometragem, estado_servico) VALUES ('00-BB-00', 2, 1, 1232423, 23412, 0);
INSERT INTO Veiculo(matricula, cod_modelo, cod_marca, apolice_seguro, kilometragem, estado_servico) VALUES ('00-CC-00', 3, 3, 23423423, 233456, 0);
INSERT INTO Veiculo(matricula, cod_modelo, cod_marca, apolice_seguro, kilometragem, estado_servico) VALUES ('11-AB-00', 4, 3, 5341331, 343512, 1);
INSERT INTO Veiculo(matricula, cod_modelo, cod_marca, apolice_seguro, kilometragem, estado_servico) VALUES ('11-ZZ-32', 5, 5, 23453451, 4432, 0);
INSERT INTO Veiculo(matricula, cod_modelo, cod_marca, apolice_seguro, kilometragem, estado_servico) VALUES ('22-33-LK', 5, 5, 452135, 66433, 0);
INSERT INTO Veiculo(matricula, cod_modelo, cod_marca, apolice_seguro, kilometragem, estado_servico) VALUES ('TG-43-23', 7, 7, 12351324, 33456, 0);
INSERT INTO Viagem(cod_viagem, cod_motorista, matricula, data, peso_ocupado, volume_ocupado) VALUES (1, 1, '00-AA-00', '6-3-2018', 350, 6);
INSERT INTO Viagem(cod_viagem, cod_motorista, matricula, data, peso_ocupado, volume_ocupado) VALUES (2, 13, '11-ZZ-32', '5-3-2018', 450, 2);
INSERT INTO Viagem(cod_viagem, cod_motorista, matricula, data, peso_ocupado, volume_ocupado) VALUES (3, 18, '22-33-LK', '3-12-2018', 450, 3);
INSERT INTO GuiaTransporte(cod_guia_transporte, cod_viagem) VALUES (1, null);
INSERT INTO GuiaTransporte(cod_guia_transporte, cod_viagem) VALUES (2, null);
INSERT INTO GuiaTransporte(cod_guia_transporte, cod_viagem) VALUES (3, null);
INSERT INTO GuiaTransporte(cod_guia_transporte, cod_viagem) VALUES (4, null);
INSERT INTO GuiaTransporte(cod_guia_transporte, cod_viagem) VALUES (5, null);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (1, 1, 1, 1, 1, 2);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (1, 2, 1, 1, 4, 2);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (2, 3, 1, 5, 4, 3);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (9, 4, 1, 3, 4, 15);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (2, 1, 2, 4, 3, 33);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (2, 2, 2, 1, 1, 6);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (5, 1, 3, 3, 3, 45);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (6, 2, 3, 4, 4, 45);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (1, 3, 3, 4, 5, 33);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (1, 4, 3, 2, 3, 22);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (8, 1, 4, 2, 2, 33);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (9, 2, 4, 1, 1, 3);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (5, 1, 5, 3, 3, 32);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (2, 2, 5, 2, 2, 22);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (7, 3, 5, 1, 1, 11);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (3, 4, 5, 2, 2, 2);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (9, 1, 6, 1, 1, 23);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (9, 3, 1, 1, 2, 22);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (4, 2, 2, 3, 3, 32);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (8, 2, 6, 2, 2, 22);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (7, 1, 6, 1, 2, 33);
INSERT INTO ProdutoZonaFisica(cod_produto, cod_zona_fisica, cod_armazem, corredor, prateleira, stock) VALUES (4, 1, 6, 1, 3, 22);
INSERT INTO Pagamento(cod_pagamento, cod_cliente, nr_fatura, data, valor) VALUES (1, 1, 1, '', null);
INSERT INTO Pagamento(cod_pagamento, cod_cliente, nr_fatura, data, valor) VALUES (2, 7, null, null, null);
INSERT INTO Pagamento(cod_pagamento, cod_cliente, nr_fatura, data, valor) VALUES (3, 3, null, null, null);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (1, 1, 100);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (2, 1, 5);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (9, 1, 20);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (4, 2, 5);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (2, 2, 5);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (5, 3, 6);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (6, 3, 4);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (1, 3, 80);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (8, 4, 2);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (9, 4, 5);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (5, 5, 3);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (2, 5, 8);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (7, 5, 20);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (3, 5, 4);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (9, 6, 2);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (8, 6, 2);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (7, 6, 25);
INSERT INTO ArmazemProduto(cod_produto, cod_armazem, stock_minimo) VALUES (4, 6, 2);
INSERT INTO Relatorio(cod_relatorio, cod_viagem) VALUES (1, 1);
INSERT INTO Relatorio(cod_relatorio, cod_viagem) VALUES (2, 2);
INSERT INTO Relatorio(cod_relatorio, cod_viagem) VALUES (3, 3);
INSERT INTO Etapa(nr_etapa, cod_cliente_inicial, cod_cliente_final, cod_viagem) VALUES (1, null, 1, 1);
INSERT INTO Etapa(nr_etapa, cod_cliente_inicial, cod_cliente_final, cod_viagem) VALUES (2, 1, 2, 1);
INSERT INTO Etapa(nr_etapa, cod_cliente_inicial, cod_cliente_final, cod_viagem) VALUES (3, 2, null, 1);
INSERT INTO Etapa(nr_etapa, cod_cliente_inicial, cod_cliente_final, cod_viagem) VALUES (1, null, 7, 2);
INSERT INTO Etapa(nr_etapa, cod_cliente_inicial, cod_cliente_final, cod_viagem) VALUES (2, 7, null, 2);
INSERT INTO Etapa(nr_etapa, cod_cliente_inicial, cod_cliente_final, cod_viagem) VALUES (1, null, 5, 3);
INSERT INTO Etapa(nr_etapa, cod_cliente_inicial, cod_cliente_final, cod_viagem) VALUES (2, 5, 6, 3);
INSERT INTO Etapa(nr_etapa, cod_cliente_inicial, cod_cliente_final, cod_viagem) VALUES (3, 6, null, 3);
INSERT INTO TipoIncidente(cod_tipo_incidente, descricao) VALUES (1, 'Acidente de viacao');
INSERT INTO TipoIncidente(cod_tipo_incidente, descricao) VALUES (2, 'Cliente nao estava');
INSERT INTO TipoIncidente(cod_tipo_incidente, descricao) VALUES (3, 'Greve');
INSERT INTO TipoIncidente(cod_tipo_incidente, descricao) VALUES (4, 'Transito');
INSERT INTO TipoIncidente(cod_tipo_incidente, descricao) VALUES (5, 'Sem incidente');
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('1-8-2018', 1, 3.00, 1.50);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('1-9-2018', 1, 2.79, 1.50);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('10-9-2018', 1, 2.79, 1.40);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('1-7-2018', 2, 10, 5);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('25-11-2018', 2, 9.99, 4.04);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('4-5-2013', 3, 15.99, 9.99);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('4-4-2017', 4, 2.49, 1);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('1-5-2018', 5, 23, 12);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('1-10-2018', 5, 22, 12);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('3-9-2018', 6, 19.99, 13);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('4-4-2017', 7, 2.39, 0.99);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('4-4-2017', 7, 2.09, 0.99);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('3-3-2018', 8, 99.99, 50);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('10-10-2018', 8, 109.99, 45);
INSERT INTO precoProduto(dataInicio, cod_produto, precoVenda, preço_compra) VALUES ('1-1-2001', 9, 1.49, 0.49);
INSERT INTO Incidente(cod_incidente, cod_tipo_incidente, nr_etapa, nr_viagem) VALUES (1, 4, 2, 1);
INSERT INTO Incidente(cod_incidente, cod_tipo_incidente, nr_etapa, nr_viagem) VALUES (2, 5, null, 2);
INSERT INTO Incidente(cod_incidente, cod_tipo_incidente, nr_etapa, nr_viagem) VALUES (3, 4, 1, 3);
INSERT INTO Incidente(cod_incidente, cod_tipo_incidente, nr_etapa, nr_viagem) VALUES (4, 1, 3, 3);
INSERT INTO NotaEncomenda(cod_nota_encomenda, nr_fatura, cod_cliente, cod_vendedor, cod_fiel_armazem, cod_guia_transporte, data, estado) VALUES (1, null, 1, 3, null, null, '1-11-2018', 0);
INSERT INTO NotaEncomenda(cod_nota_encomenda, nr_fatura, cod_cliente, cod_vendedor, cod_fiel_armazem, cod_guia_transporte, data, estado) VALUES (2, null, 2, 3, 2, null, '1-11-2018', 1);
INSERT INTO NotaEncomenda(cod_nota_encomenda, nr_fatura, cod_cliente, cod_vendedor, cod_fiel_armazem, cod_guia_transporte, data, estado) VALUES (3, null, 1, 3, 2, 1, '3-3-2018', 2);
INSERT INTO NotaEncomenda(cod_nota_encomenda, nr_fatura, cod_cliente, cod_vendedor, cod_fiel_armazem, cod_guia_transporte, data, estado) VALUES (4, null, 2, 3, 2, 2, '3-3-2018', 2);
INSERT INTO NotaEncomenda(cod_nota_encomenda, nr_fatura, cod_cliente, cod_vendedor, cod_fiel_armazem, cod_guia_transporte, data, estado) VALUES (5, null, 7, 5, 4, 3, '4-3-2018', 2);
INSERT INTO NotaEncomenda(cod_nota_encomenda, nr_fatura, cod_cliente, cod_vendedor, cod_fiel_armazem, cod_guia_transporte, data, estado) VALUES (6, null, 5, 15, 16, 4, '1-12-2018', 2);
INSERT INTO NotaEncomenda(cod_nota_encomenda, nr_fatura, cod_cliente, cod_vendedor, cod_fiel_armazem, cod_guia_transporte, data, estado) VALUES (7, null, 6, 15, 16, 5, '1-12-2018', 2);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (1, 2, 1, 1, 1, null, 3);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (2, 2, 2, 3, 1, null, 3);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (1, 3, 2, 3, 1, 1, 5);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (2, 3, 9, 4, 1, 1, 6);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (3, 3, 1, 1, 1, 1, 2);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (1, 4, 8, 1, 4, 2, 3);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (2, 4, 9, 2, 4, 2, 5);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (1, 5, 2, 2, 5, 3, 4);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (1, 6, 7, 3, 5, 4, 33);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (1, 7, 3, 4, 5, 5, 2);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (1, 1, 2, null, null, null, 2);
INSERT INTO GuiaSaidaProduto(linha, cod_nota_encomenda, cod_produto, cod_zona_fisica, cod_armazem, cod_guia_transporte, quantidade) VALUES (2, 1, 1, null, null, null, 4);
