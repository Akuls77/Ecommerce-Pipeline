create table silver.orders as
select
    o.order_id,
    o.customer_id,
    TO_DATE(o.order_date) as order_date,
    o.order_status,
    cast(o.order_total as decimal(12, 2)) as order_total,
    o.currency
from bronze.orders_raw o
inner join silver.customers c
    on o.customer_id = c.customer_id
where o.order_id is not null
    and cast(o.order_total as number) >= 0;