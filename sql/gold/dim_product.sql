CREATE OR REPLACE TABLE GOLD.DIM_PRODUCT AS
SELECT
    product_id,
    product_name,
    category,
    price,
    currency,
    is_active,
    created_date
FROM SILVER.PRODUCTS;