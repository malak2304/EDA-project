-- First & last order
select 
min(order_date) first_order_date,
max(order_date) last_order_date,
datediff(year,min(order_date),max(order_date)) order_range_years
from gold.fact_sales;

-- Youngest & oldest customers
select min(birthdate) as yougest_customer,
max(birthdate) as oldest_customer,
DATEDIFF(year,min(birthdate),GETDATE()) as oldest_age,
DATEDIFF(year,max(birthdate),GETDATE()) as youngest_age
from gold.dim_customers;
