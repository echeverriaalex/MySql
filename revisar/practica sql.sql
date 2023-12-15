create database pedidos;
use pedidos;

create table cliente(
	nombre varchar(40),
    id_cliente int,
    primary key (id_cliente)
);

delete from cliente;
insert into cliente (nombre, id_cliente) 
	values ('Jorge Serrano', 1),
			('Alex Echeverria', 2),
            ('Maira Echeverria', 3);
select * from cliente;

create table producto(
	descripcion varchar(40),
    precio float,
    id_producto int,
    primary key (id_producto)
);

delete from producto;
insert into producto (descripcion, precio, id_producto) 
	values 	('Coca cola 2L', 500, 1),
			('Fanta 2L', 540, 2),
            ('Fernet Branca 1L', 3500, 3),
            ('Marolio tallarin', 200, 4),
            ('Campari ', 4500, 5);
select * from producto;

drop table pedido;
create table pedido(
	id_pedido int,
    id_cliente int,
    id_lista_producto int    
    /* primary key (id_pedido) */
);

delete from pedido;
insert into pedido (id_pedido, id_cliente, id_lista_producto)
	values (1, 1, 1), (2, 1, 2), (2, 2, 2), (1, 2, 1);

drop table lista_producto;
create table lista_producto(
	id_pedido int,
	id_cliente int,
    id_lista_producto int,
    id_producto int
);

delete from lista_producto;
insert into lista_producto (id_pedido, id_cliente, id_lista_producto, id_producto)
	values (1,1, 1, 1), (1, 1, 1, 2),  (2, 1, 1, 3), (2, 2, 2, 4), (2, 2, 2, 5);



select c.nombre, p.id_pedido, pr.descripcion
	from cliente c inner join
		 pedido p on c.id_cliente = p.id_cliente inner join
         lista_producto lp on lp.id_pedido = p.id_pedido inner join
         producto pr on pr.id_producto = lp.id_producto where c.nombre like "Alex%";

select c.nombre, p.id_pedido, pr.descripcion
	from cliente c inner join
		 pedido p on c.id_cliente = p.id_cliente inner join
         lista_producto lp on lp.id_pedido = p.id_pedido inner join
         producto pr on pr.id_producto = lp.id_producto;

select * from lista_producto;

/*
select * from cliente c inner join pedido p on c.id_cliente = p.id_cliente
						inner join lista_producto lp on lp.id_lista_producto = p.id_lista_producto
                        inner join producto pr on pr.id_producto = lp.id_lista_producto;
*/


