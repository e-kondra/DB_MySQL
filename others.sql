
-- ПРЕДСТАВЛЕНИЯ
-- Все заказы (основное рабочее представление)
create or replace
view vw_full_orders_info as
select
	p.short_name as name,
	concat( ab.name, ' ', a.model) as auto,
	date_format(o.date_begin, '%d.%m.%Y') as date_begin,
	date_format(o.date_end , '%d.%m.%Y') as date_end,
	o.status as status,
	o.full_summa as summa
from
	tetraedri.orders o
join persons p on
	o.person_id = p.id
left join automobile a on
	o.automobile_id = a.id
left join auto_brands ab on
	a.brand_id = ab.id
where
	p.type_person not in ('worker', 'partner')
	order by o.date_begin desc ;

-- Выборка по клиентам и суммам их заказов
create or replace 
view vw_orders_details as
select 
	p.full_name, 
	sum(oi.price_for_person) as details_sum,
	sum(oi.price_of_work) as work_sum, 
	sum(oi.price_of_work + oi.price_for_person ) as full_sum,
	avg(oi.price_of_work + oi.price_for_person ) as avg_sum
from 
	orders o
join orders_items oi ON 
	oi.order_id = o.id 
join persons p on 
	o.person_id = p.id 
group by 
	o.person_id 
order by 
	full_sum desc;

-- Прибыль по месяцам в разрезе сотрудник/запчасти/работа
create or replace 
view vw_months_profit as
select 
	date_format(o.date_end, '%M') as ord_month,
	round(sum(oi.price_for_person),2) as details_cost, 
	round(sum(oi.price_for_person)-sum(oi.parts_cost),2) as details_profit, 
	sum(oi.price_of_work) as work_cost, 
	get_profit(p.id, sum(oi.price_of_work)) as work_profit, 
	p.short_name as worker, 
	round((sum(oi.price_for_person)-sum(oi.parts_cost)) + get_profit(p.id, sum(oi.price_of_work)),2) as profit
from 
	orders o 
join orders_items oi ON 
	oi.order_id = o.id
join persons p on 
	oi.worker_id = p.id 
group by 
	ord_month, worker;


-- ХРАНИМЫЕ ФУНКЦИИ И ПРОЦЕДУРЫ
DROP FUNCTION IF EXISTS tetraedri.get_profit;

DELIMITER $$
$$
-- возвращает сумму (прибыли), умноженную на коэффициент по id-сотруднику
work_profit CREATE FUNCTION tetraedri.get_profit(worker_id BIGINT, summa FLOAT)
RETURNS FLOAT deterministic
begin
	case worker_id
		when 18
			then return summa;
		when 19 -- единственный приходящий сотрудник, получаюший 50% от суммы работы
			then return summa*0.5;
	end case;	
END$$
DELIMITER ;

DELIMITER $$
-- Процедура заполняет при добавлении person колонки, добавляя в реквизиты юр.лиц записи в случае если добавляемый person - юр.лицо
CREATE DEFINER=`root`@`localhost` PROCEDURE `tetraedri`.`add_person`(short_name varchar(100), full_name varchar(250), phone varchar(20), type_person int, 
address varchar(350), bank varchar(150), account varchar(20), kodas bigint, pvm varchar(15))
begin
		
	declare ch_person_type varchar(10);
	declare last_person_id bigint;

	case 
		when type_person = 1 then set ch_person_type = 'person_ind';
		when type_person = 2 then set ch_person_type = 'person_ent';
		when type_person = 3 then set ch_person_type = 'worker';
		when type_person = 4 then set ch_person_type = 'partner';
	end case;

	insert into persons values
	(null, upper(short_name), upper(full_name), phone, ch_person_type, now(), now(), address, bank, account, null);
	
	set last_person_id = last_insert_id();
	
	-- add requisites_entity
	if type_person = 2 or type_person = 4 then 
		insert into requisites_entity values(pvm, kodas, last_person_id);
	end if;
	
	commit;
END$$
DELIMITER ;


DELIMITER $$
-- процедура автозаполнения кассового ордера из документа
CREATE DEFINER=`root`@`localhost` PROCEDURE `tetraedri`.`add_kpo`(docs_str varchar(1000))
begin
	
	declare doc_date date;
	declare doc_ref int;	

	while length(docs_str) > 0 do
		
		select substring_index(docs_str, ',', 1) into doc_ref;
	
		select d.date_doc into doc_date from documents d where d.id = doc_ref;
	
		insert into kpo values
		(null, doc_date, doc_ref);
	
		select replace(docs_str,concat(doc_ref,','),'') into docs_str;

	end while;
	commit;
END$$

DELIMITER ;


-- скрипты характерных выборок 

-- работы по клиенту по его машинам
set @client = 10;

select p.full_name, o.date_begin as `date`, o.full_summa as `sum`, o.status, ab.name, a.model, a.num,
(select group_concat(oi.comment) from orders_items oi where oi.order_id = o.id group by oi.order_id) as `works` 
from orders o
join persons p on o.person_id = p.id
join automobile a on o.automobile_id = a.id 
join auto_brands ab on a.brand_id = ab.id
where o.person_id = @client;


