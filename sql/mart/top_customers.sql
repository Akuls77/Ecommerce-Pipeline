CREATE OR REPLACE TABLE MART.TOP_CUSTOMERS AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(foi.revenue) AS lifetime_revenue,
    COUNT(DISTINCT fo.order_id) AS total_orders
FROM GOLD.DIM_CUSTOMER c
JOIN GOLD.FACT_ORDERS fo
    ON c.customer_id = fo.customer_id
JOIN GOLD.FACT_ORDER_ITEMS foi
    ON fo.order_id = foi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY lifetime_revenue DESC;