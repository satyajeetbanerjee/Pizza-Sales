--KPI's
--Sum of Total price of all pizza orders
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales


--Average Order value(Calculated by dividing the total_price by total no of orders)
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Average_Order_Value from pizza_sales


--Sum of quantity of total pizza sold
SELECT SUM(quantity) AS Total_Pizza_Sold from pizza_sales

--Total orders placed
SELECT COUNT(Distinct order_id) AS Total_Pizza from pizza_sales

--Average pizzas per order(Calculated by dividing the total no of pizzas sold by the total no of orders)
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/
CAST(COUNT(Distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVG_Pizza_Per_order from pizza_sales



--Daily Trend for Total orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--Monthly Trend for Total orders
SELECT DATENAME(MONTH, order_date) AS order_month, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY total_orders DESC

--Percentage of sales by pizza category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

--Percentage of sales by pizza size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

--Total pizzas sold by pizza category
SELECT pizza_category,SUM(quantity) as Total_Quantity_Sold 
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--Top 5 pizzas by revenue
SELECT TOP(5) pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC;

--Bottom 5 pizzas by revenue
SELECT TOP(5) pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC;

--Top 5 pizzas by quantity
SELECT TOP(5) pizza_name, SUM(quantity) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC;

--Bottom 5 pizzas by revenue
SELECT TOP(5) pizza_name, SUM(quantity) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC;

--Top 5 pizzas by Total Order
SELECT TOP(5) pizza_name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC;

--Bottom 5 pizzas by Total Order
SELECT TOP(5) pizza_name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders ASC;
