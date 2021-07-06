
/*1.Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs
  помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name..*/
use shop;

create table logs (
	primary_key bigint unsigned,
	name_content char(250),
	name_table char(50),
	created_at datetime
);


delimiter //

create trigger push_users after insert on users
for each row
begin 
	insert into logs (primary_key, name_content, name_table, created_at) 
	values (new.id, new.name, 'users', now());
end // 


create trigger push_catalogs after insert on catalogs
for each row
begin 
	insert into logs (primary_key, name_content, name_table, created_at) 
	values (new.id, new.name, 'catalogs', now());
end // 


create trigger push_products after insert on products
for each row
begin 
	insert into logs (primary_key, name_content, name_table, created_at) 
	values (new.id, new.name, 'products', now());
end //

