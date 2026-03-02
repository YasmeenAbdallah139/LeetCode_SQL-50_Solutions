--Solution using self join

SELECT DISTINCT l1.num AS ConsecutiveNums 
FROM 
Logs l1
INNER JOIN
Logs l2
ON l1.id+1=l2.id
INNER JOIN 
Logs l3
ON l2.id+1=l3.id
WHERE l1.num=l2.num AND l2.num=l3.num


  
--Another solution using window functions
  
SELECT DISTINCT num AS ConsecutiveNums
FROM
(
    SELECT *,
        LAG(num) OVER(ORDER BY id) AS PREV,
        LEAD(num) OVER(ORDER BY id) AS NEXT
    FROM Logs 
) AS t
WHERE num = Next AND num = Prev
