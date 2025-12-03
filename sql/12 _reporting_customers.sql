/* ============================================
   12 - Reporting View: report_customers
   ============================================ */

CREATE VIEW gold.report_customers AS
SELECT 
    c.customer_key,
    c.customer_id,
    c.full_name,
    c.gender,
    c.country,
    c.city,
    c.birthdate,
    DATEDIFF(year, c.birthdate, GETDATE()) AS age,

    -- Total KPIs
    COUNT(f.order_number) AS total_orders,
    SUM(f.quantity) AS total_quantity,
    SUM(f.sales_amount) AS total_revenue,

    -- Average KPIs
    AVG(f.sales_amount) AS avg_order_value,
    AVG(f.quantity) AS avg_quantity_per_order,

    -- First & Last Purchase
    MIN(f.order_date) AS first_purchase_date,
    MAX(f.order_date) AS last_purchase_date,

    -- Recency (days since last purchase)
    DATEDIFF(day, MAX(f.order_date), GETDATE()) AS recency_days
FROM gold.fact_sales f
JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
GROUP BY 
    c.customer_key,
    c.customer_id,
    c.full_name,
    c.gender,
    c.country,
    c.city,
    c.birthdate;
