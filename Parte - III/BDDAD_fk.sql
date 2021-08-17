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


ALTER TABLE Etapa ADD CONSTRAINT FKEtapa661602 FOREIGN KEY (cod_cliente_inicial) REFERENCES Cliente (cod_cliente);
ALTER TABLE Etapa ADD CONSTRAINT FKEtapa912421 FOREIGN KEY (cod_cliente_final) REFERENCES Cliente (cod_cliente);
ALTER TABLE Etapa ADD CONSTRAINT FKEtapa603481 FOREIGN KEY (cod_viagem) REFERENCES Viagem (cod_viagem);