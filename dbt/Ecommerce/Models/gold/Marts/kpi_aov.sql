{{ config(materialized = 'table') }}

select
    avg(payment_total) as average_order_value
from {{ ref('fact_order_payments') }}