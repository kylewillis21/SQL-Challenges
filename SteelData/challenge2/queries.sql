-- Challenge found at https://steeldata.org.uk/sql2.html
-- # 1 What are the names of the players whose salary is greater than 100,000?
SELECT player_name, salary FROM Players
WHERE salary > 100000
ORDER BY salary DESC;


-- # 2 What is the team name of the player with player_id = 3?
SELECT player_id, team_name  FROM Players
JOIN Teams
ON Players.team_id = Teams.team_id
WHERE player_id = 3;


-- # 3 What is the total number of players in each team?
SELECT team_name, COUNT(Players.player_id) as num_players FROM Teams
JOIN Players
ON Players.team_id = Teams.team_id
GROUP BY team_name;


-- # 4 What is the team name and captain name of the team with team_id = 2?
SELECT team_name, player_name FROM Teams
JOIN Players
ON Players.team_id = Teams.team_id
WHERE Players.player_id = Teams.captain_id AND Teams.team_id = 2;

-- # 5 What are the player names and their roles in the team with team_id = 1?
SELECT Teams.team_id, team_name, player_name, role FROM Teams
JOIN Players
ON Players.team_id = Teams.team_id
WHERE Players.team_id = 1;

-- # 6 What are the team names and the number of matches they have won?
SELECT team_name, COUNT(team_name) as wins FROM Teams
JOIN Matches
ON Teams.team_id = Matches.winner_id
GROUP BY team_name;

-- # 7 What is the average salary of players in the teams with country 'USA'?
SELECT country, AVG(salary) FROM Players
JOIN Teams
ON Players.team_id = Teams.team_id
WHERE country = 'USA';


-- # 8 Which team won the most matches?
SELECT team_name, COUNT(team_name) as wins FROM Teams
JOIN Matches
ON Teams.team_id = Matches.winner_id
GROUP BY team_name
ORDER BY wins DESC;

-- # 9 What are the team names and the number of players in each team whose salary is greater than 100,000?
SELECT team_name, COUNT(salary) FROM Players
JOIN Teams
ON Teams.team_id = Players.team_id
WHERE salary > 100000
GROUP BY team_name;


-- # 10 What is the date and the score of the match with match_id = 3?
SELECT match_id, match_date, score_team1, score_team2 FROM Matches
WHERE match_id = 3

