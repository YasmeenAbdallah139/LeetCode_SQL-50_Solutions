SELECT *
FROM users
WHERE 
    RIGHT(mail, 13) COLLATE Latin1_General_BIN = '@leetcode.com'
    AND mail LIKE '[A-Za-z]%'
    AND LEFT(mail, LEN(mail) - 13) NOT LIKE '%[^a-zA-Z0-9_.-]%'
