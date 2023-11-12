select id, nombre, 
	case when gastos <= 5000 then 'x' end as '0-5000',
	case when gastos <= 10000 then 'x' end as '5001-1000' from departamento;
    
select nombre, count(case when gasto < 10000 then 1 end) from departamento;