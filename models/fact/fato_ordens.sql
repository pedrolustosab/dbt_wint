
WITH fato_ordens as (

    SELECT 
        P.PRODUCT_ID,
        C.CUSTOMER_ID,
        E.EMPLOYEE_ID,
        SP.SHIPPER_ID,
        STG.ORDER_ID,
        STG.ORDER_DATE,
        STG.REQUIRED_DATE,
        STG.SHIPPED_DATE,
        STG.UNIT_PRICE,
        STG.QUANTITY,
        STG.DISCOUNT

    FROM {{ref('staging')}} STG
    LEFT JOIN {{ref('dim_clientes')}} C ON (C.CUSTOMER_ID = STG.CUSTOMER_ID)
    LEFT JOIN {{ref('dim_produtos')}} P ON (STG.PRODUCT_ID = P.PRODUCT_ID) 
    LEFT JOIN {{ref('dim_empregados')}} E ON (STG.EMPLOYEE_ID = E.EMPLOYEE_ID)
    LEFT JOIN {{ref('dim_envios')}} SP ON (STG.SHIPPER_ID = SP.SHIPPER_ID)

)

select * from fato_ordens 
