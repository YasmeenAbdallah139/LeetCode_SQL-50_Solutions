-- First solution (union all)--

SELECT employee_id, department_id  
FROM Employee
WHERE employee_id IN (
  SELECT employee_id
  FROM Employee
  GROUP BY employee_id
  HAVING COUNT(department_id) = 1
)
UNION ALL
SELECT employee_id, department_id  
FROM Employee
WHERE primary_flag = 'Y'

-- Second solution (using window function)--
SELECT employee_id, department_id 
FROM
(SELECT *,
        ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY primary_flag DESC) AS rn
        FROM Employee) AS t
WHERE rn = 1
