create or replace table bronze.customers_raw (
    customer_id string,
    first_name string,
    last_name string,
    email string,
    phone string,
    country string,
    created_at string,
    is_active string,
    ingested_at timestamp default current_timestamp
);


copy into bronze.customers_raw (
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    country,
    created_at,
    is_active
)
from @bronze.csv_stage/customers.csv
file_format = (
    type = 'CSV'
    skip_header = 1
    field_optionally_enclosed_by = '"'
);