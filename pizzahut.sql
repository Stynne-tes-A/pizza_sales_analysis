			-- KPI REQUIREMENTS -- 

-- TABLE --
SELECT * FROM pizza_sales;

-- Total revenue --

SELECT ROUND(SUM(total_price),2) AS total_revenue FROM pizza_sales;

-- Average order value -- 

SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM pizza_sales;

-- Total pizza sold --

SELECT SUM(quantity) AS total_pizza_sold FROM pizza_sales;

-- Total orders placed --

SELECT COUNT(DISTINCT order_id) AS total_order_placed FROM pizza_sales

-- Average pizza per order --

SELECT SUM(quantity) / COUNT(DISTINCT order_id)  AS avg_sales_order FROM pizza_sales

			-- CHART requirements -- 

-- Total orders by days --

SELECT DATENAME(DW, order_date) AS order_day , COUNT(DISTINCT order_id) as total_order
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)


-- Montly trends for total orders --

SELECT DATENAME(MONTH, order_date) AS order_month ,
COUNT(DISTINCT order_id) as total_order
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY DATENAME(MONTH, order_date)

-- Percentage of sales by category--

SELECT pizza_category , SUM(total_price)*100/ (SELECT SUM(total_price) 
FROM pizza_sales) AS percentage_of_sales 
FROM pizza_sales 
GROUP BY pizza_category;

-- Percentage of sales by size--

SELECT pizza_size , SUM(total_price)*100/ (SELECT SUM(total_price) 
FROM pizza_sales) AS percentage_of_sales 
FROM pizza_sales 
GROUP BY pizza_size;

-- Total sales by pizza --

SELECT pizza_name, SUM(total_price) AS toal_sales_pizza FROM pizza_sales
GROUP BY pizza_name;


-- Total sales by TOP 5 pizza --

SELECT TOP 5 pizza_name, SUM(total_price) AS toal_sales_pizza FROM pizza_sales
GROUP BY pizza_name;

-- Total quantities by TOP 5 pizza --

SELECT TOP 5 pizza_name, SUM(quantity) AS toal_sales_pizza FROM pizza_sales
GROUP BY pizza_name;


SELECT DATENAME(YEAR , order_date) AS year_sales, DATENAME(MONTH , order_date), 
COUNT(DISTINCT order_id) as total_order FROM pizza_sales
WHERE DATEPART(QUARTER , order_id) = 2
GROUP BY DATENAME(YEAR , order_date), DATENAME(MONTH , order_date);
















