--alínea b) Filipe
select * from OrdemCompra where estado = 3 and cod_fornecedor <> (select cod_fornecedor 
from FornecedorProduto 
where desconto = (
select max(desconto)
from FornecedorProduto
))

--alínea e) Filipe

select nome 
from empregado 
where cod_supervisor IS NOT NULL and (select count(*) from ordemcompra where empregado.cod_empregado = ordemcompra.cod_empregado) >
(select max(count(*)) 
from ordemcompra 
where cod_empregado in (select cod_empregado from empregado where cod_supervisor IS NULL and salario_semanal*4 > 1000 and salario_semanal*4 < 3000) 
group by cod_empregado)

--alinea h) Filipe
select cod_produto, sum(quantidade_solicitada) as MENSAL_VOLUME, EXTRACT(year from data_compra) as YEAR , EXTRACT(month from data_compra) as MONTH
from ordemcompra 
inner join ordemcompraproduto on ordemcompra.nr_ordem = ordemcompra.nr_ordem
where EXTRACT(year from data_compra) = 2018 and cod_produto in (select distinct cod_produto from armazemproduto 
                        where stock / stock_minimo >= 1.5)
group by cod_produto, EXTRACT(year from data_compra), EXTRACT(month from data_compra)
order by cod_produto, EXTRACT(year from data_compra), EXTRACT(month from data_compra)

-- alínea j) Filipe
select ordemcompratintas.totaltintas / ordemcompratotal.total * 100
from (select count(*) as total from ordemcompra where ordemcompra.cod_empregado = 1223) ordemcompratotal, 
     (select count(*) as totaltintas from ordemcompra ordemcompratintas
     inner join empregado on empregado.cod_empregado = ordemcompratintas.cod_empregado and cod_armazem = 44444 and ordemcompratintas.cod_empregado = 1223
     where estado = 3 and valor_total >= 5000 and valor_total <= 10000) ordemcompratintas
	 

