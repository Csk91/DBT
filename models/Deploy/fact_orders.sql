with Orders as (

    select 
    p.orderid,
    c.customer_id,
    p.amount
    from stg_payments as p 
    left join stg_customers as c 
    on p.id = c.CUSTOMER_ID
)

select * from orders