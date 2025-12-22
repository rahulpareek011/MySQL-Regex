use world;

-- 2 table = data extract(Join)
select * from city;
-- primary key - defination ?
-- id can be my primary key
describe city;
select count(id), count(distinct id), count(population),
count( distinct population) from city;-- id are always unique so it is good to take it primary id

-- here country code could be primary key
select * from country;

-- foriegn key always make relationship with unique rows or id
-- what is relationships in sql (asking you chatgpt to give this -> defination, usage)

-- giving city a nick name and using it accessing rows
select ct.name, ct.countrycode from city as ct;

-- good habit
select cntry.code, cntry.name from country as cntry;

-- join
-- city -> country code = country.code
-- ct.country code = cntry.code
-- to avoid naming conflict while doing join we are using nickname
-- find out the city and their respective country name
select ct.name, ct.countrycode, cntry.code ,cntry.name from city as ct
join country as cntry
where ct.countrycode = cntry.code;
-- you need to find city name & population of city along with the government form in that 
-- city with the population from higheset to the lowest
select ct.countrycode, ct.name, ct.population, cntry.governmentform from city as ct 
join country as cntry where ct.countrycode = cntry.code order by ct.population;-- use desc for descending
select * from country;

-- table -> country  table -> countryLanguage 
-- you need to get the country name, population and all the language spoken for each country name
select cntry.code, cntry.name, cntry.population, cl.language from country as cntry
join countryLanguage as cl where cntry.code = cl.CountryCode; -- here there is no unique key in country language so always
-- it's not necessary to have unique value but there is common value -> country code 

use sakila;
select * from actor;
select * from film_actor;
-- get the actor id and the first name along with it's film_id
select act.actor_id, act.first_name, fc.film_id from actor as act
join film_actor as fc where act.actor_id = fc.film_id;

-- table use -> actor, film actor & film table
-- what is the actor name and movie he worked on 
select act.actor_id, act.first_name, fc.film_id, fm.title from actor as act
join film_actor as fc, film as fm where act.actor_id = fc.film_id && fc.film_id = fm.film_id;
select * from film;