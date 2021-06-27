/*1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.*/
start transaction;

-- У меня в БД sample и shop разные таблицы users: в БД sample только два столбца id и name, поэтому я переношу только name
set @temp_var := (select u.name from shop.users u where u.id = 1);

insert into sample.users values (null, @temp_var);

delete from shop.users u where u.id = 1;

commit;

/*2. Создайте представление, которое выводит название name товарной позиции из таблицы products 
и соответствующее название каталога name из таблицы catalogs.*/

create or replace view prod_catalog as
select p.name as product, c.name as `catalog`
from shop.products p
join shop.catalogs c on p.catalog_id = c.id 
;

select * from shop.prod_catalog;




