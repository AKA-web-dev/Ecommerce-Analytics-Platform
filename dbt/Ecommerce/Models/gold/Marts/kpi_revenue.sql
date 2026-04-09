{{ config(materialized = 'table') }}

select
    sum(payment_total) as total_revenue
from {{ ref('fact_order_payments') }}