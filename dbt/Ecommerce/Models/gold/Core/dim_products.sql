select
  row_number() over () as product_sk,
  product_id,
  category,
  product_weight_g,
  product_length_cm,
  product_height_cm,
  product_width_cm
from {{ source('ecommerce_silver', 'products') }}