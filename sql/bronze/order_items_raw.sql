create table bronze.order_items_raw(
    order_item_id string,
    order_id string,
    product_id string,
    quantity string,
    unit_price string,
    ingested_at timestamp default current_timestamp
);


copy into bronze.order_items_raw (
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price
)
from @bronze.csv_stage/order_items.csv
file_format = (
    type = 'CSV'
    skip_header = 1
    field_optionally_enclosed_by = '"'
);