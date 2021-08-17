-- 1.
create or replace function func_stock_artigo_armazem(p_cod_produto produto.cod_produto%type,
                                                    p_cod_armazem armazem.cod_armazem%type)
  return number is v_stock ProdutoZonaFisica.stock%type;
begin
  select sum(pzf.stock) into v_stock
  from ProdutoZonaFisica pzf
  where pzf.cod_produto = p_cod_produto
  and cod_armazem = p_cod_armazem
  and cod_zona_fisica = (select cod_zona_fisica
                        from zonafisica
                        where cod_armazem = p_cod_armazem)

return v_stock
exception
 when no_data_found then return null
end
-- 2.
create or replace function func_razao_veiculo_transporte(p_id_armazem armazem.cod_armazem%type, data_inicio DATE, data_fim DATE)
  return number is razao number;

begin
  select count(*) into n_enc
  from GuiaTransporte gt, GuiaSaidaProduto gsp
  where gsp.cod_armazem = p_id_armazem



-- 3.
create or replace function func_zona_maior_armazenamento(p_cod_armazem armazem.cod_armazem%type)
  return number is v_zona zonafisica.cod_zona_fisica%type;
begin
select zf.cod_zona_fisica into v_zona
  from ZonaFisica zf, ProdutoZonaFisica pzf
  where zf.cod_armazem = p_cod_armazem
  and zf.cod_zona_fisica = (select pzf.cod_zona_fisica
                            from ProdutoZonaFisica pzf
                            where pzf.stock = (select stock
                                              from ProdutoZonaFisica
                                              where stock = Max(stock)
                                              and stock > 0))

return v_zona
exception
 when no_data_found then return null
end

-- 4.

-- 5.

-- 6.
create or replace procedure proc_atualizar_tipo_cliente() is
begin
  p_cod_cliente cliente.cod_cliente%type;
  v_v_negocios pagamento.valor%type;

  select cod_cliente into p_cod_cliente from cliente
  where data_atualizacao + interval '12' MONTH < systimestamp

  select SUM(p.valor) into v_v_negocios
  from Pagamento p, Cliente c
  where p.cod_cliente = p_cod_cliente
  and p.data > c.data_atualizacao

  if v_v_negocios < 30000 THEN
    update cliente set data_atualizacao = systimestamp where cod_cliente = p_cod_cliente
    update cliente set cod_tipo = (select cod_tipo from tipocliente where volume_maximo < v_v_negocios)
  end if
  if v_v_negocios > 50000 THEN
  update cliente set data_atualizacao = systimestamp where cod_cliente = p_cod_cliente
  update cliente set cod_tipo = (select cod_tipo from tipocliente where volume_maximo < v_v_negocios)
  else
      update cliente set data_atualizacao = systimestamp where cod_cliente = p_cod_cliente
      update cliente set cod_tipo = (select cod_tipo from tipocliente where volume_maximo < v_v_negocios)
end proc_atualizar_tipo_cliente

-- 7.

-- 8.
create or replace trigger trg_viagem_impedir_atribuicao_veiculo
before INSERT OR update on Viagem
for each row as
declare 
  n_viagens number;
  estado number;
  ex_erro exception;
begin

  select estado_servico into estado
  from Veiculo car
  where car.matricula:=new.matricula;
  
  select count(*) into n_viagens
  from Viagem vj
  where vj.data := trunc(new.data);

  if (estado = 1 OR n_viagens > 3) THEN
    raise ex_erro;
  end if;
  
exception
  when ex_erro THEN
    raise_application_error(-20009, 'Veiculo indisponivel')
	
end trg_viagem_impedir_atribuicao_veiculo;

-- 9.
create or replace trigger trg_guia_saida_atualizar_stock
before DELETE OR update on GuiaSaidaProduto
for each rowtype
declare
  v_stock GuiaSaidaProduto.quantidade%type;
  v_stock_minimo ArmazemProduto.stock_minimo%type
begin
  select stock_minimo into v_stock_minimo
  from ArmazemProduto
  where cod_produto = :old.cod_produto
  and cod_armazem = :old.cod_armazem

  v_stock := func_stock_artigo_armazem(:old.cod_produto, :old.cod_produto);

  IF (v_stock - v_stock_minimo) > :old.quantidade THEN
      update ProdutoZonaFisica
        set stock = stock - :old.quantidade
        where cod_produto =:old.cod_armazem
        and cod_zona_fisica =:old.cod_zona_fisica
        and cod_armazem =:old.cod_armazem
  END IF

exception
  when ex_erro THEN
    raise_application_error(-20006, 'Stock insuficiente')
end trg_guia_saida_atualizar_stock;
