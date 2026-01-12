CREATE OR REPLACE TABLE SILVER.ORDERS AS
SELECT
    o.order_id,
    o.customer_id,
    TO_DATE(o.order_date) AS order_date,
    o.order_status,
    CAST(o.order_total AS NUMBER(12,2)) AS order_total,
    o.currency,
    CASE
        WHEN c.customer_id IS NULL THEN TRUE
        ELSE FALSE
    END AS is_customer_missing
FROM BRONZE.ORDERS_RAW o
LEFT JOIN SILVER.CUSTOMERS c
    ON o.customer_id = c.customer_id
WHERE o.order_id IS NOT NULL
  AND CAST(o.order_total AS NUMBER) >= 0;
