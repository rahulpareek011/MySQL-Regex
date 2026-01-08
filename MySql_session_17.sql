-- Constrainsts in sql
-- rules that we apply to limit the type of data that can go into a table
-- we use it to maintain accuracy and reliability
-- Types -> not null, unique, primary key, default, foriegn

-- to create table we have to define structure so we'll be using DDL(Data defination language) -> create, alter, drop, truncate
create database regex1;
use regex1;
create table test1(sno int);
desc test1;
-- to insert data we use dml(data manipulation language) -> insert, update, delete, merge
insert into test1 values(10);
insert into test1 (sno) values(null),(30);
Select * from test1;
Select count(sno), count(*) from test1;

-- i don't want to set null so use -> constraint -> not null
create table test2(sno int not null, salary int);
insert into test2(sno,salary) values(20,1000);
insert into test2(sno,salary) values(40,2000);
insert into test2(sno,salary) values(50,null);
-- insert into test2(sno,salary) values(null,2000); -- cannot be null
-- insert into test2(salary) values(4000); -- no default value for sno so still error

-- default
create table test3(sno int not null default 80,salary int);
insert into test3(salary) values(1000); -- for sno it will be default value 80
insert into test3(sno) values(80);-- for salary it will have its default value null
select * from test3;

-- unique
create table test4(sno int not null, salary int unique default 100);
insert into test4(sno,salary) values(1,200);
insert into test4(sno) values(2);-- for one time it get default value
insert into test4(sno) values(3);-- but second time cannot cause salary should be unique
insert into test4(sno,salary) values(4,null); -- in unique we can give as much null we want coz null cannot have memory to compare
insert into test4(sno,salary) values(5,null);
-- so also in primary key there is not no null value but in unique values there can be multiple null values
select * from test4;

-- check -  used to limit the value range that can be placed in a column or set of columns, 
-- enforcing data integrity and ensuring that data meets specific conditions.

-- syntax when defining constraint with name -> constraint database_tableName_cloumnName_check check(...)
create table test5(sno int,salary int unique default 100,
constraint regex1_test5_sno_check check(sno between 1 and 100), -- while inserting it will check sno should be between 1 and 100
constraint regext1_test5_salary_check check(salary in(1000,2000)) -- while inserting it will check salary should be 1000 or 2000
); -- and if any error occur it give error in proper name coz we given name while creating check
insert into test5(sno,salary) values(5,1000);
insert into test5(sno,salary) values(5,2000);
select * from test5;

-- primary key -> no duplicates or null value allowed
create table test7(sno int primary key,salary int);
insert into test7(sno,salary) values(1,1223);
insert into test7(sno,salary) values(1,1223);-- duplicate not allowed
insert into test7(sno,salary) values(null,1223);

-- foriegn key -> to relate the other table with our common column we use foriegn key

-- customers table
--   p.k					
-- customer id, customer
--	10			aman
--	11			abhishek
	
-- orders table
-- 	 p.k				   f.k
-- order id,    city 	customerId
--	1007		jaipur		10
--	1008		goa			11

-- relation -> many to one
create table customer1(cid int primary key, cname varchar(20));
insert into customer1 values(10,'aman'),(11,'abhishek');
select * from customr1;

create table order1(order_no int, city varchar(20),customerId int);
insert into order1 value(1007,'Jaipur', 10),(1008,'Goa',11),(1009,'Mumbai',10);
select * from order1;
   
-- for foriegn key remember -> in any table creating f.k, it will refer to a p.k

-- so in current both are independent which we dont't want so,
drop table order1;
create table order1(order_no int primary key, city varchar(20),cid int,foreign key (cid) references customer1(cid) );
insert into order1 value(1007,'Jaipur', 10),(1008,'Goa',11),(1009,'Mumbai',10);
select * from order1;
