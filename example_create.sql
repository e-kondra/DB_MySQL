DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(250) NOT NULL
);

INSERT INTO users VALUES 
	(DEFAULT, 'ivanof'),
	(DEFAULT, 'petrov'),
	(DEFAULT, 'gavrilov'),
	(DEFAULT, 'sokolov');
	
SELECT * FROM users;
