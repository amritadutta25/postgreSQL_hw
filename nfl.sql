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


-- List the head coaches of the AFC South
SELECT head_coach FROM teams 
WHERE conference = 'NFC'
AND division = 'South';


-- The total number of players in the NFL
SELECT count(*)
FROM players;


-- The team names and head coaches of the NFC North and AFC East
SELECT name, head_coach
FROM teams
WHERE (conference = 'NFC' AND division = 'North')
OR (conference = 'AFC' AND division = 'East');


-- The 50 players with the highest salaries
SELECT *
FROM players
ORDER BY salary desc
LIMIT 50;


-- The average salary of all NFL players
SELECT avg(salary)
FROM players;


-- The names and positions of players with a salary above 10_000_000
SELECT name, position
FROM players
WHERE salary > 10000000;