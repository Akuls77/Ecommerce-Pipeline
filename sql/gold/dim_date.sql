CREATE OR REPLACE TABLE GOLD.DIM_DATE AS
SELECT DISTINCT
    order_date AS date,
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    DAY(order_date) AS day,
    DAYOFWEEK(order_date) AS day_of_week,
    WEEK(order_date) AS week_of_year
FROM SILVER.ORDERS;