use world;
select * from country;
select population, avg(population) from country; -- error
select code, name , continent, population , avg(population) over(), sum(population) over() from country;

select continent, sum(population) from country group by continent;

select code, name, continent, population, sum(population) over(), sum(population) over() from country;
-- over() - performing calculation on set of rows
-- over and group by difference ?(chatgpt work)
-- partition by ?(chatgpt work)
select code, name, continent, population, sum(population) over(), sum(population) over(partition by continent) from country;

select code, name, continent, population, sum(population) over(), sum(population) over(partition by continent)
,max(population) over(), max(population) over(partition by continent)
from country;

select code, name, continent, region, population,
sum(population) over(partition by continent),
sum(population) over(partition by continent, region) from country
order by continent;


-- Windows Functions
CREATE DATABASE IF NOT EXISTS window_fn_practice;
USE window_fn_practice;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
salary INT NOT NULL,
hire_date DATE NOT NULL
);
CREATE TABLE sales (
sale_id INT PRIMARY KEY,
emp_id INT NOT NULL,
sale_date DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO employees (emp_id, full_name, department, city, salary, hire_date) VALUES
(101, 'Asha Nair',   'Sales',      'Mumbai',    65000, '2022-04-10'),
(102, 'Rohan Mehta', 'Sales',      'Pune',      72000, '2021-07-05'),
(103, 'Neha Singh',  'Sales',      'Delhi',     68000, '2023-01-15'),
(104, 'Kabir Rao',   'Engineering','Bengaluru', 120000,'2020-09-20'),
(105, 'Isha Verma',  'Engineering','Hyderabad', 110000,'2021-11-12'),
(106, 'Vikram Das',  'Engineering','Bengaluru', 125000,'2019-03-08'),
(107, 'Pooja Shah',  'HR',         'Mumbai',    60000, '2020-02-01'),
(108, 'Arjun Iyer',  'HR',         'Chennai',   58000, '2022-06-18');

INSERT INTO sales (sale_id, emp_id, sale_date, amount) VALUES
(1, 101, '2026-01-02', 12000.00),
(2, 101, '2026-01-05',  8000.00),
(3, 102, '2026-01-03', 15000.00),
(4, 102, '2026-01-09',  5000.00),
(5, 103, '2026-01-04',  7000.00),
(6, 103, '2026-01-10', 11000.00),
(7, 101, '2026-02-02', 14000.00),
(8, 102, '2026-02-03',  9000.00),
(9, 103, '2026-02-05', 13000.00),
(10,101, '2026-02-08',  6000.00),
(11,102, '2026-02-10', 16000.00),
(12,103, '2026-02-12',  4000.00);

select * from employees;

select *, sum(salary) over(),
sum(salary) over(partition by department),
sum(salary) over(partition by department, city) from employees;

-- over() => and with arranging order in ascending order
-- running sum of salary (running sum or cumulative sum)
select *, sum(salary) over(order by salary) from employees;

select *, sum(salary) over(order by emp_id) from employees;

select *, sum(salary) over(order by month(hire_date)) from employees;

-- i need to get running sum of salary of each department
select *, sum(salary) over(partition by department order by salary) from employees;

-- windows functions 
-- 1. row_number() => to define a unique values
select *, row_number() over() from employees;

select *, row_number() over(partition by department) from employees;

-- giving first value to the first hired guy
select *, row_number() over(partition by department order by hire_date) from employees;

-- rank()
select *, rank() over(order by salary desc) from employees;

select *, rank() over(order by department) from employees;-- order by on department

-- in window function what is the dif b/w rank, dense_rank(), row number() (chatgpt work)
select *, dense_rank() over(partition by department order by salary) from employees;
