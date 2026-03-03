SELECT ROUND(SUM(tiv_2016*1.0),2) AS tiv_2016 FROM 
Insurance       
WHERE pid IN (     
SELECT pid FROM

    (SELECT pid,
           COUNT(*) OVER (PARTITION BY lat, lon) AS cnt1,
           COUNT(*) OVER(PARTITION BY tiv_2015) AS cnt2
    FROM Insurance) AS t
    WHERE cnt1=1 AND cnt2>1)
