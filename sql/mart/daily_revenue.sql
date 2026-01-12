CREATE OR REPLACE TABLE MART.DAILY_REVENUE AS
SELECT
    d.date AS revenue_date,
    SUM(foi.revenue) AS total_revenue,
    COUNT(DISTINCT foi.order_id) AS total_orders
FROM GOLD.FACT_ORDER_ITEMS foi
JOIN GOLD.FACT_ORDERS fo
    ON foi.order_id = fo.order_id
JOIN GOLD.DIM_DATE d
    ON fo.order_date = d.date
GROUP BY d.date;