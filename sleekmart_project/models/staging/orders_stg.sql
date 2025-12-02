-- This model defines the order status of products

SELECT
    ORDERID,
    CUSTOMERID,
    ORDERDATE,
    EMPLOYEEID,
    STOREID,
CASE 
   WHEN STATUS = '01' THEN 'In Progress'
   WHEN STATUS = '02' THEN 'Completed'
   WHEN STATUS = '03' THEN  'Canceled'
END AS 
    STATUS
FROM 
    {{ source('landing' , 'l1_orders')}}