drop database  if exists modelo_segundo_parcial;
create database  if not exists modelo_segundo_parcial;
use modelo_segundo_parcial;

drop table if exists turno;
create table if not exists turno(
    nombre varchar(20),
    idTurno int auto_increment primary key
);

insert into turno(nombre) values ('mañana'), ('tarde'), ('noche');
select * from turno;

drop table if exists empleado;
create table if not exists empleado(
	legajo int auto_increment primary key,
    apellido varchar(20),
    nombre varchar(20),
    idTurno int, 
    foreign key FK_idTurno (idTurno) references turno (idTurno),
    sueldoBasico decimal (10,2)
);

delete from empleado;
select * from empleado;
insert into empleado(apellido, nombre, idTurno, sueldoBasico)
	values 	('Echeverria', 'Alex', 1, 200),
			('Echeverria', 'Maira', 2, 250),
            ('Echeverria', 'Gustavo', 3, 400),
            ('Lencinas', 'Laura', 1, 500),
            ('Lencinas', 'Juan', 2, 360),
            ('Lencinas', 'Walter', 3, 480),
            ('Lencinas', 'Gustavo', 1, 260),
            ('Varela', 'Sara', 2, 800),
            ('Cinalli', 'Ayelen', 3, 630),
            ('Lencinas', 'Umma', 1, 570),
            ('Lencinas', 'Franchesca', 2, 450),
            ('Lencinas', 'Isabella', 3, 370),
            ('Lencinas', 'Celina', 1, 390),
            ('Lencinas', 'Zoe', 2, 200),
            ('Lencinas', 'Ambar', 3, 240);
select * from empleado;

drop table if exists recibo;
create table if not exists recibo(
    nroRecibo int primary key auto_increment,
    legajo int,
    fecha date,
    foreign key FK_legajo (legajo) references empleado (legajo)
);

delete from recibo;
insert into recibo(legajo, fecha) 
	values 	(1, '2021-1-4'), 
			(null, '2021-2-4'), 
            (3, '2021-1-4'),
			(null, '2021-1-18'),
            (5, '2021-6-14'),
            (null, '2021-1-18'),
            (7, '2021-7-15'),
            (null, '2021-2-2'),
            (9, '2021-4-4'),
            (null, '2021-2-15'),
            (11, '2021-5-4'),
            (12, '2021-2-15'),
            (13, '2021-3-20'),
            (14, '2021-3-20'),
            (15, '2021-3-20');
select * from recibo;            

-- Listar el total de sueldos x turno pagados en el año 2021 
-- mostrar unicamente turnos que tuvieron mas de 5 empleados
select sum(sueldoBasico), t.nombre from empleado e 
	inner join turno t on e.idTurno = t.idTurno
    inner join recibo r on r.legajo = e.legajo
    where year(r.fecha) = 2021
    group by e.idTurno having count(*) > 5; 
-- conut con * cuenta todas las filas, si punto un campo especifico no va a contar los que tengan como valor null


-- Listar empleado que cobra un sueldo inferior al promedio de sueldos de su mismo turno
select * from empleado e1 where e.sueldoBasico < 
	(select avg(sueldoBasico) from empleado e2 where e1.idTurno = e2.idTurno);


-- Crear un procedimiento que tome por parametro una fecha de inicio y una fecha de fin
-- y devuelva todos los empleados indicando cuales cobraron sueldo con el formato
-- 	legajo, cobrosueldo
-- 	1001		si
-- 	1002		no
drop procedure if exists empSueldos;
delimiter $$
create procedure empSueldos(
	fechaI date,
    fechaF date
)
begin
	select e.legajo, case when r.fecha between fechaI and FechaF then 'si'else  'no' end as Cobro_sueldo
		from empleado e left join recibo r on r.legajo = e.legajo where r.fecha between fechaI and FechaF;
end $$
delimiter ;

call empSueldos('2021-1-1', '2021-12-31');

-- MODELO ANTERIOR DE CASE PARA GUIARME 
select id, nombre, 
	case when gastos <= 5000 then 'x' end as '0-5000',
	case when gastos <= 10000 then 'x' end as '5001-1000' from departamento;
	select nombre, count(case when gasto < 10000 then 1 end) from departamento;
    
    
