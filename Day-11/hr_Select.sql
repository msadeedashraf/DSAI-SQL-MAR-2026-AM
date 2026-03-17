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

---Selecting Employees from a City / Country/ Province
--Joining Three tables

select * from [dbo].[employees] as e -- count(*)

select count(*) from [dbo].[employees] as e  
select distinct department_id from employees

select * from [dbo].[departments] as d
select Count(*) from [dbo].[departments] as d

select * from [dbo].[locations] as l
select Count(*) from [dbo].[locations] as l

--SQL89
select 
e.*,
d.department_name,
l.city,
l.country_id,
l.state_province
from 
	[dbo].[employees] as e,
	[dbo].[departments] as d,
	[dbo].[locations] as l
where 
	e.department_id = d.department_id
and 
	d.location_id = l.location_id

--and 	l.city = 'Toronto'
and l.country_id = 'UK'
--and l.state_province= 'Ontario'

--SQL92
---Selecting Employees from a City / Country/ Province

select 
e.*,
d.department_name,
l.city,
l.country_id,
l.state_province
from 
	[dbo].[employees] as e join [dbo].[departments] as d 
	on e.department_id = d.department_id
	join [dbo].[locations] as l
	on d.location_id = l.location_id
where 
--l.city = 'Toronto'
--and 
--l.country_id = 'UK'
d.department_name = 'Human Resources'
--and 
--l.state_province= 'Ontario'

--INNER JOIN = JOIN 

--JOIN = Shorthand -- default inner join

---There's only one join

--inner join ====== only matching rows

--outer join
--left outer
--right outer
--self joins






