SELECT Department,Employee,Salary 
FROM
(SELECT D.name AS Department , E.name AS Employee , E.Salary,
        DENSE_RANK() OVER(PARTITION BY E.departmentId ORDER BY salary DESC) AS DR
FROM Employee E
INNER JOIN
Department D
ON E.departmentId =D.ID 
)AS T
WHERE DR<=3
