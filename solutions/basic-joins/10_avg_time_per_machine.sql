--solution using lead
select  machine_id,ROUND(AVG(The_End - start), 3) AS processing_time 
 from(select machine_id,process_id, timestamp as start,
       lead( timestamp ) over(partition by machine_id,process_id  order by timestamp) as The_End
from Activity) as t
WHERE The_End IS NOT NULL
GROUP BY machine_id
