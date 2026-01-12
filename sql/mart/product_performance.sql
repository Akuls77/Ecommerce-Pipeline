CREATE OR REPLACE TABLE MART.PRODUCT_PERFORMANCE AS
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(foi.quantity) AS total_units_sold,
    SUM(foi.revenue) AS total_revenue
FROM GOLD.DIM_PRODUCT p
JOIN GOLD.FACT_ORDER_ITEMS foi
    ON p.product_id = foi.product_id
GROUP BY p.product_id, p.product_name, p.category;