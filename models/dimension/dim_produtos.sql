{{ config(materialized='incremental', unique_key='PRODUCT_ID') }}

WITH dim_produtos as (

    SELECT DISTINCT
        PRODUCT_ID,
        PRODUCT_NAME,
        CATEGORY_ID,
        CATEGORY_NAME,
        CATEGORY_DESCRIPTION,
        SUPPLIER_ID,
        SUPPLIER_COMPANYNAME
      
    FROM {{ref('staging')}} 

)

select * from dim_produtos