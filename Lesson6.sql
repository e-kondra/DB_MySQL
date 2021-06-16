/*2. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.*/

set @user_id = 223;

select m.from_user_id, count(m.id) messages_cnt
from messages m 
where m.to_user_id = @user_id
and m.from_user_id in -- здесь проверяем, что пользователи являются друзьями
	(
	(select initiator_user_id from friend_requests fr
	where fr.target_user_id = m.to_user_id and fr.status = 'approved')
	union 
	(select target_user_id from friend_requests fr2
	where fr2.initiator_user_id = m.to_user_id and fr2.status = 'approved')
	)
group by m.from_user_id 
order by messages_cnt desc limit 1;

/*3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.*/

select count(lu.user_id) as count_likes
from like_users lu
where lu.user_id in
(select * from 
	(select p.user_id from profiles p 
	order by p.birthday desc
	limit 10) as most_young
);

/*4. Определить кто больше поставил лайков (всего) - мужчины или женщины?*/

select count(user_id) as cnt
	, if ((select p.gender from profiles p 
			where p.user_id = l.user_id) = 'f', 'femail', 'mail' ) as gend
from likes l
group by gend
order by cnt limit 1;

/*5. Найти 10 пользователей, которые проявляют наименьшую активность 
 в использовании социальной сети.*/

select id  as ID,
		firstname  as name,
		lastname as lastname, 
		((select count(*) from likes l where user_id = u.id)+
		(select count(*) from messages m where m.from_user_id = u.id)+
		(select count(*) from friend_requests fr where fr.initiator_user_id = u.id)+
		(select count(*) from media m2 where m2.user_id = u.id)) as activity
from users u order by activity
limit 10;

