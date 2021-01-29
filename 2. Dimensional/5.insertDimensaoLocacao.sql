
insert into Dimensional.FatoLocacao(ChaveDespachante, ChaveCliente, ChaveVeiculo, ChaveTempo, DataLocacao, DataEntrega, Total)
select
	D.ChaveDespachante,
	C.ChaveCliente,
	V.ChaveVeiculo,
	T.ChaveTempo,
	L.DataLocacao,
	L.DataEntrega,
	L.Total
from Relacional.Locacao L
inner join Dimensional.DimensaoDespachante D
	on L.IDDespachante = D.IDDespachante and D.DataFimValidade is null
inner join Dimensional.DimensaoCliente C
	on L.IDCliente = C.IDCliente and C.DataFimValidade is null
inner join Dimensional.DimensaoVeiculo V
	on V.IDVeiculo = L.IDVeiculo and V.DataFimValidade is null
inner join Dimensional.DimensaoTempo T
	on L.DataLocacao = T.Data;


