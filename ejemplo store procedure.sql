

delimiter $$
create procedure insertfactura(
	fecha date,
    idCliente int, importe decimal(10,2),
    categoria int
)
begin
	insert into factura(fecha, idCliente, importe, categoria) value (fecha, idCliente, categoria);
    
    update cliente set saldo = saldo + importe
    where idCliente = idCliente;

end $$
delimiter ;

drop database if exists test_procedures;
create database test_procedures;
use test_procedures;
-- Otro ejemplo de procedure YA FUNCIONA

drop table if exists categoria;
create table categoria(
	nombre varchar(20),
    idCategoria int auto_increment primary key 
);

-- PARA QUE ANDE EL SELECT ID Y TODO LO DEL PRECEDURE TIENE QUE ESTAR AUTO INCREMENT CON PRIMARY KEY
drop procedure if exists insertarCategoria;
delimiter $$
create procedure insertarCategoria
(	in p_nombre varchar(20),
	out p_idCat int
)
begin
	insert into categoria(nombre) values (p_nombre);
    set p_idCat = last_insert_id();
end $$
delimiter ;

call insertarCategoria('AAA', @idCat);
select @idCat;

call insertarCategoria('BBB', @idCat);
select @idCat;

call insertarCategoria('CCC', @idCat);
select @idCat;

select * from categoria;

