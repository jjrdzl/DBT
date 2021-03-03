--Check if only exists one period set to actual  
  select sum(is_actual) as total_actuals
  from {{  ref('stg_calendar')  }}
  where is_actual = 1
  having (total_actuals <> 1)