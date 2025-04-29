--- 1)Top outlet by cuisine type without using limit and top function
with cte as (select cuisine,restaurant_id, count(order_id) total_orders,
 dense_rank() over (partition by cuisine order by count(order_id) desc) as rnk
 from orders
 group by cuisine,restaurant_id)
 
 select cuisine,restaurant_id ,total_orders
 from cte
 where rnk=1;
 
 -- 2)Find daily new customer count from the launch date (Everyday how many new customers we are acquiring)
 with first_order as 
 (select Customer_code,cast(min(placed_at) as date) as first_order_date
 from orders
 group by Customer_code
 order by first_order_date)
 select first_order_date, count(Customer_code) as total_new_customer
 from first_order
 group by first_order_date;
 
 -- 3)Count of all the users who were acquired in January Jan2025 and only placed in Jan and did not place any other order
 with Jan_order as(
 select customer_code, cast(min(placed_at) as date) as first_order
 from orders
 where placed_at between '2025-01-01' and '2025-01-31'
 group by customer_code
 having count(customer_code)=1)
 select count(customer_code) from Jan_order;
 
 -- 4) List all the customers with no order in the last 7 days but were acquired one month ago with their first order 
 -- on promo
WITH cte AS (
    SELECT  
        customer_code,
        MIN(placed_at) AS first_order,
        MAX(placed_at) AS latest_order
    FROM orders
    WHERE promo_code_name IS NOT NULL
    GROUP BY customer_code
)
SELECT 
    cte.*, 
    o.promo_code_name AS first_promo_name
FROM cte
INNER JOIN orders o 
    ON cte.customer_code = o.customer_code 
    AND cte.first_order = o.placed_at
WHERE  
    cte.latest_order < '2025-03-24'  -- customers whose latest order is before March 24
    AND cte.first_order < DATE_SUB('2025-03-31', INTERVAL 1 MONTH); -- customers whose first order is more than 1 month ago
    
    /* 5)Growth team is planning to create trigger that will target customers after their 
    very third order with the personalized communication and they have asked you to create a query for this*/
select * from orders limit 5;
WITH rnk AS (
    SELECT 
        customer_code,order_id,placed_at,
        DENSE_RANK() OVER (PARTITION BY customer_code ORDER BY placed_at) AS rnk
    FROM orders)
SELECT *
FROM rnk
WHERE rnk%3= 0 
and cast(placed_at as date)=current_date(); -- this will get only the list from today's order not from the previous order lists

select current_date;
-- 6)list the customers who placed more than one orders and all their orders are promo only
WITH rnk AS (
    SELECT *,
        RANK() OVER (PARTITION BY customer_code ORDER BY placed_at) AS rnk
    FROM orders where promo_code_Name is not null)
SELECT distinct customer_code
FROM rnk
WHERE rnk>1;

-- 7)what percentage of customers where organically acquired in Jan 2025?(placed their first order without promo code)
WITH rn AS (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY customer_code ORDER BY placed_at) AS rn
    FROM orders
    WHERE placed_at BETWEEN '2025-01-01' AND '2025-01-31'
)
SELECT 
    (count(CASE WHEN promo_code_name IS NULL AND rn = 1 THEN 1 END) * 100.0 / 
     COUNT(distinct Customer_code)) AS Jan_percentage
FROM rn;

