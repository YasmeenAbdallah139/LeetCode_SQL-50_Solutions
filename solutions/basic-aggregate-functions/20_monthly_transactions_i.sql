SELECT CONVERT(VARCHAR(7), trans_date, 23) AS month, 
       country, 
       COUNT(*) AS trans_count,
       SUM(CASE
           WHEN state = 'approved' THEN 1
           ELSE 0 
       END) AS approved_count,
       SUM(amount) AS trans_total_amount, 
       SUM(CASE 
           WHEN state = 'approved' THEN amount
           ELSE 0
       END) AS approved_total_amount 
FROM Transactions 
GROUP BY CONVERT(VARCHAR(7), trans_date, 23), country
