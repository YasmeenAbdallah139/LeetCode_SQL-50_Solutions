SELECT p.product_id, ROUND(
    ISNULL(SUM(p.price * u.units) * 1.0 / SUM(u.units), 0),
    2
) AS average_price 
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id AND purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id
