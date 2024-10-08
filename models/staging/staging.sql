{{ 
    config(
        materialized='table'
    ) 
    
}}

WITH staging as (

    SELECT 
        OD.ORDER_ID,
        OD.UNIT_PRICE,
        OD.QUANTITY,
        OD.DISCOUNT,
        P.PRODUCT_ID,
        P.PRODUCT_NAME,
        C.CATEGORY_ID,
        C.CATEGORY_NAME,
        C.DESCRIPTION as CATEGORY_DESCRIPTION,
        S.SUPPLIER_ID,
        S.COMPANY_NAME AS SUPPLIER_COMPANYNAME,
        O.ORDER_DATE,
        O.REQUIRED_DATE,
        O.SHIPPED_DATE,
        CT.CUSTOMER_ID,
        CT.COMPANY_NAME AS CUSTOMERS_COMPANYNAME,
        CT.CONTACT_NAME AS CUSTOMERS_CONTACTNAME,
        CT.CONTACT_TITLE AS CUSTOMERS_CONTACTTITLE,
        CT.PHONE AS CUSTOMERS_PHONE, 
        E.EMPLOYEE_ID,
        E.FIRST_NAME AS EMPLOYEE_FIRSTNAME,
        E.LAST_NAME AS EMPLOYEE_LASTNAME,
        E.TITLE EMPLOYEE_TITLE,
        SP.SHIPPER_ID,
        SP.COMPANY_NAME AS SHIPPER_COMPANYNAME,
        SP.PHONE AS SHIPPER_PHONE

    FROM wint.order_details OD
    LEFT JOIN wint.ORDERS O ON OD.ORDER_ID = O.ORDER_ID
    LEFT JOIN wint.PRODUCTS P ON OD.PRODUCT_ID = P.PRODUCT_ID
    LEFT JOIN wint.CATEGORIES C ON C.CATEGORY_ID = P.CATEGORY_ID
    LEFT JOIN wint.SUPPLIERS S ON P.SUPPLIER_ID = S.SUPPLIER_ID
    LEFT JOIN wint.CUSTOMERS CT ON O.CUSTOMER_ID = CT.CUSTOMER_ID
    LEFT JOIN wint.EMPLOYEES E ON O.EMPLOYEE_ID = E.EMPLOYEE_ID
    LEFT JOIN wint.SHIPPERS SP ON O.SHIP_VIA = SP.SHIPPER_ID
    

)
select * from staging 