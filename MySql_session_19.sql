-- datatypes in MySQL

-- Numebers-> int, decimal 
-- tinyint, small int, mediumint, int , bigint
-- size starts from 1 byte(tiny int) to 8 byte (bigint)

use practice;
create table yash(salary tinyint);
insert into yash values(127);-- 1 byte= 8bit 2**8 => 256 (-128 to 127)

create table yash3(salary float, price double);
insert into yash3 values(100.6781214,100.6781241);
select * from yash3;-- float store only two values after point & double stores as it is

-- if we give numbers in string format it is implicitly converted back to double 
-- string values char vs varchar()
-- fixed length/size character
-- variable length character 
create table yash4(name varchar(20), gender char(10));
desc yash4;
insert into yash4 values('rahul','male'),('aman','male'),('ot','female');
select * from yash4;
insert into yash4 values('raj        ','male        ');
select *,length(name),length(gender) from yash4; -- char doesn't occupy white spaces, it bydefault get truncate
-- varchar whitespace also get truncate when it exceed ts length but before that it will occupy it.

-- DDL (data defination language) 
-- create table
-- drop, truncate, alter
create table raj123(col int);
-- creating a table using select (CTAS)
select first_name, last_name from sakila.actor;
create table actor_cp as
select first_name as fname, last_name as lname from sakila.actor;

select * from actor_cp;

drop table actor_cp; -- table structure and data both are deleted
select * from actor_cp;

create table actor_cp as
select first_name as fname, last_name as lname from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;
-- adding a new sructure (alter -> used for changing the structure)
alter table actor_cp add column (salary int);
alter table actor_cp add constraint new_key primary key (fname);-- giving fname primary key(adding constraint "new_key" is the name of constraint)
desc actor_cp;
alter table actor_cp drop column lname;-- dropped(deleted) last column

desc actor_cp;

alter table actor_cp rename column salary to newsalary; -- renaming column name 
select * from actor_cp;

-- truncate 
select * from actor_cp;
-- changing the value of any specific column (DML Statement)
-- insert
-- update set col = value
update actor_cp set newsalary=900;-- by default safe mode, we've to disable it
SET SQL_SAFE_UPDATES = 0;
update actor_cp set newsalary=900; -- updates all rows value, that's why sql keep lock in update/delete
update actor_cp set newsalary=900 where fname='UMA';
select * from actor_cp;