-- Number of countries in the table
SELECT COUNT(DISTINCT(country)) AS number_of_countries
FROM university_rankings;

-- Average score in 2015 by country
SELECT country, AVG(score) AS avg_score
FROM university_rankings
WHERE year = 2015
GROUP BY country
ORDER BY AVG(score) DESC;

