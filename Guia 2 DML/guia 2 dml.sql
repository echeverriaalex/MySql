create database guia2_dml;
use guia2_dml;

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

delete from departamento where codigo = 2;
select * from departamento;

create table empleado (
	codigo int (10),
    nif varchar(9),
    nombre varchar(100),
    apellido1 varchar(100),
    apellido2 varchar(100),
    codigo_departamento int (10)
);

alter table empleado add constraint foreign key FK_codigoDepartamento (codigo_departamento) references departamento(codigo);

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

-- 1. Lista el primer apellido de todos los empleados.
select apellido1 from empleado;

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido1 from empleado;

-- 3. Lista todas las columnas de la tabla empleado.
select * from empleado;
select codigo, nif, nombre, apellido1, apellido2, codigo_departamento from empleado;

-- 4. Lista el nombre y los apellidos de todos los empleados.
select nombre, apellido1, apellido2 from empleado;

-- 5. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.
select codigo_departamento from empleado;

-- 6. Lista el código de los departamentos de los empleados que aparecen en la
-- tabla empleado, eliminando los códigos que aparecen repetidos.
select distinct codigo_departamento from empleado;

-- 7. Lista el nombre y apellidos de los empleados en una única columna.
-- si los apellidos son opcionales no requeridos se usa este 
select concat(nombre, ' ', ifnull(apellido1,''), ' ',  ifnull(apellido2,'')) as 'Nombre y Apellido' from empleado;
-- si unicamente el apellido2 no es requeridos se usa este 
select concat(nombre, ' ', apellido1, ' ',  ifnull(apellido2,'')) as 'Nombre y Apellido' from empleado;

-- 8. Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en mayúscula.
-- si los apellidos son opcionales no requeridos se usa este 
select upper(concat(nombre, ' ', ifnull(apellido1,''), ' ',  ifnull(apellido2,''))) as 'Nombre y Apellido' from empleado;
-- si unicamente el apellido2 no es requeridos se usa este 
select upper(concat(nombre, ' ', apellido1, ' ',  ifnull(apellido2,''))) as 'Nombre y Apellido' from empleado;

-- 9. Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en minúscula.
select lower(concat(nombre, ' ', ifnull(apellido1,''), ' ',  ifnull(apellido2,''))) as 'Nombre y Apellido' from empleado;
-- si unicamente el apellido2 no es requeridos se usa este 
select lower(concat(nombre, ' ', apellido1, ' ',  ifnull(apellido2,''))) as 'Nombre y Apellido' from empleado;

-- 10.Lista el código de los empleados junto al nif, pero el nif deberá aparecer en
-- dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra. 
-- trabajar con substring de 32481596F tiene que quedar 6 en una columna y F en otra
select * from empleado;
select codigo, substring(nif, 7, 1) as 'Nif number', substring(nif, 8, 1) as 'Nif letter' from empleado;

-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. 
-- Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) 
-- los gastos que se han generado(columna gastos). Tenga en cuenta que en algunos casos pueden existir
-- valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
select nombre, presupuesto-gasto as presupuesto from departamento;

-- 12.Lista el nombre de los departamentos y el valor del presupuesto actual
-- ordenado de forma ascendente.
select nombre, presupuesto from departamento order by presupuesto asc;

-- 13.Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamento order by nombre asc;

-- 14.Lista el nombre de todos los departamentos ordenados de forma descendente.
select nombre from departamento order by nombre desc;

-- 15.Lista los apellidos y el nombre de todos los empleados, ordenados de forma
-- alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
select apellido1, apellido2, nombre from empleado order by  apellido1, apellido2, nombre desc;

-- 16.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
-- que tienen mayor presupuesto.
select nombre, presupuesto from departamento order by presupuesto desc limit 3;

-- 17.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
-- que tienen menor presupuesto.
select nombre, presupuesto from departamento order by presupuesto asc limit 3;

-- 18.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
select nombre, gasto from departamento order by gasto desc limit 2;

-- 19.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
select nombre, gasto from departamento order by gasto asc limit 2;

-- 20.Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La
-- tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las
-- columnas de la tabla empleado. usando offset
select * from empleado e limit 5;
select * from empleado e limit 5 offset 2;

-- 21.Devuelve una lista con el nombre de los departamentos y el presupuesto, de
-- aquellos que tienen un presupuesto mayor o igual a 150000 euros.
select nombre, presupuesto from departamento where presupuesto >= 150000;

-- 22.Devuelve una lista con el nombre de los departamentos y el gasto, de
-- aquellos que tienen menos de 5000 euros de gastos.
select nombre, gasto from departamento where gasto < 5000;

-- 23.Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que 
-- tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto >= 100000 and presupuesto <= 200000;

-- 24.Devuelve una lista con el nombre de los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto < 100000 or presupuesto >= 200000;

-- 25.Devuelve una lista con el nombre de los departamentos que tienen un
-- presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto between 100000 and 200000;

-- 26.Devuelve una lista con el nombre de los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto not between 100000 and 200000;

-- 27.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos 
-- departamentos donde los gastos sean mayores que el presupuesto del que disponen.
select nombre, gasto, presupuesto from departamento where gasto > presupuesto;

-- 28.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos 
-- departamentos donde los gastos sean menores que el presupuesto del que disponen.
select nombre, gasto, presupuesto from departamento where gasto < presupuesto;

-- 29.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos 
-- departamentos donde los gastos sean iguales al presupuesto del que disponen.
select nombre, gasto, presupuesto from departamento where gasto = presupuesto;

-- 30.Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
select * from empleado where apellido2 is null;

-- 31.Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
select * from empleado where apellido2 is not null;

-- 32.Lista todos los datos de los empleados cuyo segundo apellido sea López.
select * from empleado where apellido2 like 'López';

-- 33.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o
-- Moreno. Sin utilizar el operador IN.
select * from empleado where apellido2 like 'Díaz' or apellido2 like 'Moreno';

-- 34.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o
-- Moreno. Utilizando el operador IN.
select * from empleado where apellido2 in ('Díaz','Moreno');

-- 35.Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
select nombre, apellido1, apellido2, nif from empleado where codigo_departamento = 3;

-- 36.Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
select nombre, apellido1, apellido2, nif from empleado where codigo_departamento in (2,4,5);



-- Consultas multitabla (Composición interna)
-- 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select * from empleado e inner join departamento d on e.codigo_departamento = d.codigo; 

-- 2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. 
-- Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo 
-- lugar por los apellidos y el nombre de los empleados.
# primero se ordena alfabeticamente nombre del departamento, en caso de que se repita ordena por el primer apellido
# si pasa otra vez que se repida ordena por el segundo apellido y si se repite nuevamente ordena por nombre y asi sucesivamente
# por cada atributo que indique el orden, en este paso llega a bajar hasta el apellido 2
select * from empleado e inner join departamento d on e.codigo_departamento = d.codigo 
	order by d.nombre asc, e.apellido1 asc, e.apellido2 asc, e.nombre asc;

-- 3. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
select distinct d.codigo, d.nombre from departamento d inner join empleado e on d.codigo = e.codigo_departamento; 

-- 4. Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual del que dispone, solamente 
-- de aquellos departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular restando al valor del presupuesto 
-- inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
select d.codigo, d.nombre, presupuesto - gasto from departamento d inner join empleado e on d.codigo = e.codigo_departamento;

-- 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
select d.nombre from departamento d inner join empleado e on d.codigo = e.codigo_departamento where nif like '38382980M';

-- 6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select * from empleado;
select d.nombre from departamento d inner join empleado e on d.codigo = e.codigo_departamento 
	where e.nombre like 'Pepe' and e.apellido1 like 'Ruiz' and e.apellido2 like 'Santana';

-- 7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select * from empleado e inner join departamento d on e.codigo_departamento = d.codigo where d.nombre = 'I+D' order by e.nombre asc;

-- 8. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. 
-- Ordena el resultado alfabéticamente.
select * from empleado e inner join departamento d on e.codigo_departamento = d.codigo 
	where d.nombre in ('Sistemas', 'I+D', 'Contabilidad') order by e.nombre asc;

-- 9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
select e.nombre from empleado e inner join departamento d on e.codigo_departamento = d.codigo 
	where presupuesto not between 100000 and 200000;

-- 10.Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. 
-- Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
select distinct d.nombre from departamento d inner join empleado e on d.codigo = e.codigo_departamento where e.apellido2 is null;


-- Consultas multitabla (Composición externa) Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
-- Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
select * from empleado e left join departamento d on e.codigo_departamento = d.codigo;

-- 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen
-- ningún departamento asociado.
select * from empleado e left join departamento d on e.codigo_departamento = d.codigo where e.codigo_departamento is null;

-- 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no
-- tienen ningún empleado asociado.
select * from empleado e right join departamento d on e.codigo_departamento = d.codigo where e.codigo_departamento is null;

-- 4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. El listado debe 
-- incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen
-- ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
select * from empleado e 
	left join departamento d on e.codigo_departamento = d.codigo 
    where e.codigo_departamento is null or e.codigo_departamento is not null 
    order by d.nombre asc;


-- 5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no 
-- tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
























-- ACA ESTA TODA LA EXPLICACION DE LOS JOINS
select e.codigo, e.nombre, d.nombre as 'Departamento'
	from empleado e inner join departamento d on e.codigo_departamento = d.codigo;
    
select e.codigo as 'Codigo empleado', e.nombre as 'Nombre empleado', d.nombre as 'Departamento'
	from empleado e inner join departamento d on e.codigo_departamento = d.codigo;  
    
select e.codigo as 'Codigo empleado', e.nombre as 'Nombre empleado', d.codigo as 'Codigo departamento', d.nombre as 'Departamento'
	from empleado e inner join departamento d on e.codigo_departamento = d.codigo;  

# Devuelve todos los empleados los que coinciden con un departamento me muestra el departamento 
# y si el empleado no tiene departamento me muestra esa parte null
# A (empleado) left join B (departamento) segun el orden que lo escribi
select e.codigo as 'Codigo empleado', e.nombre as 'Nombre empleado', d.codigo as 'Codigo departamento', d.nombre as 'Departamento'
	from empleado e left join departamento d on e.codigo_departamento = d.codigo;  
    
    
# Devuelve todos los departamentos que coinciden con un empleado me muestra el departamento 
# y si el departamento no tiene empleados me muestra esa parte null
# A (empleado) left join B (departamento) segun el orden que lo escribi
select e.codigo as 'Codigo empleado', e.nombre as 'Nombre empleado', d.codigo as 'Codigo departamento', d.nombre as 'Departamento'
	from empleado e right join departamento d on e.codigo_departamento = d.codigo;  
    
    
# Muestro solo los empleados que no pertenecen a un departamento solo A traigo, para esto
# tengo que poner el where
select e.codigo as 'Codigo empleado', e.nombre as 'Nombre empleado', d.codigo as 'Codigo departamento', d.nombre as 'Departamento'
	from empleado e left join departamento d on e.codigo_departamento = d.codigo where d.codigo is null;


select e.codigo as 'Codigo empleado', e.nombre as 'Nombre empleado', d.codigo as 'Codigo departamento', d.nombre as 'Departamento'
	from departamento d left join empleado e  on e.codigo_departamento = d.codigo;

# Traigo los departamentos que no tienen empleados asignados
select e.codigo as 'Codigo empleado', e.nombre as 'Nombre empleado', d.codigo as 'Codigo departamento', d.nombre as 'Departamento'
	from departamento d left join empleado e  on e.codigo_departamento = d.codigo where e.codigo_departamento is null;

-- esto simula el full outer join (mostrar todo los que coincidad y los que no coincidan de cada tabla)
select e.codigo as 'Codigo empleado', e.nombre as 'Nombre empleado', d.codigo as 'Codigo departamento', d.nombre as 'Departamento'
	from departamento d 
    left join empleado e  on e.codigo_departamento = d.codigo 
    right join departamento d  on d.codigo = e.codigo_departamento;
    
    
SELECT * FROM t1
LEFT JOIN t2 ON t1.id = t2.id
UNION ALL
SELECT * FROM t1
RIGHT JOIN t2 ON t1.id = t2.id
WHERE t1.id IS NULL