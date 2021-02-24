with payment as (

    select
        id            as payment_id,
        orderid       as order_id,
        paymentmethod as paymenth_metod,
        status,
        (amount/100) as amount,        --amount is stored in cents, convert it to dollars
        created as created_at
    from raw.stripe.payment

)

select * from payment