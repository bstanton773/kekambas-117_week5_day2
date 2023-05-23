-- DDL (Data Definition Language) Statements

-- CREATE 
-- Syntax:
-- CREATE TABLE table_name( col_name_1 DATA_TYPE, col_name_2 DATA_TYPE, etc. )
-- table_name -> all lowercase and singular form 


-- Create a table for user
CREATE TABLE IF NOT EXISTS blog_user(
	-- Column Name DATA TYPE <CONSTRAINTS>,
	customer_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	username VARCHAR(25) NOT NULL UNIQUE, -- NOT NULL means that this column cannot be empty
	password_hash VARCHAR(100) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birthday DATE,
	password_hint VARCHAR(50)
);


SELECT *
FROM blog_user;

-- To make any changes to the table once it is created, use the ALTER statement
-- ALTER TABLE table_name RENAME COLUMN current_col_name TO new_col_name
ALTER TABLE blog_user
RENAME COLUMN customer_id TO user_id;

-- To add a column
-- ALTER TABLE table_name ADD COLUMN new_col_name DATATYPE
ALTER TABLE blog_user
ADD COLUMN middle_name VARCHAR(50);


SELECT *
FROM blog_user;


-- Create Post table with a foreign key to Blog User table
CREATE TABLE post(
	post_id SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	body VARCHAR(255) NOT NULL,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	last_edited TIMESTAMP,
	copyright BOOLEAN DEFAULT FALSE,
	user_id INTEGER NOT NULL, -- CREATE COLUMN FIRST
	-- Add foreign key second
	-- FOREIGN KEY(column_in_domestic_table) REFERENCES foreign_table_name(column_in_foreign_table)
	FOREIGN KEY(user_id) REFERENCES blog_user(user_id)
);


SELECT *
FROM post;


-- Create the Post Category Join Table 
CREATE TABLE post_category(
	post_id INTEGER NOT NULL,
	FOREIGN KEY(post_id) REFERENCES post(post_id),
	category_id INTEGER NOT NULL
--	FOREIGN KEY(category_id) REFERENCES category(category_id) -- CANNOT REFERENCE A TABLE THAT DOES NOT EXIST!
);

-- Create the Category Table AND THEN ALTER post_category to add FK
CREATE TABLE category(
	category_id SERIAL PRIMARY KEY,
	category_name VARCHAR(50),
	description VARCHAR(255),
	color VARCHAR(9)
);

-- Add foreign key
ALTER TABLE post_category 
ADD FOREIGN KEY(category_id) REFERENCES category(category_id);


-- Create the comment table
CREATE TABLE post_comment(
	comment_id SERIAL PRIMARY KEY,
	body VARCHAR(255) NOT NULL,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	post_id INTEGER NOT NULL,
	FOREIGN KEY(post_id) REFERENCES post(post_id),
	user_id INTEGER NOT NULL,
	FOREIGN KEY(user_id) REFERENCES blog_user(user_id)
);


-- Create a table that we will eventually delete
CREATE TABLE to_be_deleted(
	test_id SERIAL PRIMARY KEY,
	col_1 INTEGER,
	col_2 BOOLEAN
);


SELECT *
FROM to_be_deleted;

-- To delete a column in a table
-- ALTER TABLE table_name DROP COLUMN col_name;
-- BE VERY CAREFUL WITH DROP - NO UNDO BUTTON!
ALTER TABLE to_be_deleted 
DROP COLUMN col_1;

SELECT *
FROM to_be_deleted;


-- Remove a table completely use DROP TABLE
-- * IF EXISTS will only drop it the table exists
DROP TABLE IF EXISTS to_be_deleted;
	

