create table bronze.payments_raw(
    payment_id string,
    order_id string,
    payment_date string,
    payment_method string,
    amount string,
    currency string,
    payment_status string,
    ingested_at timestamp default current_timestamp
);


copy into bronze.payments_raw (
    payment_id,
    order_id,
    payment_date,
    payment_method,
    amount,
    currency,
    payment_status
)
from @bronze.csv_stage/payments.csv
file_format = (
    type = 'CSV'
    skip_header = 1
    field_optionally_enclosed_by = '"'
);