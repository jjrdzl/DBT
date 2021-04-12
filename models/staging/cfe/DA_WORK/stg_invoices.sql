with stg_invoices as (

    select id as invoice_id,
           service as service_id,
           to_char(ini_period,'YY') || to_char(ini_period,'MM')|| 
           to_char(end_period,'YY') || to_char(end_period,'MM') as period_id,           
           ini_period,
           end_period,
           ini_kwh,
           end_kwh,
           energy,
           amount
    from {{ source('DA_RAW_HASH','invoices')}}


)

select * from stg_invoices