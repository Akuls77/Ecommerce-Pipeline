CREATE OR REPLACE TABLE GOLD.FACT_ORDER_ITEMS AS
SELECT
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS revenue
FROM SILVER.ORDER_ITEMS oi;