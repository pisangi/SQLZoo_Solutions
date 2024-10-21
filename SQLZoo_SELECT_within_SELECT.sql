-- SQLZoo SELECT within SELECT Tutorial Solutions

-- 1. Bigger than Russia
SELECT name 
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Russia');

-- 2. Richer than UK
SELECT name 
FROM world
WHERE continent = 'Europe'
AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom');

-- 3. Neighbours of Argentina and Australia
SELECT name, continent
FROM world 
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name ASC;

-- 4. Between United Kingdom and Germany
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom')
AND population < (SELECT population FROM world WHERE name = 'Germany');

-- 5. Percentages of Germany
SELECT name, 
CONCAT(ROUND(population*100/(SELECT population FROM world WHERE name = 'Germany'), 0), '%') AS percentage 
FROM world
WHERE continent = 'Europe';

-- 6. Bigger than every country in Europe
SELECT name
FROM world 
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0);

-- 7. Largest in each continent
SELECT continent, name, area 
FROM world x
WHERE area >= ALL(SELECT area FROM world y WHERE y.continent = x.continent AND area > 0);

-- 8. First country of each continent (alphabetically)
SELECT continent, MIN(name)
FROM world 
GROUP BY continent;

-- 9. Difficult Questions That Utilize Techniques Not Covered In Prior Sections
SELECT name, continent, population 
FROM world x
WHERE 25000000 > ALL(SELECT population FROM world y WHERE y.continent = x.continent);

-- 10. Three time bigger
SELECT name, continent
FROM world x
WHERE population/3 > ALL(SELECT population FROM world y
                         WHERE y.continent = x.continent AND x.name <> y.name);
