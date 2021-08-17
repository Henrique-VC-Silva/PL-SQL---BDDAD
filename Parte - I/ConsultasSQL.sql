--alínea a) Salvador
select avg(e.salario_semanal), e.salario_semanal*58 from empregado e, armazem a
where e.cod_armazem = a.cod_armazem
and a.nome = 'Parafusos'

--alínea b) Filipe
select * from OrdemCompra where estado = 3 and cod_fornecedor <> (select cod_fornecedor
from FornecedorProduto
where desconto = (
select max(desconto)
from FornecedorProduto
))

--alínea c) Henrique
select nome
from armazem 
where cod_armazem in (  select cod_armazem 
                        from armazemproduto 
                        where cod_produto in (select cod_produto
                                              from armazemproduto
                                              where cod_armazem IN (select cod_armazem
                                                                    from empregado
                                                                    group by cod_armazem
                                                                    having count(*) = (select max(count(*)) from empregado group by cod_armazem)
                                                                    )
                                                ) AND armazemproduto.stock > 0

--alínea d) Salvador
select count(*) from ordemcompra oc where oc.cod_empregado = (select e.cod_empregado from empregado e, armazem a where e.cod_armazem = a.cod_armazem and a.cidade = 'Porto')
and oc.estado = 2
and oc.data_compra is between to_timestamp('2018-03-01', 'YYYY-MM-DD') and to_timestamp('2018-03-01', 'YYYY-MM-DD')

--alínea e) Filipe
select nome
from empregado
where cod_supervisor IS NOT NULL and (select count(*) from ordemcompra where empregado.cod_empregado = ordemcompra.cod_empregado) >
(select max(count(*))
from ordemcompra
where cod_empregado in (select cod_empregado from empregado where cod_supervisor IS NULL and salario_semanal*4 > 1000 and salario_semanal*4 < 3000)
group by cod_empregado)

--alínea f) Henrique
select cod_armazem, corredor, prateleira
from armazemproduto
where cod_produto in (   select cod_produto
                        from (  select cod_produto, count(*)
                                from ordemcompraproduto
                                group by cod_produto
                                having count(*) in (select count(*) from ordemcompraproduto group by cod_produto)
                                order by count(*) asc
                                )
                        where rownum <= 5
                    )


--alínea g) Salvador
select ap.corredor from armazemproduto ap, produto p, ordemcompraproduto ocp
where ap.cod_produto = p.cod_produto
and p.cod_produto = ocp.cod_produto
and ocp.desconto_pedido > 20
and ocp.nr_ordem in (select nr_ordem from OrdemCompra where estado = 2)

--alinea h) Filipe
select cod_produto, sum(quantidade_solicitada) as MENSAL_VOLUME, EXTRACT(year from data_compra) as YEAR , EXTRACT(month from data_compra) as MONTH
from ordemcompra
inner join ordemcompraproduto on ordemcompra.nr_ordem = ordemcompra.nr_ordem
where EXTRACT(year from data_compra) = 2018 and cod_produto in (select distinct cod_produto from armazemproduto
                        where stock / stock_minimo >= 1.5)
group by cod_produto, EXTRACT(year from data_compra), EXTRACT(month from data_compra)
order by cod_produto, EXTRACT(year from data_compra), EXTRACT(month from data_compra)

--alínea i) Henrique
select * 
from ordemcompra
where ordemcompra.estado = 3 and EXTRACT(MONTH from data_compra) in (06, 07, 08) and EXTRACT(HOUR from data_compra) < 10 
and EXTRACT(day from (select(data_entrega-data_compra)from dual)) > 10
    

-- alínea j) Filipe
select ordemcompratintas.totaltintas / ordemcompratotal.total * 100
from (select count(*) as total from ordemcompra where ordemcompra.cod_empregado = 1223) ordemcompratotal,
     (select count(*) as totaltintas from ordemcompra ordemcompratintas
     inner join empregado on empregado.cod_empregado = ordemcompratintas.cod_empregado and cod_armazem = 44444 and ordemcompratintas.cod_empregado = 1223
     where estado = 3 and valor_total >= 5000 and valor_total <= 10000) ordemcompratintas
