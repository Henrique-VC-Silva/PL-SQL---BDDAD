--alínea a)
select avg(e.salario_semanal), e.salario_semanal*58 from empregado e, armazem a
where e.cod_armazem = a.cod_armazem
and a.nome = 'Parafusos'

--alínea d)
select count(*) from ordemcompra oc where oc.cod_empregado = (select e.cod_empregado from empregado e, armazem a where e.cod_armazem = a.cod_armazem and a.cidade = 'Porto')
and oc.estado = 2
and oc.data_compra is between to_timestamp('2018-03-01', 'YYYY-MM-DD') and to_timestamp('2018-03-01', 'YYYY-MM-DD')

--alínea g)
select ap.corredor from armazemproduto ap, produto p, ordemcompraproduto ocp
where ap.cod_produto = p.cod_produto
and p.cod_produto = ocp.cod_produto
and ocp.desconto_pedido > 20
and ocp.nr_ordem in (select nr_ordem from OrdemCompra where estado = 2)
