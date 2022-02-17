with customers as (
    
    select
        id as customer_id,
        first_name,
        last_name,
  left(last_name,'1') as updated_last_name,
  concat(first_name,' ', updated_last_name) as full_name
 
    from raw.jaffle_shop.customers

)

select * from customers
