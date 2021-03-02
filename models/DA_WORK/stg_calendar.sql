with stg_calendar as (

    select to_char(ini_period,'YY') || to_char(ini_period,'MM')|| 
           to_char(end_period,'YY') || to_char(end_period,'MM') as period_id,
           to_char(ini_period,'MON')|| '-' || to_char(end_period,'MON') as period_desc,
           to_char(ini_period,'YYYY') as year,
           ini_period,
           end_period,
           (end_period - ini_period) as days_period
    FROM {{  ref('stg_invoices')  }}

)

select * from stg_calendar