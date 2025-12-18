use sakila;
select * from payment;

-- how many transaction every uesr did ?
select count(payment_id) from payment where customer_id=1;
select customer_id,count(payment_id) from payment group by customer_id;

-- you need to find out number of customer transaction where 
-- amount of transaction should be greater than three?
select * from payment where amount>3;
select customer_id,count(payment_id) from payment
where amount>3 group by customer_id;

-- tot amt of tans in the month of may
select payment_date, month(payment_date), extract(month from payment_date)
 from payment where month(payment_date)=5;

select amount, count(*) from payment where month(payment_date)=5 group by amount;

-- you need to find out the maximum amount spend, the avg amount spend and the total
-- amount is spend for each staff ?
select staff_id, MAX(amount), avg(amount),sum(amount) from payment group by staff_id;

-- find out the avg, total amout spe only for customer id 1,3,7,11 ?
select avg(amount), sum(amount) from payment where customer_id=1,
customer_id=3,customer_id=7,customer_id=11;

-- tot amt spend & the num. of customer who have done payment on each month 
-- where the amt spend should be greater than one dollar.
select month(payment_date), sum(amount), count(customer_id) from payment where amount>1 
group by month(payment_date);

SELECT 
    MONTH(payment_date) AS month,
    SUM(amount) AS total_amount_spent,
    COUNT(DISTINCT customer_id) AS number_of_customers
FROM payment
WHERE amount > 1
GROUP BY MONTH(payment_date);

-- where the tot customer should be great then 300
select month(payment_date), sum(amount),count(customer_id)
from payment where amount>1
group by month(payment_date)
having count(customer_id)>300;

-- we need to find out data from month of the specific year 
select year(payment_date), month(payment_date), count(customer_id)
from payment group by year(payment_date), month(payment_date);

-- assignment
-- what are data models ?
-- what is cardinality ?
-- what are the types of relationship in DBMS ?