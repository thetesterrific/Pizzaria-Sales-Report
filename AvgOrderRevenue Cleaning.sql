SELECT *
FROM pizza_sales

--Printing Average Order Value i.e the average amount spent per order
--Calculated by dividing the total revenue by the total number oforders
SELECT SUM (total_price) /COUNT(DISTINCT order_id) AS 'Average Order Value'
FROM pizza_sales