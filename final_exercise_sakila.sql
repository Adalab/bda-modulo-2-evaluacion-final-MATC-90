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
-- Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
-- EL NOMBRE DE LA CATEGORIAS ESTA EN CATEGORY
-- id_category esta en categorfilm para unir con INVENTORY y obtener el FILMI Y INVENTORYID
-- recuento de alquileres de cada pelicula (rental inventoryid en este caso) 
-- inventory une con film id
-- CUENTO TOTAL RENTAL

SELECT c.name,
	COUNT(r.rental_id) AS total_rentals
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
LEFT JOIN inventory i ON fc.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY total_rentals DESC;

-- Find the average movie length for each rating in the film table and show the rating along with the average length.

-- Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
-- debo mostrar la clasificacion(rating) con promedio len
-- agrupar por clasificacion
	
SELECT rating,
	ROUND(AVG(length),0) AS Average_length
FROM film
GROUP BY rating 
ORDER BY average_length ASC;

-- Find the first and last name of the actors who appear in the movie with the title 'Indian Love'
-- Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
-- los nombres de los actores estan en la tabla actor
-- se relaciona con film actor y esa con film para obtener el nombre de "indian love"
-- INTERSECCION EXACTA, NO VA a ghaber null n el cruce

SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
WHERE f.title = "Indian Love";

-- Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción

SELECT title, description
FROM film
WHERE description REGEXP 'dog|cat'
ORDER BY title ASC;

-- Find the title of all movies that were released between the years 2005 and 2010
SELECT title, release_year
FROM film 
WHERE release_year BETWEEN 2005 AND 2010
ORDER BY release_year ASC;
    
    
    