-- SOL 1
SELECT customer_id
FROM
(
    SELECT COUNT(DISTINCT product_key) AS cnt, customer_id
    FROM Customer
    GROUP BY customer_id
) AS t
WHERE cnt = (SELECT COUNT(product_key) FROM Product)

  
-- SOL 2
-- relational division
  
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)
