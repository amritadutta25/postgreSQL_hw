drop table if exists players;
drop table if exists teams;

create table teams(
	id serial primary key,
	name varchar(255) not null,
	stadium varchar(255),
	division varchar(255),
	conference varchar(255),
	head_coach varchar(255),
	active boolean
);

create table players(
	id serial primary key,
	name varchar(255) not null,
	position varchar(255),
	salary integer,
	team_id integer references teams
);

-- List the names of all NFL teams
SELECT name FROM teams;


-- List the stadium name and head coach of all NFC teams
SELECT stadium, head_coach FROM teams 
WHERE conference = 'NFC';

--Answer
--            stadium	                    head_coach
-- 1	AT&T Stadium	                    Jason Garrett
-- 2	MetLife Stadium	                    Tom Coughlin
-- 3	Lincoln Financial Field	            Chip Kelly
-- 4	FedExField	                        Jay Gruden
-- 5	Soldier Field	                    Marc Trestman
-- 6	Ford Field	                        Jim Caldwell
-- 7	Lambeau Field           	        Mike McCarthy
-- 8	TCF Bank Stadium	                Mike Zimmer
-- 9	Georgia Dome	                    Mike Smith
-- 10	Bank of America Stadium	            Ron Rivera
-- 11	Mercedes-Benz Superdome	            Sean Payton
-- 12	Raymond James Stadium	            Lovie Smith
-- 13	University of Phoenix Stadium	    Bruce Arians
-- 14	Edward Jones Dome	                Jeff Fisher
-- 15	Levis Stadium	                    Jim Harbaugh
-- 16	CenturyLink Field	                Pete Carroll


-- List the head coaches of the AFC South
SELECT head_coach FROM teams 
WHERE conference = 'NFC'
AND division = 'South';

--Answer
--       head_coach
-- 1	Mike Smith
-- 2	Ron Rivera
-- 3	Sean Payton
-- 4	Lovie Smith


-- The total number of players in the NFL
SELECT count(*)
FROM players;

--Answer
-- count - 1532


-- The team names and head coaches of the NFC North and AFC East
SELECT name, head_coach
FROM teams
WHERE (conference = 'NFC' AND division = 'North')
OR (conference = 'AFC' AND division = 'East');

-- Answer
--             name	                head_coach
-- 1	Buffalo Bills	        Doug Marrone
-- 2	Miami Dolphins	        Joe Philbin
-- 3	New England Patriots	Bill Belichick
-- 4	New York Jets	        Rex Ryan
-- 5	Chicago Bears	        Marc Trestman
-- 6	Detroit Lions	        Jim Caldwell
-- 7	Green Bay Packers	    Mike McCarthy
-- 8	Minnesota Vikings	    Mike Zimmer 


-- The 50 players with the highest salaries
SELECT *
FROM players
ORDER BY salary desc
LIMIT 50;


-- The average salary of all NFL players
SELECT avg(salary)
FROM players;

--Answer
--avg - 1579692.539817232376


-- The names and positions of players with a salary above 10_000_000
SELECT name, position
FROM players
WHERE salary > 10000000;


-- The player with the highest salary in the NFL
SELECT name
FROM players
ORDER BY salary desc
LIMIT 1;

--Answer
--name - Peyton Manning


-- The name and position of the first 100 players with the lowest salaries
SELECT name, position, salary
FROM players
ORDER BY salary ASC
LIMIT 100;


-- The average salary for a DE in the nfl
SELECT avg(salary)
FROM players
WHERE position = 'DE';

--Answer
--avg - 2161326.377049180328


-- The total salary of all players on the New York Giants
SELECT sum(salary)
FROM players as p
JOIN teams t 
ON p.team_id = t.id
WHERE t.name = 'New York Giants';

--Answer
-- sum -  74179466

-- The player with the lowest salary on the Green Bay Packers
SELECT *
FROM players as p
JOIN teams t 
ON p.team_id = t.id
WHERE t.name = 'Green Bay Packers'
ORDER BY salary ASC
LIMIT 1;

--Answer
-- name - Shaky Smithson