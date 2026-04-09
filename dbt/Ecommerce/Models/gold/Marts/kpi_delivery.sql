--select
--  count_if(delivered_ts <= estimated_delivery_ts)
--  / count(*) as on_time_delivery_rate
--from {{ ref('fact_orders') }}
{{ config(materialized = 'table') }}

with orders as (

    select
        order_id,
        order_purchase_ts,
        delivered_ts,
        estimated_delivery_ts,
        order_status
    from {{ source('ecommerce_silver', 'orders') }}

)

select
    count(*) as total_orders,

    countif(
        order_status = 'delivered'
        and delivered_ts is not null
    ) as delivered_orders,

    safe_divide(
        countif(
            order_status = 'delivered'
            and delivered_ts is not null
        ),
        count(*)
    ) as delivery_rate,

    avg(
        date_diff(
            delivered_ts,
            order_purchase_ts,
            day
        )
    ) as avg_delivery_days,

    safe_divide(
        countif(
            delivered_ts > estimated_delivery_ts
        ),
        countif(delivered_ts is not null)
    ) as late_delivery_rate

from orders