create table bronze.shipments_raw(
    shipment_id string,
    order_id string,
    shipment_date string,
    delivery_date string,
    carrier string,
    shipment_status string,
    ingested_at timestamp default current_timestamp
);


copy into bronze.shipments_raw (
    shipment_id,
    order_id,
    shipment_date,
    delivery_date,
    carrier,
    shipment_status
)
from @bronze.csv_stage/shipments.csv
file_format = (
    type = 'CSV'
    skip_header = 1
    field_optionally_enclosed_by = '"'
);