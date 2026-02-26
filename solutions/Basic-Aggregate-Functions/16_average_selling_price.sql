select p.product_id , round(
    ISNULL(sum(p.price * u.units) * 1.0 / sum(u.units),0),
    2
    ) as average_price from
Prices p
LEFT JOIN
UnitsSold u
on p.product_id=u.product_id and purchase_date between start_date and end_date  
group by p.product_id 
