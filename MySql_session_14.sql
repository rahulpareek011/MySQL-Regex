-- subquery is the query inside query
-- first the parameter closed query runs

use sakila;
select * from payment;
-- find payment of all which have amount of payment_id 5
select amount from payment where payment_id= 5;
select * from payment where amount = 5.99;
select * from payment where amount = (select amount from payment
where payment_id= 5);

-- i need to get all payment where the staff serving for payment id 8
select * from payment where staff_id = (
select staff_id from payment where payment_id=8);

-- get the payment id , amount , date where the month of the payment should be
-- same as of payment id 20;
select payment_id, amount, payment_date from payment
where month(payment_date)=(
select Month(payment_date) from payment where payment_id=20
);

-- i need to get the amount and total number of payment done for this amount
-- where the amount should be less than amount of rental id=1725
select * from payment;
select amount, count(payment_id) from payment where amount<(
select amount from payment where rental_id=1725
) group by amount;

-- single row subquery (subquery will return 1 rows)
-- get the month and the total amoutn spend from the payment table 
-- where the month is greater than month of customere_id 1 
-- with the payment_id 3
select month(payment_date), sum(amount) from payment where month(payment_date)>(
select month(payment_date) from payment
where customer_id = 1 and payment_id=3
) group by month(payment_date);

-- multi row subquery - which returns more than one row
-- in multi row subquery we cannot use >,<,=,!= operator
select amount from payment where payment_id=2 or payment_id=3;
select * from payment where amount=(select amount from payment
where payment_id=2 or payment_id=3);

-- so we use -> in, any, all operator(used when we have multi row subquery)
select * from payment where amount in (select amount from payment
where payment_id=2 or payment_id=3);