-- This model calculates the total cost for each order item by multiplying quantity and unit price.

SELECT
    ORDERID,
    PRODUCTID,
    QUANTITY,
    UNITPRICE,
    (QUANTITY * UNITPRICE) AS AMOUNT
FROM
    {{ source('landing', 'l1_orderitems') }}