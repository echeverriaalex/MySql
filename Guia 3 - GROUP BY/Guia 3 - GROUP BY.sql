create database Guia3_GROUPBY;
use Guia3_GROUPBY;

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


INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

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

# Consultas sobre una tabla
# 1. Lista el primer apellido de todos los empleados.
select * from empleado order by apellido1 asc;

# 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido1 from empleados;


3. Lista todas las columnas de la tabla empleado.
4. Lista el nombre y los apellidos de todos los empleados.
5. Lista el código de los departamentos de los empleados que aparecen en la
tabla empleado.
6. Lista el código de los departamentos de los empleados que aparecen en la
tabla empleado, eliminando los códigos que aparecen repetidos.
7. Lista el nombre y apellidos de los empleados en una única columna.
8. Lista el nombre y apellidos de los empleados en una única columna,
convirtiendo todos los caracteres en mayúscula.
9. Lista el nombre y apellidos de los empleados en una única columna,
convirtiendo todos los caracteres en minúscula.
10.Lista el código de los empleados junto al nif, pero el nif deberá aparecer en
dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
11. Lista el nombre de cada departamento y el valor del presupuesto actual del
que dispone. Para calcular este dato tendrá que restar al valor del
presupuesto inicial (columna presupuesto) los gastos que se han generado
(columna gastos). Tenga en cuenta que en algunos casos pueden existir
valores negativos. Utilice un alias apropiado para la nueva columna columna
que está calculando.
12.Lista el nombre de los departamentos y el valor del presupuesto actual
ordenado de forma ascendente.
13.Lista el nombre de todos los departamentos ordenados de forma ascendente.
14.Lista el nombre de todos los departamentos ordenados de forma
descendente.
15.Lista los apellidos y el nombre de todos los empleados, ordenados de forma
alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su
nombre.
16.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
que tienen mayor presupuesto.
17.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
que tienen menor presupuesto.
18.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
tienen mayor gasto.
19.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
tienen menor gasto.
20.Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La
tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las
columnas de la tabla empleado.
21.Devuelve una lista con el nombre de los departamentos y el presupuesto, de
aquellos que tienen un presupuesto mayor o igual a 150000 euros.
22.Devuelve una lista con el nombre de los departamentos y el gasto, de
aquellos que tienen menos de 5000 euros de gastos.
23.Devuelve una lista con el nombre de los departamentos y el presupuesto, de
aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar
el operador BETWEEN.
24.Devuelve una lista con el nombre de los departamentos que no tienen un
presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
25.Devuelve una lista con el nombre de los departamentos que tienen un
presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
26.Devuelve una lista con el nombre de los departamentos que no tienen un
presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
27.Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean mayores que
el presupuesto del que disponen.
28.Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean menores que
el presupuesto del que disponen.
29.Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean iguales al
presupuesto del que disponen.
30.Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
31.Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
32.Lista todos los datos de los empleados cuyo segundo apellido sea López.
33.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o
Moreno. Sin utilizar el operador IN.
34.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o
Moreno. Utilizando el operador IN.
35.Lista los nombres, apellidos y nif de los empleados que trabajan en el
departamento 3.
36.Lista los nombres, apellidos y nif de los empleados que trabajan en los
departamentos 2, 4 o 5





