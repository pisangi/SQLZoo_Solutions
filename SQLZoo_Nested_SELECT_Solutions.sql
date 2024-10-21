-- SQLZoo Nested SELECT Tutorial Solutions

-- 1. List each country in the same continent as 'Brazil'
SELECT name 
FROM world 
WHERE continent = (SELECT continent FROM world WHERE name = 'Brazil');

-- 2. List each country and its continent in the same continent as 'Brazil' or 'Mexico'
SELECT name, continent 
FROM world
WHERE continent IN
  (SELECT continent 
   FROM world 
   WHERE name='Brazil' OR name='Mexico');

-- 3. Show the population of China as a multiple of the population of the United Kingdom
SELECT name, 
       population / (SELECT population FROM world WHERE name='United Kingdom') AS multiple
FROM world
WHERE name = 'China';

-- 4. Show each country that has a population greater than the population of ALL countries in Europe
SELECT name 
FROM world
WHERE population > ALL
    (SELECT population 
     FROM world
     WHERE continent='Europe');

-- 5. Show the name and the population of each country in Europe. 
-- Show the population as a percentage of the population of Germany.
SELECT name, 
       CONCAT(ROUND(population*100/(SELECT population FROM world WHERE name = 'Germany'), 0), '%') AS percentage 
FROM world
WHERE continent = 'Europe';

-- Note: The last query (5) is from the image you provided, which is slightly different from the tutorial questions.