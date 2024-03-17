SELECT *
FROM pizza_sales

--Percentage Sales by Pizza Order
SELECT pizza_size, CAST(SUM(total_price)
*
100
/
(SELECT SUM(total_price) FROM pizza_sales) AS decimal (10,2)) AS '%TotalSalesBySize'
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY '%TotalSalesBySize' DESC