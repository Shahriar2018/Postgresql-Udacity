---%The COUNT function is returning a count of all the rows that
--contains some non-NULL data.Is typically equals to number of rows in the table
-- SELECT COUNT(*) TOTAL FROM accounts
-- WHERE primary_poc IS NOT NULL
-----------------Usually equivalent----------------------------------
--select count (accounts.id)from accounts
------------------ Total number----------------
-- SELECT standard_amt_usd+gloss_amt_usd AS total_standard_gloss
-- FROM orders;
-------------------determining meading-------
-- SELECT * FROM (SELECT total_amt_usd FROM orders ORDER BY total_amt_usd LIMIT 3457) 
-- AS table1 ORDER BY total_amt_usd DESC LIMIT 2
-----------------------------Group BY--------------------------------------------------
--SELECT * FROM orders
-- SELECT account_id,
--        SUM(standard_qty) AS standard_sum,
--        SUM(gloss_qty) AS gloss_sum,
-- 	   SUM(poster_qty) AS poster_sum
-- FROM orders
-- WHERE account_id=1001 --comment: The GROUP BY always goes between where and ORDER BY
-- GROUP BY account_id 
-- ORDER BY account_id DESC


	   



