-- c) Henrique -Liste o nome dos armazéns que têm em stock todos os produtos que foram
-- 				fornecidos ao armazém que possui o maior número de empregados.
		
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
                        )
						
-- f) Henrique -Liste o código do armazém, o número do corredor e o número da prateleira dos
-- 				produtos que foram menos vezes comprados.

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

-- i) Henrique -Liste as ordens de compra no estado satisfeito, entre o m�s de Junho e Agosto de
-- 				2018, cuja hora de elabora��o � inferior �s 10 horas da manh� e com uma diferen�a
-- 				entre a data de compra e a data da entrega superior a 10 dias.

select * 
from ordemcompra
where ordemcompra.estado = 3 and EXTRACT(MONTH from data_compra) in (06, 07, 08) and EXTRACT(HOUR from data_compra) < 10 
and EXTRACT(day from (select(data_entrega-data_compra)from dual)) > 10
    