DROP TABLE IF EXISTS likes_objects;
create table likes_objects(
	id SERIAL,
	like_id BIGINT unsigned not null,
	message_id BIGINT UNSIGNED,
	media_id BIGINT UNSIGNED,
	user_id BIGINT UNSIGNED,
	
	FOREIGN KEY (like_id) REFERENCES likes(id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_id) REFERENCES media(id),
	FOREIGN KEY (message_id) REFERENCES messages(id)
);	

alter table likes
drop constraint likes_fk;

alter table likes
drop column media_id;