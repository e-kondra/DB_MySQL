/* 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.*/
select u.* 
from users u
JOIN orders o on o.user_id = u.id; 

/*2.Выведите список товаров products и разделов catalogs, который соответствует товару.*/

select p.name, p.price, c.name catalog_name 
from products p
join catalogs c on p.catalog_id = c.id;

/*3.(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 Поля from, to и label содержат английские названия городов, поле name — русское. 
 Выведите список рейсов flights с русскими названиями городов.*/

select f.id, 
	(select c1.name from cities c1 where f.`from` = c1.label) as fl_from,
	(select c2.name from cities c2 where f.`to` = c2.label) as fl_to
from flights f;

/*или так*/

select f.id, c1.name fl_from, c2.name fl_to
from flights f
join cities c1 on f.`from` = c1.label
join cities c2 on f.`to` = c2.label
;
