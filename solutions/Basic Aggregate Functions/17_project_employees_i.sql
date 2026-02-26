select p.project_id, round(avg(experience_years*1.0),2) as average_years from 
Project p
inner join
Employee e
on p.Employee_id = e.Employee_id
group by project_id
