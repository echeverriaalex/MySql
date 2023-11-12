create database resolucion_primer_parcial;
use resolucion_primer_parcial;

-- a este lo resolvi bien
select apellido, nombre
	from cliente cl left join compras co on co.idCliente = cl.id
    where co.idCliente is null;
    
    
select co.fecha, cl.apellido, cl.nombre
	from cliente cl inner join compra co  on cl.id = co.idCliente
    where co.fecha between ('20220101' and '20221231') order by total desc limit 5;
				-- o year(fecha) = '2022' 
                -- o fecha >= '20220101' and fecha <='20221231 23:59:59'
   
    
    
select co.id, co.id, cl.apellido, cl.nombre
	from clientes cl left join compra co on cl.id = co.idCliente
    where apellido like 'a%';
    