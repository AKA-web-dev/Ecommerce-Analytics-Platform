{{ config(
    materialized='incremental',
    unique_key='order_item_id'
) }}

select
  oi.order_item_id,
  oi.order_id,
  o.order_purchase_ts as order_date,
  c.customer_sk,
  p.product_sk,
  s.seller_sk,
  oi.price,
  oi.freight_value,
  pay.payment_value,
  r.review_score
from {{ source('ecommerce_silver', 'order_items') }} oi
join {{ source('ecommerce_silver', 'orders') }} o
  on oi.order_id = o.order_id
left join {{ ref('dim_customers') }} c
  on o.customer_id = c.customer_id
left join {{ ref('dim_products') }} p
  on oi.product_id = p.product_id
left join {{ ref('dim_sellers') }} s
  on oi.seller_id = s.seller_id
left join (
  select
    order_id,
    sum(payment_value) as payment_value
  from {{ source('ecommerce_silver', 'payments') }}
  group by order_id
) pay
on oi.order_id = pay.order_id
left join {{ source('ecommerce_silver', 'reviews') }} r
  on oi.order_id = r.order_id

{% if is_incremental() %}
where o.order_purchase_ts > (select max(order_date) from {{ this }})
{% endif %}