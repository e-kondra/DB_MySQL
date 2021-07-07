DROP database IF EXISTS Tetraedri;
create database Tetraedri;
use Tetraedri;

drop table if exists persons;
create table persons(
	id serial primary key,
	short_name varchar(100),
	full_name varchar(250),
	phone varchar(20) default '+370',
	type_person ENUM('person_ind', 'person_ent', 'worker', 'partner'),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	address varchar(350),
	Bank varchar(150),
	Account varchar(20),
	comment varchar(1000)
);

drop table if exists requisites_entity; -- 
create table requisites_entity(
	PVM varchar(15),
	Imones_kodas BIGINT unsigned unique,
	person_id BIGINT UNSIGNED NOT NULL unique,
	
	FOREIGN KEY (person_id) references persons(id)
);

drop table if exists contracts;
create table contracts(
	id serial,
	person_id BIGINT UNSIGNED NOT NULL unique,
	Num varchar(15) unique primary key,
	date_from DATETIME NOT NULL,
	date_for DATETIME NOT NULL, 
	
	FOREIGN KEY (person_id) REFERENCES persons(id)
);

drop table if exists auto_brands;
create table auto_brands(
	id serial,
	name varchar(250) NOT NULL unique primary key
);

drop table if exists automobile;
create table automobile(
	id serial primary key,
	person_id BIGINT UNSIGNED NOT NULL,
	brand_id BIGINT UNSIGNED NOT NULL,
	model varchar(250),
	num varchar(10),
	comment varchar(5000),
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
	FOREIGN KEY (brand_id) REFERENCES auto_brands(id)
);	

drop table if exists `orders`;  -- The Main table Orders
create table `orders`(
	id serial,
	date_begin DATETIME NOT NULL,
	date_end DATETIME,
	status ENUM('in_work', 'ended', 'canceled', 'waiting'),
	warranty_work TINYINT default 0,
	automobile_id BIGINT UNSIGNED,
	person_id BIGINT UNSIGNED NOT NULL,
	contract_id BIGINT UNSIGNED,
	full_summa FLOAT,
	comment varchar(5000),
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
	FOREIGN KEY (automobile_id) REFERENCES automobile(id),
	FOREIGN KEY (contract_id) REFERENCES contracts(id)	
);

drop table if exists documents; -- FACTURA/INVOICE
create table documents(
	id serial,
	num varchar(20) NOT NULL unique primary key,
	date_doc DATETIME NOT null default now(),
	order_id BIGINT UNSIGNED NOT NULL unique,
	
	FOREIGN KEY (order_id) REFERENCES `orders`(id)
);

 
drop table if exists KPO; -- CASH ORDER
create table KPO(
	id serial,
	-- num varchar(20) NOT NULL unique,
	date_doc DATETIME NOT null default now(),
	document_id BIGINT UNSIGNED NOT NULL unique,
	
	FOREIGN KEY (document_id) REFERENCES documents(id)
);


drop table if exists types_work; -- different types of work what can we do
create table types_work(
	id serial,
	code varchar(30) primary key,
	name varchar(250),
	name_lt varchar(250) -- name of type lithuanian for filling out documents
);

drop table if exists orders_items; -- items(kind of works and products of order)
create table orders_items(
	id serial primary key,
	order_id BIGINT UNSIGNED NOT NULL,
	type_work_id BIGINT UNSIGNED NOT NULL,
	worker_id BIGINT UNSIGNED NOT NULL, -- ref person with type worker(who did this work)
	store_item_id BIGINT UNSIGNED unique, -- goods from our store
	parts_cost FLOAT, -- cost of details
	price_for_person FLOAT, -- cost of work and details for person and documents
	price_of_work FLOAT, -- cost of work paid to an employee
	comment varchar(3000),
	
	FOREIGN KEY (order_id) REFERENCES `orders`(id),
	FOREIGN KEY (type_work_id) REFERENCES types_work(id),
	FOREIGN KEY (worker_id) REFERENCES persons(id)
);

alter table orders_items change store_item_id store_item_id BIGINT unsigned;
