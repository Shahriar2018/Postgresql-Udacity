-- SELECT channel,
--        AVG(event_count) AS avg

-- FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
--        channel,
-- 	   COUNT(*) AS event_count
-- FROM web_events
-- GROUP BY 1,2
-- ) sub
-- GROUP BY 1
-- ORDER BY 2 DESC
------------------QUIZ---------------
-- SELECT channel, AVG(event_count) AS averagE
-- FROM 
-- (SELECT DATE_TRUNC('day',occurred_at),channel, COUNT(*) AS event_count FROM web_events 
-- GROUP BY 1,2
-- ) SUB
-- GROUP BY 1
-- ORDER BY 2 DESC
---------------More on Subqueries-------------------
-- SELECT*
--   FROM orders
--   WHERE DATE_TRUNC('month',occurred_at)=
-- (SELECT DATE_TRUNC('month',MIN(occurred_at)) "minum"
--  FROM orders)
--  ORDER BY occurred_at
-------------------Quiz-------------------
-- SELECT SUM(o.total_amt_usd) FROM orders o 
-- WHERE DATE_TRUNC('month',occurred_at)=
-- (SELECT DATE_TRUNC('month',MIN(occurred_at)) "minum"
-- FROM orders)
                            /*Quiz-SUbquery mania*/
							
		/*Question 1(First solved using aggregate and then SUBQUERY)*/
--Q.1-Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales----

/*Q2:For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?*/

-- SELECT r.name region_name,COUNT(o.id) "no of orders"
-- FROM orders o
-- JOIN accounts a ON o. account_id=a.id
-- JOIN sales_reps s ON s.id=a.sales_rep_id 
-- JOIN region r ON r.id=s.region_id
-- GROUP BY 1
-- HAVING SUM(o.total_amt_usd)
-- =(SELECT MAX(total_amount) FROM (SELECT r.name region_name,SUM(o.total_amt_usd) total_amount 
-- FROM orders o
-- JOIN accounts a ON o. account_id=a.id
-- JOIN sales_reps s ON s.id=a.sales_rep_id 
-- JOIN region r ON r.id=s.region_id
-- GROUP BY 1)t1)

/*Q.3:How many accounts had more total purchases than the account name which has bought 
the most standard_qty paper throughout their lifetime as a customer?*/
-------------------------------------------------------------------
-- SELECT  a.name account_name,COUNT(o.id) "numbers" FROM orders o
-- JOIN accounts a 
-- ON o.account_id=a.id
-- GROUP BY 1
-- HAVING SUM(o.total)>(
-- SELECT standard_paper FROM
-- (SELECT  a.name account_name, SUM(o.standard_qty) tot_std,SUM(o.standard_qty) standard_paper FROM orders o
-- JOIN accounts a 
-- ON o.account_id=a.id
-- GROUP BY 1
-- ORDER BY 2 DESC
-- LIMIT 1)t1)
----------------------------------------------------------
/*Q.4-For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, 
how many web_events did they have for each channel?*/

-- SELECT customer,w.channel Channel,COUNT(w.id) "Web Events" FROM

-- (SELECT a.id id_no,a.name customer, SUM(o.total_amt_usd) lifetime_total
-- FROM orders o
-- JOIN accounts a
-- ON o.account_id=a.id
-- GROUP BY 1,2
-- HAVING SUM(o.total_amt_usd)
-- =(SELECT MAX(lifetime_total) FROM (SELECT a.name customer, SUM(o.total_amt_usd) lifetime_total
-- FROM orders o
-- JOIN accounts a
-- ON o.account_id=a.id
-- GROUP BY 1)t1)) t2 

-- JOIN web_events w
-- ON w.account_id=t2.id_no
-- GROUP BY 1,2

/*Q.5:What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?*/

-- SELECT AVG(top_10) lifetime_avg FROM
-- (SELECT a.id,a.name, SUM(o.total_amt_usd) top_10 
-- FROM orders o
-- JOIN accounts a
-- ON a.id=o.account_id
-- GROUP BY 1,2
-- ORDER BY 3 DESC
-- LIMIT 10 )t1;
/*Q.6-What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that spent more per order,
on average, than the average of all orders.*/ 

/* my SOLUTION WAS OF:-AVG(ALL(o.total_amt_usd)>AVG(o.total_amount_usd))
 BUT SHOULD HAVE BEEN AVG(any companies avg per order> average of all order )*/

-- SELECT Avg(t2.perorder) lifetime_AVG FROM 
-- (SELECT a.id t1_id,a.name t1_name, AVG(o.total_amt_usd) average
-- FROM orders o
-- JOIN accounts a
-- ON a.id=o.account_id
-- GROUP BY 1,2)t1

-- FULL JOIN 

-- (SELECT a.id t2_id,a.name t2_name, o.total_amt_usd perorder
-- FROM orders o
-- JOIN accounts a
-- ON a.id=o.account_id
-- GROUP BY 1,2,3
-- )t2

-- ON t2.t2_id=t1.t1_id 
-- where t2.perorder>t1.average

--                                /*SUBQUERIES USING WITH*/
WITH events AS (SELECT DATE_TRUNC('day',occurred_at) AS day,
  channel,
  COUNT(*) AS event_count
 FROM web_events
  GROUP BY 1,2)
 

SELECT channel,
        AVG(event_count) AS avg_event_count
 FROM events
 
 GROUP BY 1
 ORDER BY 2 DESC












 






