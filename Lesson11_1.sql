/*Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products 
в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа 
и содержимое поля name.*/

use shop;

create table shop.logs(
id SERIAL,
date_time datetime,
table_name varchar(50),
tables_row_id BIGINT,
tables_row_name varchar(255)
) ENGINE=ARCHIVE;

drop trigger if exists log_create_users;
delimiter //
create trigger log_create_users
after insert on users
for each row 
begin 
	insert into logs values (null, now(), 'users', new.id, new.name);
end//
delimiter ;

drop trigger if exists log_create_catalogs;
delimiter //
create trigger log_create_catalogs
after insert on catalogs
for each row 
begin 
	insert into logs values (null, now(), 'catalogs', new.id, new.name);
end//
delimiter ;

drop trigger if exists log_create_products;
delimiter //
create trigger log_create_products
after insert on products
for each row 
begin 
	insert into logs values (null, now(), 'products', new.id, new.name);
end//
delimiter ;
