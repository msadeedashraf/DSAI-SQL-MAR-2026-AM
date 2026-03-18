--  Demonstration D

--  Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

--Cross Join
select * FROM HR.EMPLOYEES AS E1 CROSS JOIN HR.Employees AS e2


-- Step 2: Join 2 tables
-- Select and execute the following query
-- to display all employees with managers
-- and the manager's ID and name.
 
select 
e.* , m.mng_lastname
from 
hr.employees as e inner join hr.managers as m
on e.mgrid = m.mngid


select 
e.*,
m.lastname
from hr.Employees as e inner join hr.employees as m
on e.mgrid = m.empid


select 
e.*,
m.lastname
from hr.Employees as e left join hr.employees as m
on e.mgrid = m.empid






--Create a managers table
select e.empid as mngid , e.lastname as mng_lastname , e.firstname as mng_firstname 
into hr.managers
from hr.employees  as e
where e.empid in (1,2,3,5)



 SELECT e.empid ,e.lastname as empname,e.title,e.mgrid, m.lastname as mgrname
  FROM HR.Employees AS e
  JOIN HR.Employees AS m
  ON e.mgrid=m.empid;

-- Step 3: Join 2 tables
-- Select and execute the following query
-- to display all employees 
-- and the manager's ID and name.
  SELECT e.empid ,e.lastname as empname,e.title,e.mgrid, m.lastname as mgrname
  FROM HR.Employees AS e
  LEFT OUTER JOIN HR.Employees AS m
  ON e.mgrid=m.empid;
  
-- Step 4: Cross Join 2 tables
-- Select and execute the following query
-- to generate all combinations of first and last
-- names from the HR.Employees table
SELECT e1.firstname, e2.lastname
FROM HR.Employees AS e1 CROSS JOIN HR.Employees AS e2;
