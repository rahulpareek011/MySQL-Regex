-- recursive cte 

select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all
select first_name, actor_id from sakila.actor where actor_id between 3 and 5;

with recursive cte as (
select 10 as num -- assinging values to this num column (starting point)
union all
select num+1 from cte -- calling cte
where num<15 -- terminating condition (stop point)
)
select * from cte;

create database ctepractice;
use ctepractice;

CREATE TABLE employees (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);

INSERT INTO employees (employeeid, name, managerid) VALUES
(1, 'Alice', NULL),      -- CEO
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 2),       -- Reports to Bob
(4, 'Diana', 2),         -- Reports to Bob
(5, 'Eve', 3);           -- Reports to Charlie

-- we have to find out employee hierarchy
select * from employees;

-- with recursive cte as(
-- select *, name as heirarchy_path from employees where managerid is null
-- union all
-- select * from cte
-- where employeeid<2)
-- select * from cte;
with recursive xyz as(
select employeeid,name, name as hierarchy_path from employees where managerid is null
union all
select e.employeeid, e.name, concat(e.name,'->', xyz.hierarchy_path) from employees as e join xyz
where e.managerid=xyz.employeeid and e.employeeid<5
)
select * from xyz;

with recursive cte as(
select employeeid,name, name as hierarchy_path from employees where managerid is null
union all
select e.employeeid, e.name, concat(e.name,'->', cte.hierarchy_path) from employees as e join cte
where e.managerid=cte.employeeid and e.employeeid<5
)
select * from cte;

-- learning assignment -> views, materialize view & non-materialize view(not compulsory(used) for us like java student)
-- creating a user and giving permission to user

