with fct_history as (

    select service_id,
           period_id,
           energy,
           amount
    from {{ ref('stg_invoices') }}

)

select * from fct_history