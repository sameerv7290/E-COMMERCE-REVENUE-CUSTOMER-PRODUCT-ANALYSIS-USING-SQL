-- BASIC SELECT AND FILTERING
-- -------------------------------------

-- 1.Write a query to display all the product with price and stock.
select product_name,price,stock from products;

-- 2.Write a query to find products costing more than 5000

select * from products
where price>5000;

-- 3.Write a Query to Display ORDERS that are Delivered

select * from orders
where status="delivered";

-- 4.Write a Query to Display ORDERS that are Cancelled to deliver.
select * from orders
where status="Cancelled";

-- 5.Write a Query to Display Orders placed after 1st April 2024
select * from orders
where order_date='2024-04-01';

-- 6.Write a Query to Display distinct product categories
select distinct category_name
from categories;

-- 7.Write a Query to Display Products priced between 1000 and 5000
select * from products
where price between  1000 and 5000;

-- 8.Write a Query to Display Orders sorted by latest date
select * from orders
order by order_date desc ;


 -- -------------------------------------------------
 -- ---------- AGGREGATE FUNCTION -------------------

-- 9.Write a query to display total number of orders.
 select count(*) as total_orders from orders;

-- 10.Write a query to display total revenue from completed payments
select sum(amount) as total_revenue from payments
where payment_status="completed";

-- 11.Write a query to display average product price.
select avg(price) as average
from products;

-- 12.Write a Query to display highest product price.
select max(price) as highest
from products;

-- 13.Write a Query to display lowest product price.
select min(price) as lowest
from products;

-- 14.Write a query to display total quantity sold
select sum(quantity) as sold
from order_items;

-- -------------------------------------------------
-- ------ GROUPBY CLAUSE & HAVING CLAUSE -----------
-- 15.Write a query to display Total revenue per payment method
select payment_method,sum(amount)
from payments
where payment_status="completed"
group by payment_method ;

-- 16.Write a query to display categories having more than 5 products.
select count(*),products.category_id
from products
group by category_id
having count(*)>5;

-- 17.Write a query to display Customer with more than 1 orders.
select count(*),customer_id
from orders
group by customer_id
having count(*)>1;

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- JOINS (INNER JOIN,LEFT JOIN,RIGHT JOIN,FULL OUTER JOIN,CROSS JOIN,SELF JOIN)
-- ----------------------------------------------------------------------------

-- 18.Write a query to Show product names and their category names.
select p.product_name,c.category_id
from products p
inner join categories c
on c.category_id = p.category_id;

-- 19.Write a query to Identify products that have never been sold.
select p.product_id,p.product_name
from products p
left join order_items oi
on p.product_id = oi.product_id
where oi.product_id is null;

-- 20.Write a query to display Show all payments with corresponding order details
SELECT p.payment_id, o.order_id, p.amount
FROM orders o
RIGHT JOIN payments p
ON o.order_id = p.order_id;


-- 21.Write a query to Show all products and all order items
SELECT c.customer_id, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- 22.Write a query to Generate combinations of customers and payment methods
select c.name,p.payment_method
from customers c
cross join payments p;

-- 23.Write a query to Compare orders placed on the same date
SELECT o1.order_id, o2.order_item_id, o1.order_date
FROM orders o1
JOIN order_items o2
ON o1.order_id <> o2.order_id;

-- ----------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------
-- SUBQUERIES
-- ------------------------------------
-- 24.Write a Query to Identify all products whose price is higher than the average price of all products.
SELECT products.product_id,products.product_name,products.price
FROM products
WHERE price>( SELECT AVG(price)
            FROM products);

-- 25.Write a Query to Find customers who have placed at least one order.
SELECT customers.name,customer_id
FROM customers
WHERE customer_id IN (SELECT DISTINCT customer_id
                     FROM orders);

commit;







