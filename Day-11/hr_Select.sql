---Oracle HR DB to learn SQL
---Adventureworks DB to learn TSQL
Use HR
go

---Give me all the employees from the IT department
select * from employees as e
where 
--e.department_id = 6---IT Department
e.department_id = 5---Shipping Department

select * from departments

select 
e.*,
d.department_name
from 
employees as e join departments as d
on e.department_id  = d.department_id
where 
d.department_name = 'Marketing'


