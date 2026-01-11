create table bronze.products_raw(
    product_id string,
    product_name string,
    category string,
    price string,
    currency string,
    is_active string,
    created_at string,
    ingested_at timestamp default current_timestamp
);


copy into bronze.products_raw (
    product_id,
    product_name,
    category,
    price,
    currency,
    is_active,
    created_at
)
from @bronze.csv_stage/products.csv
file_format = (
    type = 'CSV'
    skip_header = 1
    field_optionally_enclosed_by = '"'
);