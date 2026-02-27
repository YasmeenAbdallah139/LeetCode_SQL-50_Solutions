SELECT MAX(NUM) AS num
FROM
    (
    SELECT COUNT(NUM) AS cnt,NUM
    FROM MyNumbers 
    GROUP BY NUM 
    ) AS t
WHERE cnt=1
