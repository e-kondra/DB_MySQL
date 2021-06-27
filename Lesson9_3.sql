/*1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
   С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
   с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/ 

drop function if exists shop.hello;

delimiter //

CREATE FUNCTION shop.hello()
RETURNS varchar(255) DETERMINISTIC
begin
	
	declare v_hour int;
	
	set v_hour = date_format(now(), '%H'); 

	if v_hour >= 6 and v_hour < 12 then 
		return 'Good morning';
	elseif v_hour >= 12 and v_hour < 18 then 
		return 'Good day';
	elseif v_hour >= 0 and v_hour < 6 then 
		return 'Good night';
	else 
		return 'Good evening';
	end if;
end//

select shop.hello() as hello;
delimiter ;

/*2.В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
 Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
 При попытке присвоить полям NULL-значение необходимо отменить операцию.*/

drop trigger if exists products_name_descr;

delimiter //

create trigger products_name_descr before insert on products
for each row 
begin 
	if new.name is null and new.description is null then
		signal sqlstate '45000' set message_text = 'Insert canсeled: Fields name or description should be filled';
	end if;
end//

delimiter ;

drop trigger if exists products_name_descr_upd;

delimiter //

create trigger products_name_descr_upd before update on products
for each row 
begin 
	if new.name is null and new.description is null then
		signal sqlstate '45000' set message_text = 'Update canceled: Fields name or description should be filled';
	end if;
end//

delimiter ;



