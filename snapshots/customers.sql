{% snapshot customers_snapshot %}

{{
    config(
      target_schema='snapshots',  
      unique_key='customer_id',
      strategy='timestamp',
      updated_at='loaded_at',
    )
}}

select * from {{ source('DA_RAW_HASH','customers') }}

{% endsnapshot %}