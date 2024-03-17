SELECT *
FROM pizza_sales

--Top 5 Best Sellers By Revenue, Total Quantity & Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC