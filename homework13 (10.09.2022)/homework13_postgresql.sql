CREATE TABLE authors
(
	id SERIAL PRIMARY KEY,
	first_name CHARACTER VARYING(50) NOT NULL,
	last_name CHARACTER VARYING(50) NOT NULL,
	age INTEGER NOT NULL
);

CREATE TABLE books
(
	id SERIAL PRIMARY KEY,
	title CHARACTER VARYING(50) NOT NULL,
	author_id INTEGER NOT NULL,
	copies_sold INTEGER NOT NULL,
	FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE
);

-- Adding data in tables
INSERT INTO authors(first_name, last_name, age) VALUES('mark', 'twain', 74);
INSERT INTO authors(first_name, last_name, age) VALUES('jack', 'london', 40);
INSERT INTO authors(first_name, last_name, age) VALUES('rudyard', 'kipling', 70);
INSERT INTO authors(first_name, last_name, age) VALUES('ivan', 'bunin', 83);
INSERT INTO authors(first_name, last_name, age) VALUES('mikhail', 'bulgakov', 48);
INSERT INTO authors(first_name, last_name, age) VALUES('anton', 'chekhov', 44);
-- Mark Twain's
INSERT INTO books(title, author_id, copies_sold) VALUES('the gilded age', 1, 235);
INSERT INTO books(title, author_id, copies_sold) VALUES('tom sawyer', 1, 2351);
INSERT INTO books(title, author_id, copies_sold) VALUES('a dogs tale', 1, 25);
-- Jack London's
INSERT INTO books(title, author_id, copies_sold) VALUES('the seawolf', 2, 5235);
INSERT INTO books(title, author_id, copies_sold) VALUES('white fang', 2, 2122);
INSERT INTO books(title, author_id, copies_sold) VALUES('martin eden', 2, 1512);
INSERT INTO books(title, author_id, copies_sold) VALUES('hearts of three', 2, 1612);
-- Rudyard Kipling's
INSERT INTO books(title, author_id, copies_sold) VALUES('kim', 3, 94);
INSERT INTO books(title, author_id, copies_sold) VALUES('elephant boy', 3, 412);
INSERT INTO books(title, author_id, copies_sold) VALUES('gunga din', 3, 151);
INSERT INTO books(title, author_id, copies_sold) VALUES('the man who would be king', 3, 192);
INSERT INTO books(title, author_id, copies_sold) VALUES('the jungle book', 3, 1995);
-- Ivan Bunin's
INSERT INTO books(title, author_id, copies_sold) VALUES('dry valley', 4, 2354);
INSERT INTO books(title, author_id, copies_sold) VALUES('cursed days', 4, 2991);
INSERT INTO books(title, author_id, copies_sold) VALUES('dark avenues', 4, 9911);
-- Mikhail Bulgakov's
INSERT INTO books(title, author_id, copies_sold) VALUES('the master and margarita', 5, 2235);
INSERT INTO books(title, author_id, copies_sold) VALUES('flight', 5, 2922);
INSERT INTO books(title, author_id, copies_sold) VALUES('the fatal eggs', 5, 992);
INSERT INTO books(title, author_id, copies_sold) VALUES('the white guard', 5, 4512);
-- Anton Chekhov's
INSERT INTO books(title, author_id, copies_sold) VALUES('three years', 6, 9460);
INSERT INTO books(title, author_id, copies_sold) VALUES('ward no. 6', 6, 2012);
INSERT INTO books(title, author_id, copies_sold) VALUES('three sisters', 6, 1592);
INSERT INTO books(title, author_id, copies_sold) VALUES('the cherry orchard', 6, 312);
INSERT INTO books(title, author_id, copies_sold) VALUES('the seagull', 6, 33);

-- Queries
-- Choose authors who has first_name > 6 symbols
SELECT authors.first_name
FROM authors
WHERE length(authors.first_name) > 6;

-- Count numbers of authors for theirs age
SELECT age, COUNT(age) as authors_count
FROM authors
GROUP BY age;

-- The most solded books
SELECT *
FROM books
ORDER BY copies_sold DESC
LIMIT 3;

-- About authors plus count of theirs books
SELECT authors.first_name, authors.last_name, authors.age, COUNT(books.id) as books_count
FROM authors INNER JOIN books
ON authors.id = books.author_id
GROUP BY authors.first_name, authors.last_name, authors.age;

-- Delete table
DROP TABLE books;
DROP TABLE authors;
DROP DATABASE IF EXISTS homework_db;
