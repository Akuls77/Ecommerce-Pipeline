CREATE OR REPLACE TABLE SILVER.SHIPMENTS AS
SELECT
    s.shipment_id,
    s.order_id,
    TO_DATE(s.shipment_date) AS shipment_date,
    TO_DATE(s.delivery_date) AS delivery_date,
    s.carrier,
    s.shipment_status
FROM BRONZE.SHIPMENTS_RAW s
INNER JOIN SILVER.ORDERS o
    ON s.order_id = o.order_id
WHERE TO_DATE(s.delivery_date) >= TO_DATE(s.shipment_date);