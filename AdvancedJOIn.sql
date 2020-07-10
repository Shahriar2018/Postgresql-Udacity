--SELECT a.primary_poc,w.occurred_at,w.channel,a.name
--FROM web_events w
--JOIN accounts a 
--ON w.account_id=a.id
--WHERE a.name='Walmart'
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%JOIN Questions Part 1(Q.2)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--SELECT r.name region,s.name rep,a.name account
--FROM accounts a
--JOIN sales_reps s
--ON s.id=a.sales_rep_id
--JOIN region r
--ON s.region_id=r.id
--ORDER BY a.name
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%JOIN Questions Part 1(Q.3)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--SELECT r.name region,a.name account,
--o.total_amt_usd/(o.total+0.01) "unit price"
--FROM region r
--JOIN sales_reps s
--ON s.region_id=r.id
--JOIN accounts a
--ON a.sales_rep_id=s.id
--JOIN orders o
--ON o.account_id=a.id
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%JOINs and FILTERING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SELECT orders.*,
       accounts.*,
 FROM orders
 LEFT JOIN accounts
  ON orders.account_id=accounts.id
 WHERE accounts.sales_rep_id=321500



