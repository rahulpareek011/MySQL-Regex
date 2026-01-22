-- practice session 
use window_fn_practice;
-- Create table: events
-- -------------------------
CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- -------------------------
-- Create table: ticket_sales
-- -------------------------
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- -------------------------
-- Insert data: events
-- -------------------------
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

-- -------------------------
-- Insert data: ticket_sales
-- -------------------------
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);

-- Quick check
SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;

-- 1. Find the total quantity sold per event_id. 
select event_id, sum(qty) from ticket_sales group by event_id;

-- 2. Find the total revenue per event_id.
select event_id, sum(qty*price_per_ticket) from ticket_sales group by event_id;

-- 3. Find monthly total revenue (group by month of sale_date).
select month(sale_date),sum(qty*price_per_ticket) from ticket_sales group by month(sale_date);

-- 4. Find the maximum price_per_ticket per event_id. 
select event_id, max(price_per_ticket) from ticket_sales group by event_id;

-- 5. Find total revenue per month and ticket_type.
select month(sale_date),ticket_type,sum(qty*price_per_ticket) from ticket_sales group by month(sale_date),ticket_type;

-- 6. List all sales with event_name and sale_date. 
select ts.sale_id,es.event_name, ts.sale_date from ticket_sales as ts join events as es on ts.event_id=es.event_id;

-- 7. Show event_name, ticket_type, qty for each sale. 
select es.event_name, ts.ticket_type, ts.qty from ticket_sales as ts join events as es on ts.event_id=es.event_id;

-- 8. Show sales where the event city is Mumbai. 
select ts.sale_id, es.city, es.event_name, ts.sale_date from ticket_sales as
ts join events as es on ts.event_id=es.event_id where es.city = 'mumbai';

-- 9. Show all events and matching sales 
select ts.sale_id, es.event_name, ts.sale_date from ticket_sales as ts join events as es on ts.event_id=es.event_id;

-- 10. Show distinct event names that have at least one sale.
select distinct(es.event_name) from ticket_sales as ts join events as es on ts.event_id=es.event_id;

-- 11. Show each sale’s computed revenue with event name. 
select ts.sale_id, es.event_name, ts.price_per_ticket*ts.qty as revenue from ticket_sales as ts
join events as es on ts.event_id=es.event_id;

-- 12. Find total quantity per event_name.
select es.event_name, sum(ts.qty) from ticket_sales as ts join events as es on es.event_id = ts.event_id group by es.event_name;

-- 13. Find total VIP revenue per event_name.
select ts.sale_id, es.event_name,ts.ticket_type , ts.price_per_ticket*ts.qty as revenue from ticket_sales as ts
join events as es on ts.event_id=es.event_id where ts.ticket_type='VIP';

-- 14. Find monthly revenue per city. 
select month(ts.sale_date), sum(ts.price_per_ticket*ts.qty), es.city from ticket_sales as ts join events as es 
on es.event_id=ts.event_id group by month(ts.sale_date),es.city;

-- 15. Find total quantity per city and ticket_type. 


-- 16. Find sales that happened on the latest sale_date in the table. 

-- 17. Find sales where revenue is greater than the overall average sale revenue. 

-- 18. Find events that have at least one VIP sale. 

-- 19. Find events in cities that have at least one VIP sale. Hint: subquery will use the joins

-- 20. Find events that have at least one sale in February 2025. 

-- 21. For each event, return the highest price_per_ticket sale row.

-- 22. Show monthly total revenue and monthly total quantity, but only include months where total revenue is at least 10,000. 

-- 23. Show month-wise count of sales rows, but only include months that have at least 3sales rows. 

-- 24. Show average revenue per sale row per month, but only include months where average sale revenue is above 4000. 

-- 25. Show revenue per month and ticket_type, but only include groups where total revenue is at least 5000.

-- 26. 
