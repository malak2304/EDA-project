/* ============================================
   13 - Reporting View: report_products
   ============================================ */

CREATE VIEW gold.report_products AS
SELECT
    p.product_key,
    p.product_id,
    p.product_name,
    p.category,
    p.subcategory,
    p.cost_price,

    -- Total KPIs
    SUM(f.quantity) AS total_quantity_sold,
    SUM(f.sales_amount) AS total_revenue,
    COUNT(f.order_number) AS total_orders,

    -- Average KPIs
    AVG(f.quantity) AS avg_quantity_per_order,
    AVG(f.sales_amount) AS avg_sales_per_order,

    -- Calculated profit
    SUM(f.sales_amount - (p.cost_price * f.quantity)) AS total_profit,

    -- Ranking Helpers
    RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS revenue_rank,
    RANK() OVER (ORDER BY SUM(f.quantity) DESC) AS quantity_rank

FROM gold.fact_sales f
JOIN gold.dim_products p
    ON f.product_key = p.product_key
GROUP BY
    p.product_key,
    p.product_id,
    p.product_name,
    p.category,
    p.subcategory,
    p.cost_price;
