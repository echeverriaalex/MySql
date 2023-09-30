create database repaso_primer_parcial;
use repaso_primer_parcial;

create table partido(
	id_partido int auto_increment,
    id_equipo1 int,
    id_equipo2 int,
	fecha date
);

alter table partido add constraint FK_id_equipo1 foreign key (id_equipo1) references equipo(id_equipo),
					add constraint PK_id_partido primary key (id_partido),
                    add constraint FK_id_equipo2 foreign key (id_equipo2) references equipo(id_equipo);
                    
create table equipo(
	id_equipo int primary key, 
    nombre varchar(50) unique
);


insert into jugador(nombre, nacionalidad, id_equipo) values ('Juan', 'Chile', 2);


-- punto d todas las posibles soluciones

-- forma 1
select id_equipo from equipo where nombre = 'Canillitas';
delete from jugador where id_equipo = 2;
delete from equipo where id_equipo = 2;

-- forma 2
delete jugador from jugador j left join equipo e on j.id_jugador = e.id_equipo
	where e.nombre like  'Canillitas';    
delete from equipo where nombre like  'Canillitas';

-- forma 3
delete from jugador where id_equipo = (select id_equipo from equipo where nombre = 'Canillitas');




-- punto e

update partidos set fecha = null where fecha = '2022-09-29';


-- punto f
select * from jugador j where id_equipo is null;

-- punto g
select e.nombre from equipo e left join partido p on p.id_equipo1 = e.id_equipo 
	or p.id_equipo2 = e.id_equipo where p.fecha like '2022-12-10';


-- punto h
select j.nombre from jugador j
	left join equipo e on j.id_equipo = e.id_equipo
    left join partido p on p.id_equipo1 = e.id_equipo or p.id_equipo2 = e.id_equipo
    where e.nombre like('river') and p.fecha = '2022-12-10';

# delete from equipo where nombre = 'Canillitas' on cascade;

