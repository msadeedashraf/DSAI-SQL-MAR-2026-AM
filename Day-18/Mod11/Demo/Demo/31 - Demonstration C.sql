-- Demonstration C

-- Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

select * from () t1 inner join () t2 


select t1.custid, t2.orderid, t2.orderdate from 
(select custid,  max(orderdate) as max_cust_orderdate from Sales.Orders ino 
group by custid)  t1 
inner join 
( SELECT custid, orderid, orderdate FROM Sales.Orders AS oo ) t2
on  t1.custid = t2.custid
and t1.max_cust_orderdate = t2.orderdate
order by 1



select orderyear, count(*) from (SELECT YEAR(orderdate) AS orderyear, custid
FROM Sales.Orders) AS derived_year
group by orderyear

select orderyear, count(distinct custid) from (SELECT YEAR(orderdate) AS orderyear, custid
FROM Sales.Orders) AS derived_year
group by orderyear
-- Step 2: Column aliases in derived tables
-- Select this query and execute it to show internal column aliases
SELECT orderyear, COUNT(DISTINCT custid) AS cust_count
FROM (SELECT YEAR(orderdate) AS orderyear, custid
FROM Sales.Orders) AS derived_year
GROUP BY orderyear;

-- Select this query and execute it to show external column aliases
SELECT orderyear, COUNT(DISTINCT custid) AS cust_count
FROM (SELECT YEAR(orderdate), custid
FROM Sales.Orders) AS derived_year(orderyear, custid)
GROUP BY orderyear;

select * from 
				(
				select  e.empid ,  e.lastname + ' ' + e.firstname , e.hiredate, e.country, e.city 
				from hr.employees as e
				) as my_hr_list(emp_id, Full_Name, hire_dtae, country, city)


-- Step 3: Use a local variable as a parameter for a derived table
DECLARE @emp_id INT = 9;
SELECT orderyear, COUNT(DISTINCT custid) AS cust_count
FROM (	
	SELECT YEAR(orderdate) AS orderyear, custid
	FROM Sales.Orders
	WHERE empid=@emp_id
) AS derived_year
GROUP BY orderyear;

-- Step 4: Nesting derived tables

select * from (  select * from (     select * from () as t1 ) t2   ) as t3


SELECT orderyear, cust_count
FROM  (
	SELECT  orderyear, COUNT(DISTINCT custid) AS cust_count
	FROM (
		SELECT YEAR(orderdate) AS orderyear ,custid
        FROM Sales.Orders) AS derived_table_1
	GROUP BY orderyear) AS derived_table_2
WHERE cust_count > 80;

select * from (
SELECT  orderyear, COUNT(DISTINCT custid) AS cust_count from (
SELECT YEAR(orderdate) AS orderyear ,custid
        FROM Sales.Orders) AS derived_table_1
		group by orderyear 
) as derived_table_2
where cust_count > 80


-- An alternative to nesting, at the cost of restating the COUNT expression
-- in a having clause
SELECT orderyear, COUNT(DISTINCT custid) AS cust_count
	FROM (
		SELECT YEAR(orderdate) AS orderyear ,custid
        FROM Sales.Orders) AS derived_table_1
	GROUP BY orderyear
HAVING COUNT(DISTINCT custid) > 80;


