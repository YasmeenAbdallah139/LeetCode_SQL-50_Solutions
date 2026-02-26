SELECT ROUND(COUNT(*) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity A
INNER JOIN (SELECT MIN(event_date) AS date, 
                   player_id
            FROM Activity 
            GROUP BY player_id) AS B
ON A.player_id = B.player_id 
AND DATEDIFF(day, B.date, A.event_date) = 1
