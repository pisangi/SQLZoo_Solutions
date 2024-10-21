-- SQLZoo Nobel Laureates Tutorial Questions and Answers

-- 1. Winners from 1950
-- Show Nobel prizes for 1950:
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

-- 2. Winner for 1962 Literature
-- Show who won the 1962 prize for literature:
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'literature';

-- 3. Year and subject for Albert Einstein
-- Show the year and subject that won 'Albert Einstein' his prize:
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4. Recent Peace Prizes
-- Name of 'peace' winners since the year 2000:
SELECT winner
FROM nobel
WHERE yr >= 2000 AND subject = 'peace';

-- 5. Literature in the 1980's
-- Show all details of literature prize winners for 1980 to 1989:
SELECT *
FROM nobel
WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989;

-- 6. Only Presidents
-- Show all details of the presidential winners:
SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

-- 7. Winners with first name John
-- Show the winners with first name John:
SELECT winner
FROM nobel 
WHERE winner LIKE 'John%';

-- 8. Chemistry and Physics from different years
-- Show year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984:
SELECT *
FROM nobel
WHERE (subject = 'physics' AND yr = 1980) OR (subject = 'chemistry' AND yr = 1984);

-- 9. Exclude Chemists and Medics
-- Show year, subject, and name of winners for 1980 excluding chemistry and medicine:
SELECT *
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('chemistry', 'medicine');

-- 10. Early Medicine, Late Literature
-- Show winners of 'Medicine' before 1910 and 'Literature' in 2004 or later:
SELECT *
FROM nobel
WHERE (yr < 1910 AND subject = 'Medicine') OR (yr >= 2004 AND subject = 'Literature');

-- 11. Umlaut
-- Find all details of the prize won by PETER GRÜNBERG:
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

-- 12. Apostrophe
-- Find all details of the prize won by EUGENE O'NEILL:
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL';

-- 13. Knights in order
-- List the winners, year and subject where the winner starts with Sir:
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner ASC;

-- 14. Chemistry and Physics last
-- Show the 1984 winners ordered by subject and winner name:
SELECT winner, subject 
FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('Physics', 'Chemistry') ASC, subject, winner;