SELECT m.name
FROM Employee e
JOIN Employee m
    ON e.managerId = m.id
HAVING COUNT(M.NAME)>=5
