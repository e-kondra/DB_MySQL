/*Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»*/
/*1.Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем */

UPDATE users 
SET created_at = now(), updated_at = now();

/*2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
 Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.*/

update users
set created_at = str_to_date(created_at, '%d.%c.%Y %k:%i'),
updated_at = str_to_date(updated_at, '%d.%c.%Y %k:%i');

alter table users change
created_at created_at datetime;

alter table users change
updated_at updated_at datetime;

commit;

/*3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
 если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом,
 чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, 
 после всех */

select * from storehouses_products order by if (value > 0, 1, 0) desc, value;

/*4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
 Месяцы заданы в виде списка английских названий (may, august)*/

select * from users
where date_format(birthday_at, '%M') in ('May', 'August');

/*5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
 Отсортируйте записи в порядке, заданном в списке IN.*/

select * from catalogs WHERE id in (5, 1, 2) order by if (id = 5, 0, if (id = 1, 1, 2));

/*Практическое задание теме «Агрегация данных»*/
/*1. Подсчитайте средний возраст пользователей в таблице users.*/

select avg(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) from users;

/*2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/

select date_format(date_format(birthday_at, '2021-%c-%d'), '%W')  as week_day ,count(*) as count from users group by week_day;
