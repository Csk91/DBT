with order_payments as (

    select 
    order_id,
    sum(case when status = 'success' then amount end) as amount
    from stg_payments
    group by 1
)

select * from order_payments