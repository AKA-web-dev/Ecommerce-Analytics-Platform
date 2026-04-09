{{ config(materialized='table') }}

with payments as (
    select
        order_id,
        payment_type,
        payment_installments,
        payment_value
    from {{ source('ecommerce_silver', 'payments') }}
),
aggregated as (
    select
        order_id,
        sum(payment_value) as payment_total,
        max(payment_installments) as max_installments,
        count(*) as payment_count,
        sum(case when payment_type = 'credit_card' then payment_value else 0 end) as credit_card_amount,
        sum(case when payment_type = 'boleto' then payment_value else 0 end) as boleto_amount
    from payments
    group by order_id
)
select * from aggregated