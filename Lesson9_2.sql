/*Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть доступны 
только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop. */
use shop; 

create user shop identified with sha256_password by 'pass1';
create user shop_read identified with sha256_password by 'pass2';

grant all on shop.* to shop; 
grant select on shop.* to shop_read; 

show grants for shop
show grants for shop_read


/*(по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ, 
 имя пользователя и его пароль. Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. 
 Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из
  представления username.*/

create view username as select a.id, a.name from shop.accounts a;

grant select on shop.username, usage on shop.accounts to user_read identified with sha256_password by 'SomePass';