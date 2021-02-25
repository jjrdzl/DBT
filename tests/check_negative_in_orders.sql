--Check if a amount ir order is negative
SELECT ORDER_ID
      ,SUM(AMOUNT) AS TOTAL
FROM {{ ref('stg_payments')}}
GROUP BY ORDER_ID
HAVING  NOT(SUM(AMOUNT) >= 0)     