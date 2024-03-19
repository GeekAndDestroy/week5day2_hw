-- Syntax: FOREIGN KEY(col_in_domestic_table) REFERENCES foreign_table_name(col_in_foreign_table)

CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
 	first_name VarChar(25),
 	last_name VarChar(25),
 	is_adult Boolean
  
);


CREATE TABLE ticket (
 	ticket_id SERIAL PRIMARY KEY,
 	quantity INTEGER,
 	price NUMERIC,
 	customer_id INTEGER,
 	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
 	movie_id INTEGER -- make FOREIGN KEY AFTER movie TABLE IS created
);



CREATE TABLE movies (
 	movie_id SERIAL PRIMARY KEY,
 	genre VarChar(50),
 	rating VarChar(20),
 	ticket_id INTEGER,
 	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)
);

ALTER TABLE ticket 
ADD FOREIGN KEY(movie_id) REFERENCES movies(movie_id);



CREATE TABLE concessions (
 	concession_id SERIAL PRIMARY KEY,
 	quantity INTEGER,
 	price NUMERIC,
 	customer_id INTEGER,
 	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);



CREATE TABLE payment (
 	payment_id SERIAL PRIMARY KEY,
 	payment_type VarChar(20),
 	card_num_hash INTEGER,
 	customer_id INTEGER,
 	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
 	concession_id INTEGER,
 	FOREIGN KEY(concession_id) REFERENCES concessions(concession_id),
 	ticket_id INTEGER, 
 	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)
);
