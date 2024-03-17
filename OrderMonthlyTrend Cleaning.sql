SELECT *
FROM pizza_sales

--Order Monthly Trend
SELECT DATENAME(MONTH, order_date) AS 'Order Month',
COUNT(DISTINCT order_id) AS 'Total Orders'
FROM pizza_sales
	GROUP BY DATENAME(MONTH, order_date)
	ORDER BY 'Total Orders' DESC