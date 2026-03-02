use TSQL 
go 

--Select all columns from hr.employees table
select * from hr.Employees

--Select lastname and firstname column from hr.employees
select lastname, firstname from hr.Employees

--select country firstname and lastname from a hr.employees using an alis e 
select 
		e.country,
		e.firstname,
		e.lastname
from hr.Employees as e 

--Select country firstname and lastname from all hr.employees table where employees from USA only
select 
		e.country,
		e.firstname,
		e.lastname
from hr.Employees as e 
where 
e.country = 'USA'

