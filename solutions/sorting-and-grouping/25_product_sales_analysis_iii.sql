SELECT B.product_id ,B.first_year, A.quantity,A.price   FROM 
Sales AS A  INNER JOIN
    (
    SELECT product_id , MIN(year)  AS first_year
    FROM Sales 
    GROUP BY product_id
    ) AS B
ON A.product_id=B.product_id
AND A.year=B.first_year

//another sol

SELECT product_id, year AS first_year, quantity, price
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY product_id ORDER BY year ASC) AS DN
    FROM Sales
) t
WHERE DN = 1;
