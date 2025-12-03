-- Total customers by countries
select country, count(customer_id) total_customers
from gold.dim_customers
group by country
order by total_customers desc;

-- Total customers by gender
select gender, count(customer_id) total_customers
from gold.dim_customers
group by gender
order by total_customers desc;

-- Total products by category
select category, count(product_key) total_products
from gold.dim_products
group by category
order by total_products desc;

-- Average cost by category
select category, avg(cost) as avg_cost
from gold.dim_products
group by category
order by avg_cost desc;

-- Total revenue by category
SELECT dp.category, SUM(fs.sales_amount) AS Total_Category_Revenue
FROM gold.fact_sales fs
LEFT JOIN gold.dim_products dp
    ON dp.product_key = fs.product_key
GROUP BY dp.category
ORDER BY Total_Category_Revenue DESC;

-- Revenue per customer
SELECT c.customer_key, c.first_name, c.last_name,
       SUM(s.sales_amount) AS Total_Customer_Revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
    ON s.customer_key = c.customer_key
GROUP BY c.customer_key, first_name, last_name
ORDER BY Total_Customer_Revenue DESC;

-- Sold items per country
SELECT c.country, SUM(s.quantity) total_sold_items
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
    ON s.customer_key = c.customer_key
GROUP BY c.country
ORDER BY total_sold_items DESC;
