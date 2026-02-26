SELECT user_id, 
       ROUND(AVG(ISNULL(CAST(action_as_num AS FLOAT), 0)), 2) AS confirmation_rate
FROM (
        SELECT S.user_id,
               CASE
                    WHEN action = 'timeout' THEN 0
                    WHEN action = 'confirmed' THEN 1
               END AS action_as_num
        FROM Signups S
        LEFT JOIN Confirmations C
            ON S.user_id = C.user_id
     ) AS t
GROUP BY user_id;
