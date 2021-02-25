--Validate que todos los clientes en ordenes existan en el catalogo de clientes
Select customer_id
From {{ref('stg_orders')}}
Where NOT EXISTS (Select customer_id
                     FROM {{ref('stg_customers')}})
