with stg_calendar_detail as (

    select id as calendar_id,
           calendar_day,
           period_id,
           to_char(calendar_day,'YYYY') as year_calendar,
           to_char(calendar_day,'MM')   as calendar_month,
           to_char(calendar_day,'MON')  as desc_month       
      from {{ source('DA_RAW_HASH','dates')}}

)

select * from stg_calendar_detail