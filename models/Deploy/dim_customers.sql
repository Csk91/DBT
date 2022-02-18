
with customers as (

select * from {{ ref('stg_customers')}}

),

orders as (

select * from {{ ref('fact_orders') }}

),

customer_orders as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    from orders

    group by 1

),


final as (

    select
        customers.customer_id,
        customers.full_name,
        coalesce(MONTHNAME(customer_orders.first_order_date),'No Month Name') as Month_Name,
        (case when customer_orders.first_order_date is null then '2050-12-31' else first_order_date end) as first_order_date,
        (case when customer_orders.most_recent_order_date is null then '2050-12-31' else most_recent_order_date end) as most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        coalesce(customer_orders.lifetime_value,0) as lifetime_value
    from customers
    left join customer_orders using (customer_id)

)

select * from final