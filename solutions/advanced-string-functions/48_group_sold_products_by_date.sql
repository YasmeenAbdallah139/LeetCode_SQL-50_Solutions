SELECT sell_date,
       COUNT(product) AS num_sold,
       STRING_AGG(product, ',') AS products
FROM (
    SELECT DISTINCT sell_date, product
    FROM Activities
) AS t 
GROUP BY sell_date;
