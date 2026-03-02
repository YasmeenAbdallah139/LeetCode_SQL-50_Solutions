SELECT mng.employee_id, mng.name, COUNT(emp.reports_to) AS reports_count, ROUND(AVG(emp.age*1.0),0) AS average_age 
FROM
Employees emp
INNER JOIN
Employees mng
ON emp.reports_to=mng.employee_id
GROUP BY mng.employee_id, mng.name
ORDER BY mng.employee_id
