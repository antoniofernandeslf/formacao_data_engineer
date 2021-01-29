with S as (
	select * from Relacional.Despachantes order by IDDespachante
),
UPD as (
	update Dimensional.DimensaoDespachante T
	set DataFimValidade = current_date
	from S
	where (T.IDDespachante = S.IDDespachante and DataFimValidade is null) and
		(T.Nome <> S.Nome or T.Status <> S.Status or T.Filial <> S.Filial)
	returning T.IDDespachante
)
insert into Dimensional.DimensaoDespachante(IDDespachante, Nome, Status, Filial, DataInicioValidade, DataFimValidade) select IDDespachante, Nome, Status, Filial, current_date, null from S where
S.IDDespachante in(select IDDespachante from UPD) or S.IDDespachante not in 
(select IDDespachante from Dimensional.DimensaoDespachante);
