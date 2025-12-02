-- This model calculates the total number of orders per customer by combining the customer table and the orders table

WITH 
    CUSTOMERORDERS
AS(
SELECT 
    C.CUSTOMERID,
    C.EMAIL,
    CONCAT(C.FIRSTNAME, '' ,C.LASTNAME) AS CUSTOMERNAME, 
    COUNT (O.ORDERID) AS TOTALORDERS
FROM {{ source('landing', 'l1_customers') }} C
JOIN
    {{ source('landing', 'l1_orders') }} O
    ON O.CUSTOMERID=C.CUSTOMERID
GROUP BY
    C.CUSTOMERID,
    C.EMAIL,
    CUSTOMERNAME
    
    )
    SELECT 
        CUSTOMERID,
        CUSTOMERNAME,
        EMAIL,
        TOTALORDERS
    FROM
        CUSTOMERORDERS
        
