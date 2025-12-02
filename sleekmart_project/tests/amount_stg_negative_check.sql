-- This test ensures that no order placed has a negative amount

SELECT 
    ORDERID
FROM 
    {{ref ('amount_stg')}}
WHERE 
    AMOUNT < 0