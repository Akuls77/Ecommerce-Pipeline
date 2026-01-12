CREATE OR REPLACE TABLE GOLD.DIM_CUSTOMER AS
SELECT
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    country,
    created_date,
    is_active
FROM SILVER.CUSTOMERS;