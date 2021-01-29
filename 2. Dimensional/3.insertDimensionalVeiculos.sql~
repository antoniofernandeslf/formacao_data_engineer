with R as (
	select * from Relacional.Veiculos order by IDVeiculo
),
UPD as (
	update Dimensional.DimensaoVeiculo D
	set DataFimValidade = current_date
	from R
	where (D.IDVeiculo = R.IDVeiculo and DataFimValidade is null) and (D.DataAquisicao <> R.DataAquisicao
		or D.Ano <> R.Ano or D.Modelo <> R.Modelo or D.Placa <> R.Placa or D.Status <> R.Status or
			D.PrecoDiaria <> R.PrecoDiaria)
	returning D.IDVeiculo
)
insert into Dimensional.DimensaoVeiculo(IDVeiculo, DataAquisicao, Ano, Modelo, Placa, Status, PrecoDiaria, DataInicioValidade, DataFimValidade) select IDVeiculo, DataAquisicao, Ano, Modelo, Placa, Status, PrecoDiaria, current_date, null from R
where R.IDVeiculo in(select IDVeiculo from UPD) or R.IDVeiculo not in (select IDVeiculo 
from Dimensional.DimensaoVeiculo);
