SELECT ROUND(COUNT(*) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity A
INNER JOIN (SELECT MIN(event_date) AS date, 
                   player_id
            FROM Activity 
            GROUP BY player_id) AS B
ON A.player_id = B.player_id 
AND DATEDIFF(day, B.date, A.event_date) = 1

//another solution
SELECT 
    ROUND(
        COUNT(DISTINCT t.player_id) * 1.0 /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
    2) AS fraction
FROM
(
    SELECT 
        player_id,
        event_date,
        LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS next_day,
        ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
) t
WHERE t.rn = 1
  AND DATEDIFF(day, t.event_date, t.next_day) = 1;
