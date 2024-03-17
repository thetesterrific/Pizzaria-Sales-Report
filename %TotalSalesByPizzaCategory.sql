SELECT *
FROM pizza_sales

--Percentage of Sales by Pizza Category
SELECT pizza_category, SUM(total_price)
*
100
/
(SELECT SUM(total_price) FROM pizza_sales) AS '%TotalSalesByCategory'
FROM pizza_sales 
GROUP BY pizza_category