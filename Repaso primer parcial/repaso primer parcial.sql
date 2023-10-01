create database repaso_primer_parcial;
use repaso_primer_parcial;

drop table equipo;
create table equipo(
	id_equipo int auto_increment primary key, 
    nombre varchar(50) unique
);

alter table jugador drop constraint FK_id_equipo;
delete from equipo where id_equipo = 2;
delete from equipo;
insert into equipo(nombre) 
	values ('Boca'), ("River"), ("Canillitas");

insert into equipo(nombre) 
	values ('Independiente'), ("Racing"), ("Chacarita"), ("Aldosivi"), ("Alvarado");
    
select * from equipo;

alter table jugador add constraint FK_id_equipo 
	foreign key (id_equipo) references equipo(id_equipo);

drop table jugador;
create table jugador(
	id_jugador int,
    nombre varchar(50),
    nacionalidad varchar(50),
    id_equipo int
);

alter table jugador modify column id_jugador int auto_increment,
add constraint PK_id_jugador primary key (id_jugador),
					add constraint FK_id_equipo foreign key (id_equipo) references equipo(id_equipo);

-- c. Insertar una fila en la tabla “Jugador”
insert into jugador(nombre, nacionalidad, id_equipo) 
	values ('Juan', 'Chile', 2), ("Pepe", "Argentina", 3);
    
insert into jugador(nombre, nacionalidad, id_equipo) 
	values ('Alex', 'Chile', 2), ("Lucas", "Argentina", 2);

-- registrar jugadores sin asignarle equipos
insert into jugador(nombre, nacionalidad) 
	values ('Jorge', 'Africa'), ("Mario", "Bolivia");
    
select * from jugador;
select * from jugador j inner join equipo e on j.id_equipo = e.id_equipo;

drop table partido;
-- a. Crear la tabla Partidos. Sin restricciones.
create table partido(
	id_partido int,
    id_equipo1 int,
    id_equipo2 int,
	fecha date
);

-- b. Modificar la tabla “partidos” para agregar todas las constraints.
-- agrego restricciones a la tabla partido
alter table partido add constraint PK_id_partido primary key (id_partido),
					add constraint FK_id_equipo1 foreign key (id_equipo1) references equipo(id_equipo),
                    add constraint FK_id_equipo2 foreign key (id_equipo2) references equipo(id_equipo);
alter table partido modify column id_partido int auto_increment;                    

insert into partido(id_equipo1, id_equipo2, fecha)
	values (1,2, "2023-02-03"), (1,3, "2023-02-10"), (3,2, "2023-02-03"),
			(3,1, "2022-09-29"), (1,1, "2022-12-10"); 

insert into partido(id_equipo1, id_equipo2, fecha)
	values (6,7, "2022-12-10"), (5,4, "2022-12-10"), (1,8, "2022-12-10"),
			(2,7, "2022-12-10"), (6,2, "2022-12-10");

select * from partido;


-- PUNTO D TODAS LAS POSIBLES SOLUCIONES
			-- FORMA 1
-- primero averiguo que id tiene el equipo Canillitas
select id_equipo from equipo where nombre = 'Canillitas';

-- ahora se el id de Canillitas y primero borro los jugadores que pertenecen al equipo
delete from jugador where id_equipo = 3;

-- como la tabla partido tiene referencia a la tabla equipo 
-- dropeo su constraint para borrar el equipo
alter table partido drop constraint FK_id_equipo1, drop constraint FK_id_equipo2;

-- borro el equipo que queria borrar 
delete from equipo where id_equipo = 3;

-- checkeo que se haya borrado
select * from equipo;
select * from jugador j inner join equipo e on j.id_equipo = e.id_equipo;


			-- FORMA  2
delete j from jugador j left join equipo e on j.id_jugador = e.id_equipo
	where e.nombre like 'Canillitas';
select * from jugador;
select * from equipo;
select * from jugador j inner join equipo e on j.id_equipo = e.id_equipo;
delete from equipo where nombre like  'Canillitas';

-- forma 3 // esta funciono
delete from jugador where id_equipo = (select id_equipo from equipo where nombre = 'Canillitas');
delete from equipo where nombre like  'Canillitas';



-- PUNTO E
-- e. Eliminar todas las fechas de los partidos que se juegan el ‘29/09/2022’
update partido set fecha = null where fecha = '2022-09-29';
select * from partido;


-- PUNTO F
-- f. Listar los jugadores que no están asignados a ningún equipo.
select * from jugador j where id_equipo is null;

-- PUNTO G
-- g. Listar los nombres de los equipos juegan el ‘10/12/2022’
select distinct e.nombre from equipo e left join partido p on p.id_equipo1 = e.id_equipo 
	or p.id_equipo2 = e.id_equipo where p.fecha like '2022-12-10';


-- PUNTO H
-- h. Listar el nombre de los jugadores de equipo “River” que juegan el ‘10/12/2022’
select distinct j.nombre from jugador j
	left join equipo e on j.id_equipo = e.id_equipo
    left join partido p on p.id_equipo1 = e.id_equipo or p.id_equipo2 = e.id_equipo
    where e.nombre = 'River' and p.fecha = '2022-12-10';

# delete from equipo where nombre = 'Canillitas' on cascade;

alter table partido modify column id_partido int auto_increment
