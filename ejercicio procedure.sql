drop database if exists proveedor;
create database proveedor;
use proveedor;

create table piezas(
	codigo_pieza int primary key auto_increment,
    nombre varchar(20)
);

drop table if exists proveedor;
create table proveedor(
	id_proveedor int primary key auto_increment,
    nombre varchar(50)
);

insert into proveedor(nombre)
	values 	("Jose Gonzalez"), ("Mariano Perez"), ("Alex Nahuel Echeverria"), ("Maira Ailen Echeverria"), 
			("Gustavo Raul Echeverria"), ("Laura Soledad Lencinas"), ("Sara Varela"), 
			("Florencia Gonzalez"), ("Federico Perez");
select * from proveedor;

drop table if exists suministra;
create table suministra(
	codigo_pieza int,
    id_proveedor int,
    precio float,
	constraint fk_id_pieza foreign key (codigo_pieza) references piezas(codigo_pieza),
    constraint fk_id_provvedir foreign key (id_proveedor) references proveedor(id_proveedor)    
);

drop procedure if exists agregar_pieza2;
delimiter $$
create procedure agregar_pieza(in Pnombre varchar(20), in Pprecio int, out id_pieza int)
begin	
	 select @id_proveedor:= id_proveedor from proveedor where nombre like "Gonzalez";
     #SELECT @id := dept_id FROM departamentos WHERE departamento = 'Personal';
    insert into piezas(nombre) values (Pnombre);
    set id_pieza = last_insert_id();    
    
    #insert into suministra(codigo_pieza, id_proveedor, precio) values (id_pieza, 700 , Pprecio); 
end $$
delimiter ;





# 1- Crear un procedimiento almacenado para dar de alta una nueva pieza, 
# se debe agregar la pieza y el precio de la misma Realice la llamada al procedimiento

drop procedure if exists agregar_pieza;
delimiter $$
create procedure agregar_pieza(in Pnombre varchar(20), in Pprecio int)
begin
    insert into piezas(nombre) values (Pnombre);
    #set id_pieza = last_insert_id();    
    select @id_pieza:= last_insert_id();     
    insert into suministra(codigo_pieza, precio) values (@id_pieza, Pprecio); 
end $$
delimiter ;

call agregar_pieza("destornillador", 1100);
call agregar_pieza("cadena", 2000);
call agregar_pieza("mezcladora", 30000);
call agregar_pieza("gabinete", 400);
call agregar_pieza("monitor", 1200);
call agregar_pieza("auriculares", 300);


drop procedure if exists agregar_pieza_proveedor;
delimiter $$
create procedure agregar_pieza_proveedor(in Pnombre varchar(20), in Pprecio int)
begin	
	select @id_proveedor:= id_proveedor from proveedor where nombre like "Gonzalez";
	#SELECT @id := dept_id FROM departamentos WHERE departamento = 'Personal';
    
    insert into piezas(nombre) values (Pnombre);
    
    #set id_pieza = last_insert_id(); 
    
    select @id_pieza:= last_insert_id();     
    
    insert into suministra(codigo_pieza, id_proveedor, precio) values (@id_pieza, @id_proveedor, Pprecio); 
end $$
delimiter ;

#call agregar_pieza("Tornillo", 100, @id_pieza);
call agregar_pieza_proveedor("Tornillo", 100);




select * from piezas;
select * from proveedor;
select * from suministra;


# 2- Mostrar todos los proveedores que tengan en el nombre la palabra "Gonzalez"
	# La mas conveniente es esta por si el nombre tiene muchas palabras
	select * from proveedor where nombre like "%Gonzalez%";
    select * from proveedor where nombre like '%Echeverria%';

	# Esta es basica solo busca que el nombre tenga unicamente Gonzalez ni una palabra mas
	select * from proveedor where nombre = "Gonzalez";

# 3- Mostrar el nombre del proveedor, nombre de pieza y precio de todas la piezas. 
# mostrar todos los proveedores, si no suministra piezas, mostrar en su lugar "sin piezas"
select pro.nombre as "Proveedor" , pi.nombre, su.precio,
	case when count(*)>0 then concat("") 
    else "Sin piezas" end as "Suministra"
	from suministra su inner join proveedor pro on pro.id_proveedor = su.id_proveedor
	inner join piezas pi on pi.codigo_pieza = su.codigo_pieza;
    
    
select pro.nombre as "Proveedor" , pi.nombre, su.precio,
	case when count(*)>0 then concat("")
		 when count(*)>0 then "Sin piezas" end as "Suministra"
	from proveedor pro left join suministra su on pro.id_proveedor = su.id_proveedor
	left join piezas pi on pi.codigo_pieza = su.codigo_pieza;
    
    
    
select pro.nombre, pi.nombre, su.precio ,
	case when count(*) > 0 then "" else "Sin piezas" end as "Suministra"
	from proveedor pro inner join suministra su on pro.id_proveedor = su.id_proveedor
	inner join piezas pi on pi.codigo_pieza = su.codigo_pieza;








# Mostrar las piezas mas caras de cada proveedor (sin subconsultas)




# Mostrar la cantidad de piezas suministradas por cada proveedor, pero solamente 
# de aquellos que suministran mas de 100 piezas (sin subconsultas)




# Mostrar el nombre de los proveedores que suministran piezas con precio mayor a la media de todas las piezas (con subconsultas)