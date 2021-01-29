#Grão = Mês

# locação de veiculos por mês
create view locperiodo as select 
	veic.modelo as Modelo,
	 MONTH(loc.datalocacao) as Mes,
	 YEAR(loc.datalocacao) as Ano,
	 COUNT(*) as Total from fatolocacao loc
 join dimensaoveiculo veic on (loc.chaveveiculo = veic.idveiculo) GROUP BY veic.modelo , MONTH(loc.datalocacao) , YEAR(loc.datalocacao)  order by Total desc;

select * from locperiodo;


#Despachantes com mais veículos locados
create view locdespachante as select
	 desp.nome as Nome,
	 veic.modelo as Modelo,
	 MONTH(loc.datalocacao) as Mes,
	 YEAR(loc.datalocacao) as Ano,
	 COUNT(*) as Total from fatolocacao loc
 join dimensaoveiculo veic on (loc.chaveveiculo = veic.idveiculo)
 join dimensaodespachante desp on (loc.chavedespachante = desp.iddespachante)
 GROUP BY desp.nome , veic.modelo , MONTH(loc.datalocacao) , YEAR(loc.datalocacao) order by Total desc;


#Faturamento por período
create view locfaturamento as select
	 MONTH(loc.datalocacao) as Mes,
	 YEAR(loc.datalocacao) as Ano,
	 SUM(loc.total) as Total from fatolocacao loc
 GROUP BY MONTH(loc.datalocacao) , YEAR(loc.datalocacao) order by mes, ano;

select * from locfaturamento;

#Clientes locaram quantas vezes no mês
create view locclientes as select
	 cli.nome as Nome,
	 MONTH(loc.datalocacao) as Mes,
	 YEAR(loc.datalocacao) as Ano,
	 COUNT(*) as Total from fatolocacao loc
 join dimensaocliente cli on (cli.idcliente = loc.chavecliente)
 GROUP BY cli.nome , MONTH(loc.datalocacao) , YEAR(loc.datalocacao) order by cli.nome;






