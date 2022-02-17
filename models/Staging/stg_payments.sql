with payments as (

    select 
    id,
    orderid,
    paymentmethod as payment_method,
    status,
    amount,
    created,
    _batched_at

    from raw.stripe.payment
)

select * from payments