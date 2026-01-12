CREATE OR REPLACE TABLE SILVER.PAYMENTS AS
SELECT
    p.payment_id,
    p.order_id,
    TO_DATE(p.payment_date) AS payment_date,
    p.payment_method,
    CAST(p.amount AS NUMBER(12,2)) AS amount,
    p.currency,
    p.payment_status,
    CASE
        WHEN o.order_id IS NULL THEN TRUE
        ELSE FALSE
    END AS is_order_missing
FROM BRONZE.PAYMENTS_RAW p
LEFT JOIN SILVER.ORDERS o
    ON p.order_id = o.order_id
WHERE CAST(p.amount AS NUMBER) >= 0;