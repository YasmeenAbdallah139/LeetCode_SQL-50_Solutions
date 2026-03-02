SELECT TOP 1 person_name
FROM
(
    SELECT 
        person_name,
        SUM(Weight) OVER(ORDER BY turn) AS cumulative_w 
    FROM Queue
) AS t
WHERE cumulative_w <= 1000
ORDER BY cumulative_w DESC
