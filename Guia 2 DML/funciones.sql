select * from departamento;

select nombre, codigo, sum(gastos) as Suma_Gastos from departamento
	where gastos > 500;
    
select sum(gastos) as Suma_Gastos, max(gastos), min(gastos), cast(avg(gastos) as decimal(10,2)), count(ifnull(gastos,0)) 
	from departamento
	where gastos > 500;
    
select codigo_departamento, count(*) as cantidad from empleados 
	where codigo_departamento is not null group by codigo_departamento; 


 
select ifnull(d,nombre, 'sin departamento'), count(*) as cantidad from empleados e
	inner join depatamento d on e.codigo_departamento = d.codigo
	group by e.codigo_departamento having count(*) >=4;    
    
-- Ejemplos Subconsulta
-- Subconsulta devuelve un unico valor

select id, (select nombredepartamento from departamento where departamentoid =5) as nombre
	from (select x from departmaneto where gastos > 1000) departamento;
    
select id, (select nombredepartamento from departamento where departamentoid =5) as nombre
	from empleado;
    
select id, (select nombredepartamento from departamento where departamentoid =5) as nombre
	from empleado e where idempleado in (select id from departamentos d where d.id = e.departamentoId);
    
select avg(gastos) from departamento; -- las funciones de agregado sum avg max having no puede ir en where 

select * from departamento where gastos > (select avg(gastos) from departamento);

select * from departamento d1 where gastos > (select avg(gastos) 
	from departamento d2 where d1.presupuesto = d2.presupuesto );
    
select * from departamento d1 where gastos in (select gastos 
	from departamento where presupuesto > 15000 );
    
select codigo, nombre, (select nombre from departamento d where d.codigo = e.codigodepartamnebti) from empleaod e;

select codigo, nombre from empleado e, (select * from departamento d where gastos is not null) where d.codigo = e.codigodepartamnebti;
    
select id, dep.gastos from empleado
		where gastos > any(select gastos from departamento where presupuesto > 1000); 

select id, dep.gastos from empleado
		where gastos > all(select gastos from departamento where presupuesto > 1000);     
    
select id, (selectnombredepartamento from departamento where departamentoid =5) as nombre
	from empleado o (select x from departmaneto where gastos > 1000) departamento
	where idEmpleado =, <, >, != (select id )
    o 
    where idEmpleado in (select id from ... ) -- admite una lista de valores solo con una columna
    o
    where idEmpleado in (select id from departamentos where gastos > 1000) -- admite una lista de valores solo con una columna
    o
    where idEmpleado exists (select 1 from ... ) -- el 1 puede ser cualquier cosa, devuelve 1 o null, es como usar un boolean
    
