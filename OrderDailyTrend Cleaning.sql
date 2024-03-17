SELECT *
FROM pizza_sales

--Order Daily Trend
SELECT DATENAME(WEEKDAY,order_date) AS 'Order Day',
COUNT(DISTINCT order_id) AS 'Total Orders'
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY,order_date)