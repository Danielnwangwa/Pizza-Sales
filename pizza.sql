--KPI Requirements

--1. What is the total revenue? The total revenue is found by suming the total_price of all the pizza orders.

SELECT	SUM(total_price) AS Total_Revenue 
FROM	pizza_sales;

--2. Average Order Value: The average order value is found by Dividing the total revenue by the total number of orders.

SELECT	SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_order_value
FROM	pizza_sales;


--3. Total Pizzas Sold: This is calculated by taking the sum of the quantities of all pizzas sold.

SELECT	SUM(quantity) AS Total_pizza_sold 
FROM	pizza_sales;

--4. Total Orders: This is the total number of orders placed.

SELECT	COUNT(DISTINCT order_id) AS Total_orders 
FROM	pizza_sales;

--5. Average Pizzas Per Order: The average number of pizzas sold per order, 
--calculated by diving the total number of pizzas sold by the total number of orders.

SELECT	CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
		CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
		AS Average_pizza_per_order 
FROM	pizza_sales;



--CHARTS REQUIREMENTS
--In this section, we would like to visualise various aspects of our pizza sales data to 
--gain insights and understand key trends. Charts will be created for visualisation using 
--Power BI Dashboard. We have identified the following requirements for creating the charts:


--1. Daily Trend for Total Orders:

SELECT		DATENAME(DW, order_date) AS order_day, 
			COUNT(DISTINCT order_id) AS Total_orders
FROM		pizza_sales
GROUP BY	DATENAME(DW, order_date)
ORDER BY	Total_orders;



--2. Monthly Trend for Total Orders:

SELECT		DATENAME(MONTH, order_date) AS Month_name, 
			COUNT(DISTINCT order_id) AS Total_orders
FROM		pizza_sales
GROUP BY	DATENAME(MONTH, order_date)
ORDER BY	Total_orders DESC



--3. Percentage of sales by Pizza Category:

SELECT		pizza_category, 
			SUM(total_price) AS Total_sales, 
			SUM(total_price) * 100 / 
			(SELECT SUM(total_price) FROM pizza_sales) AS Pct_sales
FROM		pizza_sales
GROUP BY	pizza_category;



--4. Percentage sale by Pizza Size:

SELECT		pizza_size, 
			CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales, 
			CAST(SUM(total_price) * 100 / 
			(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Pct_sales
FROM		pizza_sales
GROUP BY	pizza_size
ORDER BY	Pct_sales DESC;


--5. Top 5 Pizzas by Revenue:

SELECT		TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM		pizza_sales
GROUP BY	pizza_name
ORDER BY	Total_Revenue DESC


--6.  Bottom 5 Pizzas by Revenue:

SELECT		TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM		pizza_sales
GROUP BY	pizza_name
ORDER BY	Total_Revenue ASC


--7.  Top 5 Pizzas by Quantity:

SELECT		TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM		pizza_sales
GROUP BY	pizza_name
ORDER BY	Total_Quantity DESC


--8. Bottom 5 Pizzas by Quantity:

SELECT		TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM		pizza_sales
GROUP BY	pizza_name
ORDER BY	Total_Quantity

--9.  Top 5 Pizzas by Total Orders:

SELECT		TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM		pizza_sales
GROUP BY	pizza_name
ORDER BY	Total_Orders DESC;


--10.  Bottom 5 Pizzas by Total Orders:

SELECT		TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM		pizza_sales
GROUP BY	pizza_name
ORDER BY	Total_Orders ASC;









