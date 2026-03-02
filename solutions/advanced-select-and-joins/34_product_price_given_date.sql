WITH t AS (
    SELECT p1.Product_id, p1.new_price AS price 
    FROM Products p1
    INNER JOIN
        (SELECT Product_id, MAX(change_date) AS change_date
         FROM Products 
         WHERE change_date <= '2019-08-16'
         GROUP BY Product_id) AS p2
    ON p1.Product_id = p2.Product_id AND p1.change_date = p2.change_date
)

SELECT * FROM t
UNION
SELECT DISTINCT Product_id, 10 AS PRICE
FROM Products 
WHERE Product_id NOT IN (SELECT Product_id FROM t)
