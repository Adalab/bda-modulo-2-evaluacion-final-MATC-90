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
SELECT c.customer_id,
	COUNT(*) AS total_rental,
	CONCAT(first_name, ' ', last_name) AS full_name
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;
    
-- Find the total number of films rented per category and display the category name along with the rental count. 
SELECT c.name,
	COUNT(r.rental_id) AS total_rentals
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
LEFT JOIN inventory i ON fc.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY total_rentals DESC;

-- Find the average movie length for each rating in the film table and show the rating along with the average length.
SELECT rating,
	ROUND(AVG(length),0) AS Average_length
FROM film
GROUP BY rating 
ORDER BY average_length ASC;

-- Find the first and last name of the actors who appear in the movie with the title 'Indian Love'
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
WHERE f.title = "Indian Love";

-- Show the title of all movies whose description contains the word 'dog' or 'cat'
SELECT title, description
FROM film
WHERE description REGEXP 'dog|cat'
ORDER BY title ASC;

-- Find the title of all movies that were released between the years 2005 and 2010
SELECT title, release_year
FROM film 
WHERE release_year BETWEEN 2005 AND 2010
ORDER BY release_year ASC;

    
    