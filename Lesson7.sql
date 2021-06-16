/*1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.*/

select u.* from users u, orders o where o.user_id = u.id;  

/*2. Выведите список товаров products и разделов catalogs, который соответствует товару.*/

select p.name, p.price, c.name catalog_name from products p, catalogs c where p.catalog_id = c.id;

/*3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов.*/

select f.id, 
	(select c1.name from cities c1 where f.`from` = c1.label) as fl_from,
	(select c2.name from cities c2 where f.`to` = c2.label) as fl_to
from flights f;

/*или так можно*/

select f.id, c1.name fl_from, c2.name fl_to
from flights f, cities c1, cities c2
where f.`from` = c1.label and f.`to` = c2.label