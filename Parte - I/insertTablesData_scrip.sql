-- Fill table Armazem --

INSERT INTO armazem VALUES (11111, 'Parafusos', 'Rua dos Parafusos', 'Porto');
INSERT INTO armazem VALUES (22222, 'Pregos', 'Rua dos Pregos', 'Porto');
INSERT INTO armazem VALUES (33333, 'Martelo', 'Rua do Martelo', 'Porto');
INSERT INTO armazem VALUES (44444, 'Tintas', 'Rua das Tintas', 'Braga');
INSERT INTO armazem VALUES (55555, 'Pregos', 'Rua dos Pregos', 'Chaves');
INSERT INTO armazem VALUES (66666, 'Buxas', 'Rua das Buxas', 'Lisboa');
INSERT INTO armazem VALUES (77777, 'Black and Decker', 'Rua do Black and Decker', 'Guarda');
INSERT INTO armazem VALUES (88888, 'AKI', 'Rua do AKI', 'Gaia');
INSERT INTO armazem VALUES (99999, 'Leroy Merlin', 'Rua do Leroy Merlin', 'Maia');
INSERT INTO armazem VALUES (10000, 'Pinceis', 'Rua dos Pinceis', 'Matosinhos');


-- Fill table Empregado --

-- Armazem Parafusos --
INSERT INTO Empregado VALUES (1000, null, 11111, 'Empregado 1', 'Rua da casa dele', 600, 'secundário');
INSERT INTO Empregado VALUES (1332, 1000, 11111, 'Empregado 3', 'Avenida central', 300, 'secundário');
INSERT INTO Empregado VALUES (1411, 1000, 11111, 'Empregado 4', 'Travessa do peixe', 300, 'secundário');	

-- Armazem Pregos 1 --
INSERT INTO Empregado VALUES (2000, null, 22222, 'Empregado 1', 'Rua da casa dele', 550, 'superior');
INSERT INTO Empregado VALUES (2223, 2000, 22222, 'Empregado 2', 'Rua onde mora', 300, 'secundário');
INSERT INTO Empregado VALUES (2332, 2000, 22222, 'Empregado 3', 'Avenida central', 300, 'secundário');
INSERT INTO Empregado VALUES (2211, 2000, 22222, 'Empregado 4', 'Travessa do peixe', 300, 'secundário');

-- Armazem Martelo --
INSERT INTO Empregado VALUES (3000, null, 33333, 'Empregado 1', 'Rua da casa dele', 630, 'secundário');
INSERT INTO Empregado VALUES (3223, 3000, 33333, 'Empregado 2', 'Rua onde mora', 300, 'básico');
INSERT INTO Empregado VALUES (3211, 3000, 33333, 'Empregado 4', 'Travessa do peixe', 300, 'secundário');

-- Armazem Tintas --
INSERT INTO Empregado VALUES (4000, null, 44444, 'Empregado 1', 'Rua da casa dele', 800, 'secundário');
INSERT INTO Empregado VALUES (4223, 4000, 44444, 'Empregado 2', 'Rua onde mora', 300, 'secundário');
INSERT INTO Empregado VALUES (4332, 4000, 44444, 'Empregado 3', 'Avenida central', 300, 'básico');
INSERT INTO Empregado VALUES (4211, 4000, 44444, 'Empregado 4', 'Travessa do peixe', 300, 'secundário');
INSERT INTO Empregado VALUES (4311, 4000, 44444, 'Empregado 5', 'Travessa do peixinho', 300, 'secundário');
INSERT INTO Empregado VALUES (1223, 4000, 44444, 'Empregado 6', 'Rua da Travessa', 300, 'secundário');

-- Armazem Pregos 2 --
INSERT INTO Empregado VALUES (5000, null, 55555, 'Empregado 1', 'Rua da casa dele', 1000, 'superior');
INSERT INTO Empregado VALUES (5223, 5000, 55555, 'Empregado 2', 'Rua onde mora', 300, 'secundário');
INSERT INTO Empregado VALUES (5332, 5000, 55555, 'Empregado 3', 'Avenida central', 300, 'secundário');
INSERT INTO Empregado VALUES (5211, 5000, 55555, 'Empregado 4', 'Travessa do peixe', 300, 'secundário');


-- Fill table Fornecedor --
INSERT INTO fornecedor VALUES (11111, 'Punkzilla', 'Rua do Punkzilla', '123456789', '911234567');
INSERT INTO fornecedor VALUES (22222, 'Senhor 1', 'Rua 1', '123456788', '912345671');
INSERT INTO fornecedor VALUES (33333, 'Senhor 2', 'Rua 2', '234567891', '913456712');
INSERT INTO fornecedor VALUES (44444, 'Senhor 3', 'Rua 3', '345678912', '914567123');
INSERT INTO fornecedor VALUES (55555, 'Senhor 4', 'Rua 4', '456789123', '915671234');
INSERT INTO fornecedor VALUES (66666, 'Senhor 5', 'Rua 5', '567891234', '916712345');
INSERT INTO fornecedor VALUES (77777, 'Senhor 6', 'Rua 6', '678912345', '917123456');
INSERT INTO fornecedor VALUES (88888, 'Senhor 7', 'Rua 7', '789123456', '919876543');
INSERT INTO fornecedor VALUES (99999, 'Senhor 8', 'Rua 8', '891234567', '917654321');
INSERT INTO fornecedor VALUES (10000, 'Senhor 9', 'Rua 9', '912345678', '916543217');


-- Fill table Produto --
INSERT INTO Produto VALUES (10001, 'Parafusos 2x7', 'caixa', 10.00);
INSERT INTO Produto VALUES (10002, 'Parafusos 2x14', 'caixa', 12.50);
INSERT INTO Produto VALUES (10003, 'Parafusos 3x7', 'caixa', 12.50);
INSERT INTO Produto VALUES (10004, 'Parafusos 3x14', 'caixa', 16.50);
INSERT INTO Produto VALUES (10005, 'Parafusos 5x7', 'caixa', 19.50);
INSERT INTO Produto VALUES (10006, 'Parafusos 5x14', 'caixa', 20.50);

INSERT INTO Produto VALUES (20001, 'Tinta Interior Branca', '15L', 18.90);
INSERT INTO Produto VALUES (20002, 'Tinta IsepBrico', '25L', 30.00);
INSERT INTO Produto VALUES (20003, 'Tinta IsepBrico', '15L', 20.00);
INSERT INTO Produto VALUES (20004, 'Tinta IsepBrico', '30L', 35.00);

INSERT INTO Produto VALUES (30001, 'Tijolo 7', 'un', 0.30);
INSERT INTO Produto VALUES (30002, 'Tijolo 12', 'un', 0.40);
INSERT INTO Produto VALUES (30003, 'Saco cimento', 'saco', 25.00);

INSERT INTO Produto VALUES (40001, 'Prateleira', 'un', 25.99);
INSERT INTO Produto VALUES (40002, 'Candeeiro', 'un', 19.00);

INSERT INTO Produto VALUES (50001, 'Torneira misturadora', 'un', 10.00);
INSERT INTO Produto VALUES (50002, 'Banheira', 'un', 150.00);
INSERT INTO Produto VALUES (50003, 'Poliban', 'un', 59.99);
INSERT INTO Produto VALUES (50004, 'Coluna chuveiro', 'un', 109.00);

INSERT INTO Produto VALUES (60001, 'Trincha', 'un', 1.99);
INSERT INTO Produto VALUES (60002, 'Pincel', 'un', 0.99);

INSERT INTO Produto VALUES (70001, 'Buxas pequenas', 'caixa',1.45);
INSERT INTO Produto VALUES (70002, 'Buxas médias', 'caixa', 1.55);
INSERT INTO Produto VALUES (70003, 'Buxas grandes', 'caixa', 1.65);

INSERT INTO Produto VALUES (80001, 'Pregos pequenas', 'caixa', 1.00);
INSERT INTO Produto VALUES (80002, 'Pregos médias', 'caixa', 1.70);
INSERT INTO Produto VALUES (80003, 'Pregos grandes', 'caixa', 2.65);

INSERT INTO Produto VALUES (90001, 'Martelo', 'un', 17);
INSERT INTO Produto VALUES (90002, 'Marreta', 'un', 25);

INSERT INTO Produto VALUES (00001, 'Berbequim', 'un', 20.99);
INSERT INTO Produto VALUES (00002, 'Serra', 'un', 25);
INSERT INTO Produto VALUES (00003, 'Martelo pneumático', 'un', 250);


-- Fill FornecedorProduto tables --
INSERT INTO FornecedorProduto VALUES (11111, 10001, 7.50, 20);
INSERT INTO FornecedorProduto VALUES (33333, 10001, 8.00, 10);
INSERT INTO FornecedorProduto VALUES (22222, 10002, 10.0, 00);
INSERT INTO FornecedorProduto VALUES (11111, 10003, 7.45, 00);
INSERT INTO FornecedorProduto VALUES (10000, 10004, 9.50, 20);
INSERT INTO FornecedorProduto VALUES (11111, 10005, 12.5, 12);
INSERT INTO FornecedorProduto VALUES (33333, 10006, 10.5, 09);
INSERT INTO FornecedorProduto VALUES (11111, 10006, 21.5, 03);

INSERT INTO FornecedorProduto VALUES (11111, 20001, 5.50, 22);
INSERT INTO FornecedorProduto VALUES (44444, 20002, 9.55, 26);
INSERT INTO FornecedorProduto VALUES (44444, 20003, 16.5, 23);
INSERT INTO FornecedorProduto VALUES (11111, 20004, 21.5, 00);

INSERT INTO FornecedorProduto VALUES (55555, 30001, 0.02, 50);
INSERT INTO FornecedorProduto VALUES (10000, 30001, 0.03, 08);
INSERT INTO FornecedorProduto VALUES (77777, 30002, 0.08, 03);
INSERT INTO FornecedorProduto VALUES (99999, 30003, 20.0, 00);
INSERT INTO FornecedorProduto VALUES (88888, 30003, 18.5, 10);

INSERT INTO FornecedorProduto VALUES (33333, 40001, 20.5, 12);
INSERT INTO FornecedorProduto VALUES (11111, 40001, 22.0, 18);
INSERT INTO FornecedorProduto VALUES (11111, 40002, 7.50, 20);
INSERT INTO FornecedorProduto VALUES (22222, 40002, 9.50, 10);

INSERT INTO FornecedorProduto VALUES (99999, 50001, 9.50, 06);
INSERT INTO FornecedorProduto VALUES (11111, 50002, 120., 18);
INSERT INTO FornecedorProduto VALUES (88888, 50003, 47.5, 25);
INSERT INTO FornecedorProduto VALUES (22222, 50004, 99.5, 10);
INSERT INTO FornecedorProduto VALUES (33333, 50004, 90.5, 12);

INSERT INTO FornecedorProduto VALUES (11111, 60001, 1.50, 02);
INSERT INTO FornecedorProduto VALUES (44444, 60001, 1.55, 00);
INSERT INTO FornecedorProduto VALUES (33333, 60002, 0.50, 23);
INSERT INTO FornecedorProduto VALUES (66666, 60002, 0.35, 30);

INSERT INTO FornecedorProduto VALUES (44444, 70001, 1.00, 00);
INSERT INTO FornecedorProduto VALUES (44444, 70002, 1.00, 23);
INSERT INTO FornecedorProduto VALUES (44444, 70003, 1.00, 30);

INSERT INTO FornecedorProduto VALUES (44444, 80001, 0.95, 00);
INSERT INTO FornecedorProduto VALUES (33333, 80001, 0.80, 23);
INSERT INTO FornecedorProduto VALUES (44444, 80002, 1.00, 30);
INSERT INTO FornecedorProduto VALUES (99999, 80003, 1.19, 22);
INSERT INTO FornecedorProduto VALUES (44444, 80003, 1.10, 03);

INSERT INTO FornecedorProduto VALUES (77777, 90001, 10.0, 00);
INSERT INTO FornecedorProduto VALUES (77777, 90002, 20.0, 23);
INSERT INTO FornecedorProduto VALUES (44444, 90002, 22.0, 20);

INSERT INTO FornecedorProduto VALUES (77777, 00001, 15.0, 30);
INSERT INTO FornecedorProduto VALUES (77777, 00002, 20.0, 23);
INSERT INTO FornecedorProduto VALUES (44444, 00002, 220., 20);


-- Fill ArmazemProduto tables --

-- Parafusos --
INSERT INTO ArmazemProduto VALUES (11111, 10001, 20, 5, 1, 1);
INSERT INTO ArmazemProduto VALUES (11111, 20002, 10, 5, 3, 2);
INSERT INTO ArmazemProduto VALUES (11111, 10003, 25, 10, 4, 1);
INSERT INTO ArmazemProduto VALUES (11111, 30002, 20, 5, 1, 3);
INSERT INTO ArmazemProduto VALUES (11111, 10005, 5, 5, 3, 3);
INSERT INTO ArmazemProduto VALUES (11111, 40002, 20, 15, 2, 1);

--- Pregos ---
INSERT INTO ArmazemProduto VALUES (22222, 80001, 10, 1, 1, 1);
INSERT INTO ArmazemProduto VALUES (22222, 30002, 5, 3, 1, 2);
INSERT INTO ArmazemProduto VALUES (22222, 60002, 38, 3, 1, 3);
INSERT INTO ArmazemProduto VALUES (22222, 70001, 10, 1, 2, 1);
INSERT INTO ArmazemProduto VALUES (22222, 20002, 5, 3, 2, 2);
INSERT INTO ArmazemProduto VALUES (22222, 80003, 38, 3, 2, 3);

-- Martelos --
INSERT INTO ArmazemProduto VALUES (33333, 90001, 3, 3, 1, 1);
INSERT INTO ArmazemProduto VALUES (33333, 30002, 3, 2, 1, 2);
INSERT INTO ArmazemProduto VALUES (33333, 00001, 3, 3, 2, 1);
INSERT INTO ArmazemProduto VALUES (33333, 70002, 3, 2, 2, 2);
INSERT INTO ArmazemProduto VALUES (33333, 50001, 3, 3, 3, 1);
INSERT INTO ArmazemProduto VALUES (33333, 90002, 3, 2, 3, 2);

-- Tintas --
INSERT INTO ArmazemProduto VALUES (44444, 20001, 3, 2, 1, 1);
INSERT INTO ArmazemProduto VALUES (44444, 20002, 4, 2, 1, 2);
INSERT INTO ArmazemProduto VALUES (44444, 20003, 6, 2, 2, 1);
INSERT INTO ArmazemProduto VALUES (44444, 20004, 3, 3, 2, 2);

-- Pregos ---
INSERT INTO ArmazemProduto VALUES (55555, 80002, 50, 3, 2, 1);
INSERT INTO ArmazemProduto VALUES (55555, 60001, 30, 3, 1, 1);
INSERT INTO ArmazemProduto VALUES (55555, 30002, 50, 3, 2, 2);
INSERT INTO ArmazemProduto VALUES (55555, 80003, 30, 3, 1, 2);
INSERT INTO ArmazemProduto VALUES (55555, 10002, 50, 3, 3, 1);
INSERT INTO ArmazemProduto VALUES (55555, 00003, 30, 3, 3, 2);

-- Fill OrdemCompra tables --

INSERT INTO OrdemCompra VALUES (00001, 11111, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 6500.00, TO_DATE('2018-08-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00002, 11111, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 7000.00, TO_DATE('2018-08-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00003, 11111, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 6500.00, TO_DATE('2018-08-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00004, 22222, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 5500.00, TO_DATE('2018-08-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00005, 33333, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 5678.00, TO_DATE('2018-08-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00006, 44444, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 6500.00, TO_DATE('2018-06-05 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00007, 55555, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 6500.00, TO_DATE('2018-06-05 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00008, 66666, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 6500.00, TO_DATE('2018-06-05 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00009, 77777, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-06-05 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 2);
INSERT INTO OrdemCompra VALUES (00010, 88888, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-06-05 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 2);
INSERT INTO OrdemCompra VALUES (00011, 99999, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-06-05 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 2);
INSERT INTO OrdemCompra VALUES (00012, 11111, 1223, TO_TIMESTAMP('2018-06-01 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-06-05 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 2);
INSERT INTO OrdemCompra VALUES (00013, 11111, 2000, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00026, 11111, 2000, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00027, 11111, 3000, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00014, 11111, 2223, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00015, 11111, 2332, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 2);
INSERT INTO OrdemCompra VALUES (00016, 11111, 2211, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00017, 11111, 4000, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00018, 11111, 4223, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 2);
INSERT INTO OrdemCompra VALUES (00019, 11111, 4332, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 2);
INSERT INTO OrdemCompra VALUES (00020, 11111, 4211, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 10000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00021, 11111, 4311, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 10000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00022, 11111, 5000, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 2);
INSERT INTO OrdemCompra VALUES (00023, 11111, 5223, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 2);
INSERT INTO OrdemCompra VALUES (00024, 11111, 5332, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 10000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);
INSERT INTO OrdemCompra VALUES (00025, 11111, 5211, TO_TIMESTAMP('2018-03-01 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 1000.00, TO_DATE('2018-05-10 09:00:00', 'YYYY-MM-DD HH:MI:SS'), 3);


-- Fill OrdemCompraProduto table --

INSERT INTO OrdemCompraProduto VALUES (00001, 00001, 10001, 10, 0.25);
INSERT INTO OrdemCompraProduto VALUES (00001, 00002, 10002, 10, 0.25);
INSERT INTO OrdemCompraProduto VALUES (00001, 00003, 20003, 10, 0.25);

INSERT INTO OrdemCompraProduto VALUES (00002, 00001, 40002,  5, 0.50);
INSERT INTO OrdemCompraProduto VALUES (00002, 00002, 40001,  5, 0.50);

INSERT INTO OrdemCompraProduto VALUES (00003, 00001, 10003, 15, 0.35);

INSERT INTO OrdemCompraProduto VALUES (00004, 00001, 10004, 30, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00005, 00001, 10005, 40, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00006, 00001, 10006, 50, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00007, 00001, 10006,  7, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00008, 00001, 10006,  8, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00009, 00001, 10006, 25, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00010, 00001, 10006, 90, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00011, 00001, 10006, 100, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00012, 00001, 10006, 102, 0.75);

INSERT INTO OrdemCompraProduto VALUES (00013, 00001, 10006, 503, 0.85);

INSERT INTO OrdemCompraProduto VALUES (00014, 00001, 10006, 965, 0.9);

INSERT INTO OrdemCompraProduto VALUES (00015, 00001, 10006, 50, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00016, 00001, 10006,  7, 0.10);
INSERT INTO OrdemCompraProduto VALUES (00016, 00002, 90001,  7, 0.10);
INSERT INTO OrdemCompraProduto VALUES (00016, 00003, 20004,  7, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00017, 00001, 10006,  8, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00018, 00001, 10006, 25, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00019, 00001, 10006, 90, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00020, 00001, 10006, 100, 0.10);

INSERT INTO OrdemCompraProduto VALUES (00021, 00001, 10006, 102, 0.75);

INSERT INTO OrdemCompraProduto VALUES (00022, 00001, 10006, 503, 0.85);

INSERT INTO OrdemCompraProduto VALUES (00023, 00001, 10006, 965, 0.9);

INSERT INTO OrdemCompraProduto VALUES (00024, 00001, 10006, 503, 0.85);

INSERT INTO OrdemCompraProduto VALUES (00025, 00001, 10006, 965, 0.9);
