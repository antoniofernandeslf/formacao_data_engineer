with S as (
	select * from Relacional.Clientes order by IDCliente
),
UPD as (
	update Dimensional.DimensaoCliente T
	set DataFimValidade = current_date
	from S
	where (T.IDCliente = S.IDCliente and DataFimValidade is null) and 
		(T.DataValidadeCNH <> S.DataValidadeCNH or T.Nome <> S.Nome or T.Telefone <> S.Telefone or
			T.Status <> S.Status) 
	returning T.IDCliente
)
insert into Dimensional.DimensaoCliente(IDCliente, CPF, CNH, DataValidadeCNH, Nome, DataCadastro, DataNascimento, Telefone, Status, DataInicioValidade, DataFimValidade) select IDCliente, CPF, CNH, DataValidadeCNH, Nome, DataCadastro, DataNascimento, Telefone, Status, current_date, null from S 
where S.IDCliente in(select IDCliente from UPD) or
	S.IDCliente not in (select IDCliente from Dimensional.DimensaoCliente);
