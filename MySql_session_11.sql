use regex;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);
INSERT INTO employee (emp_id, emp_name, job_title, manager_id, salary) VALUES
(1, 'Alice', 'CEO', NULL, 120000),

(2, 'Bob', 'CTO', 1, 95000),
(3, 'Carol', 'CFO', 1, 90000),
(4, 'David', 'HR Manager', 1, 85000),

(5, 'Eve', 'Tech Lead', 2, 75000),
(6, 'Frank', 'Senior Developer', 2, 72000),
(7, 'Grace', 'Senior Developer', 2, 71000),

(8, 'Heidi', 'Developer', 5, 60000),
(9, 'Ivan', 'Developer', 5, 58000),
(10, 'Judy', 'Developer', 6, 59000),

(11, 'Mallory', 'Accountant', 3, 65000),
(12, 'Niaj', 'Financial Analyst', 3, 62000),

(13, 'Olivia', 'HR Executive', 4, 55000),
(14, 'Peggy', 'HR Executive', 4, 54000),

(15, 'Sybil', 'Intern', 8, 35000);

select mngr.emp_name, count(emp.emp_id) from employee as emp
join employee as mngr
where emp.manager_id=mngr.emp_id group by mngr.emp_name;

select mngr.emp_id, mngr.emp_name from employee as mngr;

-- practicing in-> https://sqlzoo.net/wiki/The_JOIN_operation
-- match id + gtime (primary key)

-- game(table) --> goal(table) connected with (team1&team2 -> teamid(goal) and this are connected) to
-- eteam(table) through its id(eteam);

-- now question 1 
-- 1.
-- The first example shows the goal scored by a player with the last name 'Bender'.
-- The * says to list all the columns in the table - a shorter way of saying 
-- matchid, teamid, player, gtime

-- Modify it to show the matchid and player name for all goals scored by Germany.
-- To identify German players, check for: teamid = 'GER'
SELECT matchid, player FROM goal 
  WHERE teamid='GER';
  
-- 2.
-- From the previous query you can see that Lars Bender's scored a goal in game 1012. 
-- Now we want to know what teams were playing in that match.

-- Notice in the that the column matchid in the goal table corresponds to the 
-- id column in the game table. We can look up information
-- about game 1012 by finding that row in the game table.
-- Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game where id=1012;

-- 3.
-- You can combine the two steps into a single query with a JOIN.
-- SELECT *
  -- FROM game JOIN goal ON (id=matchid)
-- The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. (If we wanted to be more clear/specific we could say
-- ON (game.id=goal.matchid)
-- The code below shows the player (from the goal) and stadium name (from the game table)
-- for every goal scored.
-- Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
  FROM goal as g JOIN game as ga 
where g.matchid = ga.id and teamid='GER';

-- 4.
-- Use the same JOIN as in the previous question.
-- Show the team1, team2 and player for every goal scored by a player
-- called Mario player LIKE 'Mario%'


-- 5.
-- The table eteam gives details of every national team including the coach.
-- You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10


-- 6.
-- To JOIN game with eteam you could use either
-- game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)
-- Notice that because id is a column name in both game and eteam you must 
-- specify eteam.id instead of just id
-- List the dates of the matches and the name of the team in which 'Fernando Santos'
-- was the team1 coach.

-- today assignment do this questions till 10th
-- given in the same link above.