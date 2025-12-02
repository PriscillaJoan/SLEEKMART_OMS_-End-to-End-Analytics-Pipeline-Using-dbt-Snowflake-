-- This model creates a view that contains all the customer information

SELECT
    CUSTOMERID,
    CONCAT(FIRSTNAME, '', LASTNAME) AS CUSTOMERNAMES,
    PHONE,
    EMAIL,
    ADDRESS,
    CITY,
    STATE,
    ZIPCODE
FROM
    {{ source('landing', 'l1_customers') }}