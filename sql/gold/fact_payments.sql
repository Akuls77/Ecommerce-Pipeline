CREATE OR REPLACE TABLE GOLD.FACT_PAYMENTS AS
SELECT
    payment_id,
    order_id,
    payment_date,
    payment_method,
    amount,
    currency,
    payment_status
FROM SILVER.PAYMENTS;