SELECT r.contest_id, 
       ROUND((COUNT(r.user_id) * 1.0 / (SELECT COUNT(user_id) FROM users)) * 100, 2) AS percentage
FROM users u
INNER JOIN register r
ON r.user_id = u.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC,
         r.contest_id ASC;
