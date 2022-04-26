with orders as (
    select 
        order_id,
        customer_id 
    from {{ref('stg_orders')}}

),

payment as (
        select 
            Order_Id,
            AMOUNT
        from {{ref('stg_payments')}}
),

Order_Payment as (

    select 
        orders.order_id,
        orders.customer_id,
        coalesce(payment.AMOUNT,0) as payment_amount
    from orders
    left join payment on orders.order_id = payment.order_id
)

Select * From Order_Payment
    