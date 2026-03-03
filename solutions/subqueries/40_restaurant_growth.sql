WITH total_per_day
AS
(
    SELECT SUM(amount) AS amnt, visited_on
    FROM Customer
    GROUP BY visited_on
)

, t AS (
SELECT visited_on,
        SUM(amnt) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS amount,
        ROUND(SUM(amnt*1.0) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW )/7,2) AS average_amount 
FROM total_per_day 
)

SELECT * FROM t 
WHERE DATEADD(day, -6, visited_on) IN (
    SELECT visited_on FROM t
)
