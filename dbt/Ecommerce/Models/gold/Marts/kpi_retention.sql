{{ config(materialized = 'table') }}

with customer_orders as (
    select
        customer_id,
        date(date_trunc(order_purchase_ts, month)) as order_month
    from {{ source('ecommerce_silver', 'orders') }}
    where order_status = 'delivered'
      and delivered_ts is not null
    group by customer_id, order_month

),
retention as (
    select
        a.order_month as cohort_month,

        count(distinct a.customer_id) as active_customers,

        countif(b.customer_id is not null) as retained_customers

    from customer_orders a
    left join customer_orders b
        on a.customer_id = b.customer_id
       and b.order_month = date_add(a.order_month, interval 1 month)

    group by cohort_month
)
select
    cohort_month,
    active_customers,
    retained_customers,
    safe_divide(retained_customers, active_customers) as retention_rate
from retention
order by cohort_month