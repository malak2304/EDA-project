-- Top 5 highest revenue products
SELECT TOP 5
dp.product_name,
SUM(fs.sales_amount) AS Total_Revenue
FROM gold.fact_sales fs
LEFT JOIN gold.dim_products dp
    ON dp.product_key = fs.product_key
GROUP BY dp.product_name
ORDER BY Total_Revenue DESC;

-- Using ROW_NUMBER()
SELECT *
FROM (
    SELECT dp.product_name,
           SUM(fs.sales_amount) AS Total_Revenue,
           ROW_NUMBER() OVER (ORDER BY SUM(fs.sales_amount) DESC) AS rank_products
    FROM gold.fact_sales fs
    LEFT JOIN gold.dim_products dp
        ON dp.product_key = fs.product_key
    GROUP BY dp.product_name
) t
WHERE rank_products <= 5;

-- Worst 5 products
SELECT TOP 5
dp.product_name,
SUM(fs.sales_amount) AS Total_Revenue
FROM gold.fact_sales fs
LEFT JOIN gold.dim_products dp
    ON dp.product_key = fs.product_key
GROUP BY dp.product_name
ORDER BY Total_Revenue;

-- Top 10 highest revenue customers
SELECT TOP 10
dc.customer_key, dc.first_name, dc.last_name,
SUM(fs.sales_amount) AS Total_Revenue
FROM gold.fact_sales fs
LEFT JOIN gold.dim_customers dc
    ON dc.customer_key = fs.customer_key
GROUP BY dc.customer_key, dc.first_name, dc.last_name
ORDER BY Total_Revenue DESC;

-- Bottom 3 by number of orders
SELECT TOP 3
c.customer_key, c.first_name, c.last_name,
COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders;
