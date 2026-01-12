create or replace table silver.customers as
select
  customer_id,
  first_name,
  last_name,
  email,
  phone,
  country,
  TO_DATE(created_at) as created_date,
  case
    when lower(is_active) = 'true' then true
    else false
  end as is_active,
  ingested_at
from (
  select *, 
    row_number() over (
        partition by customer_id
        order by ingested_at desc
    ) as rn
    from bronze.customers_raw
    where customer_id is not null
)
where rn = 1
and email like '%@%';