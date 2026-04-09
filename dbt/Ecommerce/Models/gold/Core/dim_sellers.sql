select
  row_number() over () as seller_sk,
  seller_id,
  city,
  state,
  latitude,
  longitude
from {{ source('ecommerce_silver', 'sellers') }}