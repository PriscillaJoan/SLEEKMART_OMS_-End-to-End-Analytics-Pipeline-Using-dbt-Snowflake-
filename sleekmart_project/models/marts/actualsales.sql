SELECT 
    CO.STOREID,
    SUM(A.AMOUNT) AS TOTALSALES
FROM 
    {{ref('completedorders_fact') }} CO
JOIN
    {{ ref( 'amount_stg') }} A
ON 
    CO.ORDERID = A.ORDERID
GROUP BY CO.STOREID
ORDER BY TOTALSALES DESC