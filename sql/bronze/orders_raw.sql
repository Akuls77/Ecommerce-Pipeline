create table bronze.orders_raw(
    order_id string,
    customer_id string,
    order_date string,
    order_status string,
    order_total string,
    currency string,
    ingested_at timestamp default current_timestamp
);


copy into bronze.orders_raw (
    order_id,
    customer_id,
    order_date,
    order_status,
    order_total,
    currency
)
from @bronze.csv_stage/orders.csv
file_format = (
    type = 'CSV'
    skip_header = 1
    field_optionally_enclosed_by = '"'
);