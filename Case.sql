--------------CASE STATEMENTS----------
-- SELECT id,
--        account_id,
-- 	   occurred_at,
-- 	   channel,
-- 	   CASE WHEN channel='adwords' THEN 'yes' END AS is_facebook
-- 	FROM web_events
-- 	ORDER BY occurred_at
----------------shows Error: Division by zero------------------------------
-- SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
-- FROM orders
-------------------------- Using Case to Avoid this Error---------
-- SELECT account_id, CASE WHEN standard_qty = 0 OR standard_qty IS NULL THEN 0
--                         ELSE standard_amt_usd/standard_qty END AS unit_price
-- FROM orders
-------------------------CASE Q.1-------------------------------
-- Write a query to display for each order, the account ID, total amount of the order, and the 
-- level of the order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.

-- SELECT o.account_id,o.total_amt_usd,
-- CASE WHEN o.total_amt_usd>3000 THEN 'Large'
--      ELSE 'Small'
-- 	 END AS "Level of the Order"
-- FROM orders o
-- ORDER BY o.total_amt_usd DESC

-------------------Practice USING COUNT FOR Q.1----------
-- SELECT
-- CASE WHEN o.total_amt_usd>3000 THEN 'Large'
--      ELSE 'Small'
-- 	 END AS "Level of the Order",
-- 	 COUNT(*) AS Order_Count
-- FROM orders o
-- GROUP BY 1
-- ORDER BY 1 DESC
-------------------------------------Q.3------------------
-- We would like to understand 3 different branches of customers based on the amount associated with their purchases. 
-- The top branch includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. 
-- The second branch is between 200,000 and 100,000 usd. The lowest branch is anyone under 100,000 usd.
-- Provide a table that includes the level associated with each account. You should provide the account name, 
-- the total sales of all orders for the customer, and the level. Order with the top spending customers listed first.
----------------------- Q.3 Solution----------------

-- SELECT a.name, SUM(total_amt_usd) total_spent, 
--      CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
--      WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
--      ELSE 'low' END AS customer_level
-- FROM orders o
-- JOIN accounts a
-- ON o.account_id = a.id 
-- GROUP BY a.name
-- ORDER BY 2 DESC;
---------------------------------Q.5----------------------------
-- SELECT s.name, COUNT(*) num_ords,
--      CASE WHEN COUNT(*) > 200 THEN 'top'
--      ELSE 'not' END AS sales_rep_level
-- FROM orders o
-- JOIN accounts a
-- ON o.account_id = a.id 
-- JOIN sales_reps s
-- ON s.id = a.sales_rep_id
-- GROUP BY s.name
-- ORDER BY 2 DESC;
----------------------------Q.6-----------------
SELECT s.name, COUNT(*), SUM(o.total_amt_usd) total_spent, 
     CASE WHEN COUNT(*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
     WHEN COUNT(*) > 150 OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
     ELSE 'low' END AS sales_rep_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id 
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 3 DESC;


