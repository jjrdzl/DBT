with dim_calendar as (
    select period_id,
           period_desc,
           day_ini as ini_period,
           day_end as end_period,
           month_ini as month_ini_period,
           month_ini as month_end_period,          
           year_ini as year_ini_period,
           year_end as year_end_period,
           period_days, 
           is_actual           
    from {{ ref('stg_calendar')}}

)

select * from dim_calendar