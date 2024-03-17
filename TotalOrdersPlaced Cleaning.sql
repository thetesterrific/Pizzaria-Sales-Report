SELECT *
FROM pizza_sales

--Total Orders Placed
SELECT COUNT (DISTINCT order_id) AS 'Total Order'
FROM pizza_sales