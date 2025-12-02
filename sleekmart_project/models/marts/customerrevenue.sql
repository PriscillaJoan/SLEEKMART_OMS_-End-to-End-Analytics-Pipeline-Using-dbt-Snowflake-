-- This model refrences  three other models (customerinfo_stg, completeorders_cons and amount_stg) to show total revenue generated from each customer

SELECT
    C.CUSTOMERID,
    C.CUSTOMERNAMES,
    C.PHONE,
    C.EMAIL,
    C.ADDRESS,
    C.CITY,
    C.ZIPCODE,
    C.STATE,
    SUM(A.AMOUNT) AS TOTALREVENUE
FROM {{ ref('customers_stg') }} C
JOIN {{ ref('completedorders_fact') }} O
ON C.CUSTOMERID=O.CUSTOMERID
JOIN {{ ref('amount_stg') }} a
    ON O.ORDERID = A.ORDERID
GROUP BY
    C.CUSTOMERID,
    C.CUSTOMERNAMES,
    C.PHONE,
    C.EMAIL,
    C.ADDRESS,
    C.CITY,
    C.ZIPCODE,
    C.STATE
ORDER BY
    TOTALREVENUE DESC

    