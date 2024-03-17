SELECT *
FROM pizza_sales

--Average Pizzas Per Order i.e average number of pizza sold per order
--Calculated by dividing the total number of pizzas sold by the total number of orders
SELECT CAST
(CAST(SUM(quantity) AS DECIMAL (10,2))
/
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS 'Avg Pizza Per Order'
FROM pizza_sales