USE movies_final_exercise;

-- How many movies have a runtime longer than 120 minutes?
SELECT * 
FROM movies_info
WHERE runtime > 120
ORDER BY runtime DESC; 

-- How many movies include Spanish subtitles?
SELECT language_code AS language, 
	COUNT(movie_id) AS total_spanish 
FROM subtitles_info s 
INNER JOIN movie_subtitles ms ON ms.subtitle_id = s.subtitle_id 
WHERE language_code = 'es';

-- How many movies have adult content?
SELECT COUNT(is_adult) AS rating_adult
FROM movies_info
WHERE is_adult = TRUE;

-- What is the oldest movie registered in the database?
SELECT *
FROM movies_info
WHERE year = (SELECT MIN(year)
			FROM movies_info);

-- Show the average movie runtime grouped by genre.
SELECT genre,
	ROUND(AVG(runtime),2) AS runtime_avg
FROM movies_info
GROUP BY GENRE
ORDER BY runtime_avg;

-- How many movies have been registered per year? Sort from highest to lowest.
SELECT year,
	count(*) as movies_per_year
FROM movies_info
GROUP BY year
ORDER BY movies_per_year desc;

-- Which year has the highest number of movies in the database?
SELECT year,
	COUNT(*) AS movies_per_year
FROM movies_info
GROUP BY year
ORDER BY movies_per_year desc
LIMIT 1;

-- Get a list of all genres and the number of movies corresponding to each one.
SELECT genre,
	COUNT(*) AS movies_per_genre
FROM movies_info
GROUP BY genre
ORDER BY genre ASC;

-- Show all movies whose title contains the word "Godfather".
SELECT * 
FROM movies_info
WHERE title LIKE "%Godfather%";

