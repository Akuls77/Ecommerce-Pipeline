CREATE OR REPLACE TABLE GOLD.FACT_ORDERS AS
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    o.order_total,
    o.currency
FROM SILVER.ORDERS o;