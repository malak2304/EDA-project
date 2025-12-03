/* ===============================
   04 - Measures Exploration
   =============================== */

/* 1️⃣ Total Revenue */
select sum(sales_amount) as total_revenue
from gold.fact_sales;

/* 2️⃣ Total Quantity Sold */
select sum(quantity) as total_quantity
from gold.fact_sales;

/* 3️⃣ Total Customers */
select count(distinct customer_key) as total_customers
from gold.fact_sales;

/* 4️⃣ Total Orders */
select count(order_number) as total_orders
from gold.fact_sales;

/* 5️⃣ Average Sales per Order */
select avg(sales_amount) as avg_sales_per_order
from gold.fact_sales;

/* 6️⃣ Revenue per Customer */
select 
customer_key,
sum(sales_amount) as customer_revenue
from gold.fact_sales
group by customer_key;

/* 7️⃣ Order Count per Customer */
select 
customer_key,
count(order_number) as customer_order_count
from gold.fact_sales
group by customer_key;

/* 8️⃣ Average Quantity per Order */
select avg(quantity) as avg_quantity_per_order
from gold.fact_sales;

/* 9️⃣ Average Price per Product */
select 
product_key,
avg(sales_amount/NULLIF(quantity,0)) as avg_price
from gold.fact_sales
group by product_key;

/* 🔟 Max/Min Sales Amount */
select
max(sales_amount) as max_sales_amount,
min(sales_amount) as min_sales_amount
from gold.fact_sales;

/* 1️⃣1️⃣ Total Revenue by Year */
select 
year(order_date) as order_year,
sum(sales_amount) as yearly_revenue
from gold.fact_sales
group by year(order_date)
order by order_year;

/* 1️⃣2️⃣ Average Customer Age */
select avg(DATEDIFF(year, birthdate, GETDATE())) as avg_customer_age
from gold.dim_customers;

/* 1️⃣3️⃣ Revenue by Gender */
select 
c.gender,
sum(f.sales_amount) as revenue
from gold.fact_sales f
join gold.dim_customers c 
    on f.customer_key = c.customer_key
group by c.gender;
