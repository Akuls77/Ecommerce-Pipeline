create table silver.order_items as
select
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    cast(oi.quantity as number) as quantity,
    cast(oi.unit_price as number(10, 2)) as unit_price
from bronze.order_items_raw as oi
inner join silver.orders as o
    on oi.order_id = o.order_id
inner join silver.products p
    on oi.product_id = p.product_id
where cast(oi.quantity as number) > 0
  and cast(oi.unit_price as number) >= 0;