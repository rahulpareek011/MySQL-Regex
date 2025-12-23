CREATE DATABASE REGEX;
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);



INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);
select c.customer_id, c.customer_name, o.customer_id, o.order_id, o.amount from customers as c
join orders as o where c.customer_id = o.customer_id;

-- using inner join on
select c.customer_id, c.customer_name, O.customer_id, o.order_id, o.amount from customers as c
inner join orders as O on c.customer_id = o.customer_id;

select c.customer_id, c.customer_name, o.customer_id, o.order_id, o.amount from customers as c
inner join orders as O using (customer_id);

-- left outer - gives left table whole data, gives same data for common and null for non existing one.
-- left table is the table which written before join
select c.customer_id, c.customer_name, O.customer_id, o.order_id, o.amount from customers as c
left join orders as O on c.customer_id = o.customer_id;

-- want info of whole orders(right table) data even if in customer(left table) some data don't exist
select c.customer_id, c.customer_name, O.customer_id, o.order_id, o.amount from customers as c
right join orders as O on c.customer_id = o.customer_id;

-- types of join in MySQL (chatgpt task: defination and usage with example)

-- Natural Join - (alternative of inner join) it acts like cross join or carresion join
-- it takes MxN rows
-- not used much coz when we alter and rename column then it gives very different output
select c.customer_id, c.customer_name, O.customer_id, o.order_id, o.amount from customers as c
natural join orders as O;

alter table customers rename column cid to customer_id;

select c.cid, c.customer_name, O.customer_id, o.order_id, o.amount from customers as c
natural join orders as O;

-- i need to take tot. amt. spende by customer.
select c.customer_id, sum(o.amount) from customers as c
join orders as o group by c.customer_id;
select * from orders;

-- tot. amt. spend by each customer name
select c.customer_name, sum(amount) from Customer as c
inner join orders As o on c.cid = o.customer_id
group by c.customer_name;