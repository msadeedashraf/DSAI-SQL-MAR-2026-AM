-- Demonstration A
use AdventureWorksLT2022


SELECT @@SERVERNAME AS ServerName,
       DB_NAME() AS CurrentDatabase,
       SUSER_SNAME() AS LoginName;

	   use tsql
-- Step 1: Connect to the AdventureWorksLT database
-- Prepare the environment by running the following query (without this, all order dates are the same)
UPDATE SalesLT.SalesOrderHeader 
SET	OrderDate = DATEADD(d,SalesOrderID % 7000, '2008-06-01'),
	ShipDate = DATEADD(d,7 + (SalesOrderID % 7000), '2008-06-08'),
	DueDate = DATEADD(d,14 + (SalesOrderID % 7000), '2008-06-13');

-- Step 2: Use ORDER BY to sort results 
-- Sorting by column name
select  C.Phone 
from SalesLT.Customer as C--847
order by C.LastName


select 
C.CustomerID, C.Title, C.FirstName , C.LastName, C.CompanyName, C.EmailAddress, C.Phone 
from SalesLT.Customer as C--847
order by C.LastName 



select 
C.CustomerID, C.Title, C.FirstName , C.LastName, C.CompanyName, C.EmailAddress, C.Phone 
from SalesLT.Customer as C--847
order by C.LastName desc

select 
C.Title, C.FirstName , C.LastName, C.CompanyName, C.EmailAddress, C.Phone 
from SalesLT.Customer as C--847
order by C.Phone

select distinct
C.Title, C.FirstName , C.LastName, C.CompanyName, C.EmailAddress, C.Phone 
from SalesLT.Customer as C--440


select 
C.Title, C.FirstName + ' '+  C.LastName as FullName, C.CompanyName, C.EmailAddress, C.Phone 
from SalesLT.Customer as C
order by FullName


SELECT SalesOrderID, CustomerID, OrderDate
FROM SalesLT.SalesOrderHeader
ORDER BY OrderDate;

-- Step 3: Use ORDER BY to sort results
-- Sorting by column alias name

select 
SalesOrderID, CustomerID, OrderDate 
FROM SalesLT.SalesOrderHeader



SELECT SalesOrderID, CustomerID , MONTH(OrderDate) AS ordermonth
FROM SalesLT.SalesOrderHeader
ORDER BY ordermonth DESC;

-- Step 4: Use ORDER BY to sort results
-- Sorting by column name in descending order
SELECT SalesOrderID, CustomerID, OrderDate
FROM SalesLT.SalesOrderHeader
ORDER BY OrderDate DESC;

-- Step 5: Use ORDER BY to sort results
-- Changing sort order for multiple columns

select Convert(varchar,getdate(),105)

SELECT ModifiedDate, CustomerID, CompanyName
FROM SalesLT.Customer
ORDER BY Convert(varchar,ModifiedDate,105) DESC, CustomerID desc;

-- Step 6: Revert the changes made to date columns
UPDATE SalesLT.SalesOrderHeader 
SET OrderDate = '2008-06-01', 
	ShipDate = '2008-06-08',
	DueDate = '2008-06-13';
