DROP TABLE IF EXISTS signed_up;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS gymclass;


CREATE TABLE members
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255)
);
CREATE TABLE gymclass
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  time INT8
);
CREATE TABLE signed_up
(
  id SERIAL8 PRIMARY KEY,
  member_id INT8 references members(id)  ON DELETE CASCADE,
  gymclass_id INT8 references gymclass(id) ON DELETE CASCADE
);
