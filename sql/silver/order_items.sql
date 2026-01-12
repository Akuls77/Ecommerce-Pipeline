CREATE OR REPLACE TABLE SILVER.ORDER_ITEMS AS
SELECT
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    CAST(oi.quantity AS NUMBER) AS quantity,
    CAST(oi.unit_price AS NUMBER(10,2)) AS unit_price
FROM BRONZE.ORDER_ITEMS_RAW oi
LEFT JOIN SILVER.ORDERS o
    ON oi.order_id = o.order_id
LEFT JOIN SILVER.PRODUCTS p
    ON oi.product_id = p.product_id
WHERE CAST(oi.quantity AS NUMBER) > 0
  AND CAST(oi.unit_price AS NUMBER) >= 0;
