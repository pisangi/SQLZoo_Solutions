-- SQLZoo WORLD Tutorial Questions and Answers

-- 1. Introduction
-- Show the name, continent, and population of all countries:
SELECT  name, continent, population 
FROM    world;

-- 2. Large Countries
-- Show the name for the countries that have a population of at least 200 million:
SELECT  name 
FROM    world 
WHERE   population >= 200000000;

-- 3. Per capita GDP
-- Give the name and per capita GDP for those countries with a population of at least 200 million:
SELECT  name, gdp/population 
FROM    world 
WHERE   population >= 200000000;

-- 4. South America In millions
-- Show the name and population in millions for the countries of the continent 'South America':
SELECT  name, population/1000000 
FROM    world 
WHERE   continent='South America';

-- 5. France, Germany, Italy
-- Show the name and population for France, Germany, and Italy:
SELECT  name, population 
FROM    world 
WHERE   name IN ('France','Germany','Italy');

-- 6. United
-- Show the countries which have a name that includes the word 'United':
SELECT  name 
FROM    world 
WHERE   name LIKE '%United%';

-- 7. Two ways to be big
-- Show the countries that are big by area or big by population:
SELECT  name, population, area 
FROM    world 
WHERE   area > 3000000 OR population > 250000000;

-- 8. One or the other (but not both)
-- Show the countries that are big by area or big by population but not both:
SELECT  name, population, area 
FROM    world 
WHERE   (area > 3000000) XOR (population > 250000000);

-- 9. Rounding
-- Show the name and population in millions and the GDP in billions for South America:
SELECT  name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) 
FROM    world 
WHERE   continent ='South America';

-- 10. Trillion dollar economies
-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion:
SELECT  name, ROUND(gdp/population,-3) 
FROM    world 
WHERE   gdp >= 1000000000000;

-- 11. Name and capital have the same length
-- Show the name and capital where the name and capital have the same number of characters:
SELECT  name, capital 
FROM    world 
WHERE   LENGTH(name) = LENGTH(capital);

-- 12. Matching name and capital
-- Show the name and capital where the first letters of each match:
SELECT  name, capital 
FROM    world 
WHERE   LEFT(name, 1) = LEFT(capital, 1) AND name <> capital;

-- 13. All the vowels
-- Find the country that has all the vowels and no spaces in its name:
SELECT  name 
FROM    world 
WHERE   name LIKE '%A%' AND name LIKE '%E%' AND name LIKE '%I%' AND name LIKE '%O%' AND name LIKE '%U%' AND name NOT LIKE '% %';