-- Demonstration A

-- Step 1: Using built-in Aggregate functions
-- Change to AdventureWorks database
USE AdventureWorks;
GO

-- Step 2: Using built-in Aggregate functions
-- Select and execute the following query to show
-- the use of aggregate functions in the SELECT clause:

select * from tsql.hr.Employees

select  country,Count(*) from tsql.hr.Employees
group by country

select  top (1)  city,Count(*)  as emp_city_count
from tsql.hr.Employees
group by city
order by emp_city_count desc 

select  city,count(*)  as emp_city_count
from tsql.hr.employees
group by city
having count(*) > 1


5 select   city,Count(*)  
1 from tsql.hr.Employees
2 where
3 group by city
4 having 
6 order by 2 desc 


select  city,Count(*) 
from tsql.hr.Employees
where
group by city
having 
order by 


select * from hr.dbo.employees
select count(*) from hr.dbo.employees


-- Step 2a: THIS WILL FAIL, since some columns are not aggregated
-- and there is no explicit group by clause
SELECT SalesOrderID, ProductID, AVG(UnitPrice), MIN(OrderQty), MAX(UnitPriceDiscount)
FROM Sales.SalesOrderDetail;


SELECT  AVG(UnitPrice), MIN(OrderQty), MAX(UnitPriceDiscount)
FROM Sales.SalesOrderDetail;

SELECT SalesOrderID, ProductID, AVG(UnitPrice), MIN(OrderQty), MAX(UnitPriceDiscount)
FROM Sales.SalesOrderDetail
group by SalesOrderID, ProductID

-- Step 2b: Select and execute the following query to show
-- This will succeed and return the AVG/MIN/MAX of all rows:
select AVG(UnitPrice), MIN(OrderQty), MAX(UnitPriceDiscount)
FROM Sales.SalesOrderDetail;

-- Step 2c: Select and execute the following query to show
-- The use of aggregates with non-numeric data types:
SELECT MIN(Name) as first_territory, MAX(Name) as last_territory
FROM Sales.SalesTerritory;

-- Step 2d: Select and execute the following query to show
-- The use of aggregates with non-numeric data types:
SELECT MIN(OrderDate)AS earliest_order,
MAX(OrderDate) AS latest_order
FROM Sales.SalesOrderHeader;


select * FROM Sales.SalesOrderHeader as SOH
where soh.SalesOrderID =43659 

select sod.ProductID,sod.OrderQty ,  sum(LineTotal) from Sales.SalesOrderDetail as SOD
where sod.SalesOrderID =43659  
group by sod.ProductID,sod.OrderQty 
having sum(LineTotal) > 2000  and sum(LineTotal) <= 7000 

-- Step 2e: Select and execute the following query to show
-- the use of DISTINCT with aggregate functions:
SELECT YEAR(OrderDate) AS order_year,
COUNT(CustomerID) as all_customers,
COUNT(DISTINCT CustomerID) as unique_customers
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate);

select  *  FROM Sales.SalesOrderHeader

---sales for each year

select  year(soh.OrderDate)  ,  count(*) FROM Sales.SalesOrderHeader as soh
group by year(soh.OrderDate)



select  year(soh.OrderDate)  ,  sum(soh.SubTotal) FROM Sales.SalesOrderHeader as soh
group by year(soh.OrderDate)


select 
year(soh.OrderDate),
    sum(sod.LineTotal)  
from  Sales.SalesOrderHeader as soh inner join  Sales.SalesOrderDetail as SOD
on sod.SalesOrderID    = soh.SalesOrderID   
group by year(soh.OrderDate)





select sod.SalesOrderID   , sum(LineTotal) from Sales.SalesOrderDetail as SOD
group by sod.SalesOrderID   


select * from Sales.SalesOrderHeader

select * from Sales.SalesOrderDetail

SELECT YEAR(OrderDate) AS order_year,
COUNT(*) as all_customers,
COUNT(CustomerID) as all_customers,
COUNT(DISTINCT CustomerID) as unique_customers
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate);



-- Step 2f: Select and execute the following query to show
-- the impact of NULL on aggregate functions
-- First, show the existence of NULLs in Sales.Orders
SELECT DISTINCT SalesPersonID
FROM Sales.SalesOrderHeader
ORDER BY SalesPersonID;

-- Step 2g: Then show that MIN, MAX and COUNT ignore NULL, COUNT(*) doesn't.
-- Show the messages tab in the SSMS results pane
-- for Warning: Null value is eliminated by an aggregate or other SET operation.
SELECT MIN(SalesPersonID) AS lowest_sales_person_id, MAX(SalesPersonID) AS highest_sales_person_id, 
COUNT(SalesPersonID) AS count_sales_person_id, COUNT(*) AS COUNT_all
FROM Sales.SalesOrderHeader;


-- Step 3: (optional) The following section may be used to illustrate
-- the behavior of NULLs in aggregate functions:

-- Step 3a: Create an example table
CREATE TABLE dbo.t1(
	c1 INT IDENTITY NOT NULL PRIMARY KEY,
	c2 INT NULL);

-- Step 3b: Populate it	
INSERT INTO dbo.t1(c2)
VALUES(NULL),(10),(20),(30),(40),(50);

-- Step 3c: View the contents. Note the NULL
SELECT c1, c2
FROM dbo.t1;

-- Step 3d: Execute this query to compare the behavior of AVG to an aritmetic average (SUM/COUNT)
SELECT 
    SUM(c2) AS sum_nonnulls, 
    COUNT(*)AS count_all_rows, 
    COUNT(c2)AS count_nonnulls, 
    AVG(c2) AS [avg], 
    --(SUM(c2)/COUNT(*))AS arith_avg
    avg( ISNULL(c2,0))
FROM dbo.t1;

-- Step 3e: Clean up the created table
DROP TABLE t1;

-- Step 3f: Execute this query to demonstrate replacement of NULL before aggregating
-- Create test table
CREATE TABLE dbo.t2
    (
      c1 INT IDENTITY NOT NULL PRIMARY KEY,
      c2 INT NULL
    );

-- Step 3g: Populate test table
INSERT INTO dbo.t2
VALUES(1),(10),(1),(NULL),(1),(10),(1),(NULL),(1),(10),(1),(10);

-- Step 3h: Show table contents
SELECT c1, c2
FROM dbo.t2;

-- Step 3i: Show standard AVG versus replacement of NULL with zero
SELECT AVG(c2) AS AvgWithNULLs, AVG(COALESCE(c2,0)) AS AvgWithNULLReplace
FROM dbo.t2;


-- Step 4: clean up
DROP TABLE dbo.t2;