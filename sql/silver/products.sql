create table silver.products as
select
    product_id,
    product_name,
    category,
    cast(price as decimal(10, 2)) as price,
    currency,
    case
        when lower(is_active) = 'true' then true
        else false
    end as is_active,
    TO_DATE(created_at) as created_date
from bronze.products_raw
where product_id is not null
  and cast(price as number) >= 0;