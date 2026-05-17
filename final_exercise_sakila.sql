USE sakila;

-- Select all unique film titles
SELECT DISTINCT title
FROM film;

-- Filter films by rating (PG-13)
SELECT title, rating
FROM film
WHERE rating = "PG-13";

-- Find the title and description of all films whose description contains the word 'amazing'.
SELECT title, description
FROM film
WHERE description like "%amazing%";

-- Find titles from films longer than 120 minutes
SELECT title, length
FROM film
WHERE length > 120
ORDER BY length ASC;

-- Retrieve all actor names
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name
FROM actor
ORDER BY full_name ASC;

-- Find actors with 'Gibson' as their last name.
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name
FROM actor
WHERE last_name LIKE "%Gibson%";

-- Find actor names with an actor_id between 10 and 20.
SELECT actor_id,
	CONCAT(first_name, ' ', last_name) AS full_name
FROM actor
WHERE actor_id BETWEEN 10 AND 20
ORDER BY actor_id ASC;

-- Find film titles that are neither 'R' nor 'PG-13' rated.
SELECT title, rating
FROM film
WHERE rating NOT IN ("R", "PG-13")
ORDER BY rating DESC;

-- Find the total number of films in each rating classification and display the rating along with the count
SELECT rating,
	COUNT(*) AS total_rating
FROM film
GROUP BY rating;

-- Find the total number of films rented by each customer and display the customer ID, first name, last name and rental count
-- Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas
-- select id cliente, nombre apellido -- tabla customer
-- cantidad de peliculas alquiladas, que no cuales. contar numero de veces customer id en tabla rental

	SELECT c.customer_id,
		COUNT(*) AS total_rental,
		CONCAT(first_name, ' ', last_name) AS full_name
	FROM customer c
    LEFT JOIN rental r ON c.customer_id = r.customer_id
	GROUP BY c.customer_id;