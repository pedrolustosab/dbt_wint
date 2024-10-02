{{ config(materialized='incremental', unique_key='EMPLOYEE_ID') }}

WITH dim_empregados as (

    SELECT DISTINCT 
        EMPLOYEE_ID,
        EMPLOYEE_FIRSTNAME || EMPLOYEE_LASTNAME AS EMPLOYEE_NAME,
        EMPLOYEE_TITLE

    FROM {{ref('staging')}}
)

select * from dim_empregados 