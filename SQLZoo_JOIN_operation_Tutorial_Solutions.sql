-- SQLZoo JOIN Tutorial Solutions

-- 1. Show matchid and player name for all goals scored by Germany
SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';

-- 2. Show id, stadium, team1, team2 for game 1012
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;

-- 3. Show player, teamid, stadium and mdate for every German goal
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE teamid = 'GER';

-- 4. Show team1, team2 and player for every goal scored by a player called Mario
SELECT team1, team2, player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%';

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON goal.teamid = eteam.id
WHERE gtime <= 10;

-- 6. List the dates of matches and the name of the team in which 'Fernando Santos' was the team1 coach
SELECT mdate, teamname
FROM game JOIN eteam ON game.team1 = eteam.id
WHERE coach = 'Fernando Santos';

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM goal JOIN game ON goal.matchid = game.id
WHERE stadium = 'National Stadium, Warsaw';

-- 8. Show the name of all players who scored a goal against Germany
SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER';

-- 9. Show teamname and the total number of goals scored
SELECT teamname, COUNT(player) AS goals_scored
FROM eteam JOIN goal ON eteam.id = goal.teamid
GROUP BY teamname;

-- 10. Show the stadium and the number of goals scored in each stadium
SELECT stadium, COUNT(player) AS goals_scored
FROM game JOIN goal ON game.id = goal.matchid
GROUP BY stadium;

-- 11. For every match involving 'POL', show the matchid, date and the number of goals scored
SELECT id, mdate, COUNT(player)
FROM game JOIN goal ON id = matchid
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(player) AS German_Goals
FROM game JOIN goal ON id = matchid
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

-- 13. List every match with the goals scored by each team
SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
FROM game
JOIN goal ON matchid = id
GROUP BY mdate, team1, team2
ORDER BY mdate, team1, team2;