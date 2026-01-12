CREATE OR REPLACE TABLE SILVER.CUSTOMERS AS
SELECT
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    country,
    TO_DATE(created_at) AS created_date,
    CASE 
        WHEN LOWER(is_active) = 'true' THEN TRUE
        ELSE FALSE
    END AS is_active,
    CASE
        WHEN email LIKE '%@%' THEN TRUE
        ELSE FALSE
    END AS is_email_valid,
    ingested_at
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id
               ORDER BY ingested_at DESC
           ) AS rn
    FROM BRONZE.CUSTOMERS_RAW
    WHERE customer_id IS NOT NULL
)
WHERE rn = 1;
