{{ config(materialized='incremental', unique_key='SHIPPER_SK') }}

WITH envios as (

    SELECT DISTINCT
        SHIPPER_ID,
        SHIPPER_COMPANYNAME,
        SHIPPER_PHONE

    FROM {{ref('staging')}}

),
dim_envios_sk as (
    select 
        row_number() over (order by SHIPPER_ID) as SHIPPER_SK
        ,*
    from envios
)

select * from dim_envios_sk