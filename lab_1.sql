CREATE DATABASE lab1;

CREATE TABLE users_(
  id SERIAL,
  firstname varchar(50),
  lastname varchar(50)
);
ALTER TABLE users_ ADD COLUMN isadmin int;
ALTER TABLE users_
    ALTER COLUMN isadmin TYPE boolean USING users_.isadmin::boolean;
ALTER TABLE users_
    ALTER COLUMN isadmin SET DEFAULT FALSE ;
ALTER TABLE users_ ADD PRIMARY KEY(id);
CREATE TABLE tasks (
  id SERIAL,
  name varchar(50),
  user_id int
);
SELECT * FROM users_;
SELECT * FROM tasks;
DROP TABLE tasks;
DROP DATABASE lab1;


