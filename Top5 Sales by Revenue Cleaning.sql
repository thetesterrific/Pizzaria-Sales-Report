SELECT *
FROM pizza_sales

--Top 5 Best Sellers By Revenue, Total Quantity & Total Orders
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity