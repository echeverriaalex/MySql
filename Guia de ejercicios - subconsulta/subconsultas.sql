create database subconsultas;
use subconsultas;

create table departamento (
	codigo int (10),
    nombre varchar(100),
    presupuesto double,
    gasto double
);

alter table departamento add constraint primary key PK_codigo(codigo);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

select * from departamento;

delete from departamento where codigo = 2;
select * from departamento;

drop table empleado;
create table empleado (
	codigo int (10) primary key auto_increment,
    nif varchar(9),
    nombre varchar(100),
    apellido1 varchar(100),
    apellido2 varchar(100),
    codigo_departamento int (10)
);

alter table empleado add constraint foreign key FK_codigoDepartamento (codigo_departamento) references departamento(codigo);

alter table empleado add constraint primary key PK_codigo(codigo);
alter table empleado modify column codigo int auto_increment;

alter table empleado modify column codigo int auto_increment;



INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',NULL);

select * from empleado;


-- 1.2.7.1 Con operadores básicos de comparación

-- 1. Devuelve un listado con todos los empleados que tiene el departamento de
-- Sistemas. (Sin utilizar INNER JOIN).
select * from empleado 
	where departamento =  (select nombre from departamento d where d.nombre = 'Sistemas'); 
    
-- 2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad
-- que tiene asignada.



-- 3. Devuelve el nombre del departamento con menor presupuesto y la cantidad
-- que tiene asignada.
select nombre, presupuesto, min(presupuesto) from departamento;


-- 1.2.7.2 Subconsultas con ALL y ANY
-- 4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad
-- que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.
select nombre, presupuesto  from departamento where presupuesto >= all (select presupuesto from departamento);

-- 5. Devuelve el nombre del departamento con menor presupuesto y la cantidad
-- que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.
select nombre, presupuesto  from departamento where presupuesto <= all (select presupuesto from departamento);

-- 6. Devuelve los nombres de los departamentos que tienen empleados
-- asociados. (Utilizando ALL o ANY).
select d.nombre from departamento d where codigo = any(select codigo_departamento from empleado e where d.codigo = e.codigo_departamento);

-- 7. Devuelve los nombres de los departamentos que no tienen empleados
-- asociados. (Utilizando ALL o ANY).
select d.nombre from departamento d where codigo != all(select codigo_departamento from empleado e where e.codigo_departamento is not null);

-- 1.2.7.3 Subconsultas con IN y NOT IN
-- 8. Devuelve los nombres de los departamentos que tienen empleados
-- asociados. (Utilizando IN o NOT IN).
select d.nombre from departamento d where codigo in (select codigo_departamento from empleado e where e.codigo_departamento);


-- 9. Devuelve los nombres de los departamentos que no tienen empleados
-- asociados. (Utilizando IN o NOT IN).
select nombre from departamento d where codigo not in (select codigo_departamento from empleado e where e.codigo_departamento);

-- 1.2.7.4 Subconsultas con EXISTS y NOT EXISTS
-- 10.Devuelve los nombres de los departamentos que tienen empleados
-- asociados. (Utilizando EXISTS o NOT EXISTS).
 select nombre from departamento d where exists (select codigo_departamento from empleado e where e.codigo_departamento);

-- 11. Devuelve los nombres de los departamentos que tienen empleados
-- asociados. (Utilizando EXISTS o NOT EXISTS).
select nombre from departamento d where not exists (select codigo_departamento from empleado e where e.codigo_departamento);


select nombre from departamento d inner join empleado e on d.codigo = d.codigo_departamento;


 -- Ejemplos y ejercicios con case
select codigo, nombre, 
	case when gasto <= 5000 then 'x' end as '0-5000',
	case when gasto <= 10000 then 'x' end as '5001-1000' from departamento;
    
    
select nombre, 
	count(case when gasto < 10000 then 1 end) 
    from departamento group by nombre;

select nombre, 
	case when gasto < 10000 then 'mayor'
	when gasto > 10000 and gasto < 70000 then 'medio'
	else 'mayor' end as 'tipogasto'
	from  departamento;
    
-- update set gasto = case ... (todo lo que quiera poner):


 -- Ejemplo de store procedure
 drop procedure  insertarEmpleado;
delimiter $$
create procedure insertarEmpleado(
	in p_nombre varchar(50), -- in es parametro entrada por defecto
    p_apellido1 varchar(50),
    p_apellido2 varchar(50),
    p_nif varchar(50),
    p_codigo_departamento int,
    out lastId int -- parametro de salida o retorno
)
begin
	insert into empleado(nombre, apellido1, apellido2, nif, codigo_departamento) 
		values (p_nombre, p_apellido1, p_apellido2, p_nif, p_codigo_departamento);
        set lastId = last_insert_id(); -- usar esto
        -- select id from empleado order by id desc limit 1; // evitar esto usando last_insert_id()
end $$
delimiter ;

call insertarEmpleado('Alex', 'Echeverria', 'Lencinas', 'sdfdf232', 2, @lastInsertId);
		select @lastInsertId;

select * from empleado;








