create database empresa_alquiler_autos;
use empresa_alquiler_autos;

drop table if exists Cliente;
create table if not exists Cliente(
    nombre varchar(20),
	apellido varchar(20),
    direccion varchar(20),
    dni varchar(20) unique,
    telefono varchar(20),
    
    # Distintas formas de crear una Primary Key
    id_cliente int primary key auto_increment
    -- id_cliente int auto_increment,
    -- constraint pk_id_cliente primary key (id_cliente) 
);

insert into Cliente(nombre, apellido, direccion, dni, telefono)
	values 	("Sara", "Varela", "Benito Lynch 4803", "123", "223456789"),
			("Roberto", "Lencinas", "Benito Lynch 4803", "1234", "2234567890"),
			("Alex", "Echeverria", "San miguel 321", "12345", "22345678910"),
            ("Maira", "Echeverria", "San miguel 321", "123456", "22345678911"),
            ("Gustavo", "Echeverria", "San miguel 321", "1234567", "22345678912"),
            ("Laura", "Lencinas", "San miguel 321", "12345678", "22345678913");

insert into Cliente(nombre, apellido, direccion, dni, telefono)
	values 	("Walter", "Lencinas", "Costa 123", "2222", "223789"),
			("Juan", "Lencinas", "Benito Lynch 4803", "33333", "2237890"),
			("Gustavo", "Lencinas", "Griego 456", "4444", "22378910"),
            ("Umma", "Lencinas", "Benito Lynch 4803", "5555", "2238911"),
            ("Isabella", "Lencinas", "Benito Lynch 4803", "66666", "2238912"),
            ("Franchesca", "Lencinas", "Benito Lynch 4803", "7777", "22378913");
            
            
select * from Cliente;
delete from Cliente;

drop table if exists Reserva;
create table if not exists Reserva(
    id_reserva int primary key auto_increment,
    id_cliente int not null,
    id_cliente_aval int,
    precio_total decimal(10,2),
    fechaFin date,
    fechaInicio date,
    
    # Distintas formas de crear una Foreign Key
    constraint fk_id_cliente_aval foreign  key (id_cliente_aval) references Cliente(id_cliente),
    constraint fk_id_cliente foreign  key (id_cliente) references Cliente(id_cliente)
    -- foreign  key fk_id_cliente(id_cliente) references Cliente(id_cliente)
);

insert into Reserva(id_cliente, id_cliente_aval, precio_total, fechaFin, fechaInicio)
	values 	(1, 1, 5000, "2023-01-01", "2023-01-10"),
			(2, 2, 6500, "2023-02-01", "2023-02-10"),
			(3, 3, 8000, "2023-03-01", "2023-03-10"),
			(4, 4, 10000, "2023-04-01", "2023-04-10"),
			(5, 5, 5700, "2023-05-01", "2023-05-10"),
            (6, 6, 9500, "2023-06-01", "2023-06-10");
            
select * from Reserva;
select * from Cliente c inner join Reserva r on c.id_cliente = r.id_cliente;

drop table if exists Marca;
create table if not exists Marca(
	id_marca int primary key auto_increment,
    nombre varchar(20)
);

insert into Marca(nombre)
	values ("Chevrolet"), ("Ford"), ("Dodge"), ("Renault"), ("GMC"), ("Toyota"), 
			("Honda"), ("Mazda"), ("Mitsubishi"), ("Acura"), ("Subaru"), ("Nissan");
select * from Marca;

drop table if exists Auto;
create table if not exists Auto(
	color varchar(20),
    id_auto int primary key auto_increment,
    id_marca int,
    foreign key fk_id_marca(id_marca) references Marca(id_marca),
    matricula varchar(20) unique,
    modelo varchar(20),
    precio_x_hora decimal(10,2)
);

delete from Auto;
insert into Auto (color, id_marca, matricula, modelo, precio_x_hora)
	values 	("Negro", 7, "AAA 111", "Civic", 500), ("Verde", 2, "BBB 222", "Falcon", 230), 
			("Bordo", 4, "CCC 333", "Clio Mio", 140), ("Negro", 2, "MMM 999", "Ranger", 300), 
            ("Rojo", 9, "EEE 555", "Evolution 9", 400), ("Rojo", 8, "FFF 567", "RX 8", 460),
            ("Blanco", 8, "ZZZ 666", "RX 7", 460), ("Azul", 8, "FFF 123", "Speed3", 460), 
            ("Negro", 6, "FGH 789", "Supra", 480), ("Bordo", 4, "ZXS 333", "Sandero", 240);
            
select * from Auto ;

select * from Auto where id_marca = 8 ;

select * from Auto group by id_marca;

select * from Auto a inner join Marca m on a.id_marca = m.id_marca
	group by m.nombre having count(*) > 1;

select * from Auto a left join Marca m on a.id_marca = m.id_marca
	group by m.nombre having count(*) > 1;
    
select * from Auto a left join Marca m on a.id_marca = m.id_marca;



create table if not exists DetalleReserva(
	id_auto int unique,
    id_detalle_reserva int primary key auto_increment,
    id_reserva int unique,
    litros decimal(10,2),
    
    foreign  key fk_id_auto(id_auto) reference Auto(id_auto)
);


