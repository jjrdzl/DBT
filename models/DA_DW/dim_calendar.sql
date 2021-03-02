with dim_calendar as (
    select period_id,
           period_desc,
           year,
           ini_period,
           end_period,
           days_period
    from {{ ref('stg_calendar')}}

)

select * from dim_calendar