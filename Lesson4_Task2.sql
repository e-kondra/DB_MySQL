update friend_requests fr
	set fr.target_user_id = (SELECT id FROM users where id != fr.initiator_user_id ORDER BY RAND() LIMIT 1)
	where fr.initiator_user_id = fr.target_user_id;