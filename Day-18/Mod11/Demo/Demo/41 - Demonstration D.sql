-- Demonstration D

-- Step 1: Open a new query window to the TSQL database
USE TSQL;
GO
-- Step 2: Common Table Expressions
-- -- Select this query and execute it to show CTE Examples


SELECT orderyear, COUNT(DISTINCT custid) AS cust_count
FROM (	SELECT YEAR(orderdate) AS orderyear, custid
	FROM Sales.Orders
	) AS T1

GROUP BY orderyear;


with cte_year as
	(
	select year(orderdate) as orderyear, custid
	from sales.orders
	)
select orderyear, count(distinct custid) as cust_count
from cte_year
group by orderyear;

-- Step 3 (Optional) Recursive CTE (for demonstration at trainer's discretion)
WITH EmpOrg_CTE AS
(SELECT empid, mgrid, lastname, firstname --anchor query
	FROM HR.Employees
WHERE empid = 5 -- starting "top" of tree. Change this to show other root employees

UNION ALL
SELECT child.empid, child.mgrid, child.lastname, child.firstname -- recursive member which refers back to CTE
	FROM EmpOrg_CTE AS parent
	JOIN HR.Employees AS child
	ON child.mgrid=parent.empid
)
SELECT empid, mgrid, lastname, firstname
FROM EmpOrg_CTE;