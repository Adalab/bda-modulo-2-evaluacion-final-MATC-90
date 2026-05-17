USE movies_final_exercise;

-- duracion de mas de 120 min
SELECT * 
FROM movies_info
WHERE runtime > 120
ORDER BY runtime DESC; 

-- PELICULAS SUBTITULOS ES

SELECT *
FROM movies_info
WHERE subtitles LIKE "%es%";

-- peliculas adultos
SELECT *
FROM movies_info
WHERE rating = TRUE;

-- pelicula mas antigua
SELECT *
FROM movies_info
WHERE year = (SELECT MIN(year)
			FROM movies_info);

-- Muestra el promedio de duración de las películas agrupado por género.
-- AVG RUNTIME
-- GROUP BY GENRE

SELECT genre,
	ROUND(AVG(runtime),2) AS runtime_avg
FROM movies_info
GROUP BY GENRE
ORDER BY runtime_avg;

-- ¿Cuántas películas por año se han registrado en la base de datos? Ordena de mayor a menor.
-- group by year
-- count 

SELECT year,
	count(*) as movies_per_year
FROM movies_info
GROUP BY year
ORDER BY movies_per_year desc;

-- ¿Cuál es el año con más películas en la base de datos?
SELECT year,
	COUNT(*) AS movies_per_year
FROM movies_info
GROUP BY year
ORDER BY movies_per_year desc
LIMIT 1;

-- Obtén un listado de todos los géneros y cuántas películas corresponden a cada uno.

SELECT genre,
	COUNT(*) AS movies_per_genre
FROM movies_info
GROUP BY genre
ORDER BY genre ASC;

-- Muestra todas las películas cuyo título contenga la palabra "Godfather" (puedes usar cualquier palabra).

SELECT * 
FROM movies_info
WHERE title LIKE "%Godfather%";

