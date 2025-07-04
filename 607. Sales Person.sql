-- Write your PostgreSQL query statement below
SELECT 
    DISTINCT SalesPerson.name
FROM SalesPerson
WHERE SalesPerson.sales_id NOT IN (
    SELECT sales_id
    FROM orders
    JOIN company 
        ON orders.com_id = company.com_id
    WHERE company.name = 'RED'
)