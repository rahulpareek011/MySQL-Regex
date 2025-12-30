-- solved 12 question of join in sql zoo
-- for question 13 learning CASE WHEN

-- CASE ->  it is like applying kind of condition
-- generating value based on different condition
use world;
-- if(condition, True, False)
-- if(condition, True, if(condition, True, False)) -> makes complex
-- so better to use case condition
/*
 case
	when population=0 then 'Very small population' olumn
    when population=8000 then 'Population is 8000'
 end from country
*/
select name, population from country;
select name, population,
case
when population=0 then 'No Population'
when population=8000 then 'Small Population'
end from country;

select count(*),
	case
		when population>100000 then 'Large Population'
		when population>=50000 then 'Medium Population'
		when population>=8000 then 'Small Population'
		else 'V.Small'
	end status
from country group by status;

-- helped in 13th question
/*
SELECT mdate, team1, 
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1
, team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2 
from game left join goal on matchid = id group by mdate, team1, team2
order by mdate, matchid, team1, team2;

CASE WHEN: works perfectly here
-> SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END)
When no goal row exists: teamid = NULL
condition is false-> contributes 0-> SUM() → 0
Exactly what we want.

What LEFT JOIN does differently
=> FROM game LEFT JOIN goal ON matchid = id
Keeps all rows from game
If no goals exist: teamid becomes NULL
Your CASE WHEN safely turns that into 0
So 0–0 matches show up correctly -> ✔️ Result → accepted
*/
