with stg_period_ini as (
    select period_id, 
           min(calendar_day) as day_ini,
           min(year_calendar) as year_ini,
           min(calendar_month) as month_ini,
           max( case when calendar_day = current_date then 1 else 0 end) as actual_ini
      from {{ ref('stg_calendar_detail') }}
      group by period_id

),

stg_period_end as (
    select period_id, 
           max(calendar_day) as day_end,
           max(year_calendar) as year_end,
           max(calendar_month) as month_end,
           max( case when calendar_day = current_date then 1 else 0 end ) as actual_end
      from {{ ref('stg_calendar_detail') }}
      group by period_id

),

stg_calendar as (
    select stg_period_ini.period_id,
          (to_char(day_ini,'MON') || '-' || to_char(day_end,'MON')) as period_desc,
           day_ini, 
           day_end,
           month_ini,                       
           month_end, 
           year_ini, 
           year_end,
           (day_end - day_ini) as period_days,
           actual_ini as is_actual
    from stg_period_ini
    join stg_period_end using (period_id)
)

select * from stg_calendar
 order by period_id