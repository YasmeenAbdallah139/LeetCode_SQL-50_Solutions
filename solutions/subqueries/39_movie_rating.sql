WITH t1 AS (
    SELECT COUNT(DISTINCT mr.movie_id) AS cnt, u.name
    FROM Users u
    INNER JOIN MovieRating mr
        ON u.user_id = mr.user_id
    GROUP BY u.name
),
t2 AS (
    SELECT m.title, AVG(mr.rating * 1.0) AS avg_rating
    FROM Movies m
    INNER JOIN MovieRating mr
        ON m.movie_id = mr.movie_id
    WHERE MONTH(mr.created_at) = 2 AND YEAR(mr.created_at) = 2020
    GROUP BY m.title
)

-- Use subqueries to allow ordering before UNION ALL
SELECT results
FROM (
    SELECT TOP 1 name AS results
    FROM t1
    WHERE cnt = (SELECT MAX(cnt) FROM t1)
    ORDER BY name
) AS top_user

UNION ALL

SELECT results
FROM (
    SELECT TOP 1 title AS results
    FROM t2
    WHERE avg_rating = (SELECT MAX(avg_rating) FROM t2)
    ORDER BY title
) AS top_movie;


