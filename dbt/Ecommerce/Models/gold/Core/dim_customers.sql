select
  row_number() over () as customer_sk,
  customer_id,
  customer_unique_id,
  city,
  state,
  latitude,
  longitude
from {{ source('ecommerce_silver', 'customers') }}