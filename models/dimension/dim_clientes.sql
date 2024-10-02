
{{ config(materialized='incremental', unique_key='CUSTOMER_ID') }}
 
with dim_cliente as (
    
    SELECT DISTINCT
        CUSTOMER_ID,
        CUSTOMERS_COMPANYNAME,
        CUSTOMERS_CONTACTNAME,
        CUSTOMERS_CONTACTTITLE,
        CUSTOMERS_PHONE  
    FROM {{ref('staging')}}

)

select * from dim_cliente 