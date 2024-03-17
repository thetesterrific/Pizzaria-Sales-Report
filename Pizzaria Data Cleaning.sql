--Printing all data from Pizza Sales table
SELECT *
FROM pizza_sales

--Printing Total Revenue
SELECT SUM(total_price) AS 'Total Revenue'
FROM pizza_sales

--Total Pizzas Sold
SELECT SUM(quantity) AS 'Total Pizza Sold'
FROM pizza_sales

--Total Orders Placed
SELECT COUNT (DISTINCT order_id) AS 'Total Order'
FROM pizza_sales

--Printing Average Order Value i.e the average amount spent per order
--Calculated by dividing the total revenue by the total number oforders
SELECT SUM (total_price)
/
COUNT(DISTINCT order_id) AS 'Average Order Value'
FROM pizza_sales

--Average Pizzas Per Order i.e average number of pizza sold per order
--Calculated by dividing the total number of pizzas sold by the total number of orders
SELECT CAST
(CAST(SUM(quantity) AS DECIMAL (10,2))
/
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS 'Avg Pizza Per Order'
FROM pizza_sales

--Order Daily Trend
SELECT DATENAME(WEEKDAY,order_date) AS 'Order Day',
COUNT(DISTINCT order_id) AS 'Total Orders'
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY,order_date)

--Order Monthly Trend
SELECT DATENAME(MONTH, order_date) AS 'Order Month',
COUNT(DISTINCT order_id) AS 'Total Orders'
FROM pizza_sales
	GROUP BY DATENAME(MONTH, order_date)
	ORDER BY 'Total Orders' DESC

--Top 5 Best Sellers By Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

--Bottom 5 Sellers By Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity

--Top 5 Best Sellers By Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 Sellers By Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders

--Top 5 Best Sellers By Total Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

--Bottom 5 Sellers By Total Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity

--Percentage Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price)
*
100
/
(SELECT SUM(total_price) FROM pizza_sales) AS decimal (10,2)) AS '%TotalSalesBySize'
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY '%TotalSalesBySize' DESC

--Percentage of Sales by Pizza Category
SELECT pizza_category, SUM(total_price)
*
100
/
(SELECT SUM(total_price) FROM pizza_sales) AS '%TotalSalesByCategory'
FROM pizza_sales 
GROUP BY pizza_category