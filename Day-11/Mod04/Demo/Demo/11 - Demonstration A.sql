-- Demonstration A

-- Step 1: Open a new query window to the TSQL database
USE TSQL;
GO


--SQL89
select * from hr.employees

select * from tablename
where category_name = 'Dairy'


select * from Production.Products as P -- total 77rows--6 clmn
where P.categoryid = 1

--Dairy Products--10 rows
--Beverages--12 

select * from Production.Categories --total 8 rows--3 clmn


--SQL 89
select 
P.*,
C.*
from Production.Products as P, Production.Categories as C
--SQL 89
select 
P.productid,
P.productname,
P.unitprice,
C.categoryname,
C.description
from Production.Products as P, Production.Categories as C
where P.categoryid = C.categoryid
and C.categoryname = 'Dairy Products'

--SQL92
select 
P.productid,
P.productname,
P.unitprice,
C.categoryname,
C.description
from 
Production.Products as P  join  Production.Categories as C
on P.categoryid = C.categoryid
where 
C.categoryname = 'Dairy Products'


Beverages
Condiments
Confections
Dairy Products
Grains/Cereals
Meat/Poultry
Produce
Seafood

select 
P.productid,
P.productname,
P.unitprice,
S.contactname,
S.city,
S.country
from Production.Products as P join Production.Suppliers as S
on P.supplierid = S.supplierid
where 
S.contactname = 'Holm, Michael'



select 
P.productid,
P.productname,
P.unitprice,
C.categoryname,
C.description
from 
Production.Products as P  join  Production.Categories as C
on P.categoryid = C.categoryid
where 
C.categoryname = 'Dairy Products'


--SQL92


---there is only one join


-- Step 2: Join 2 tables
-- Select and execute the following query
-- to illustrate ANSI SQL-89 syntax
-- to join 2 tables
-- Point out that 830 rows are returned.
SELECT c.companyname, o.orderdate
FROM Sales.Customers AS c, Sales.Orders AS o
WHERE c.custid = o.custid;

-- Step 3: Join 2 tables
-- Select and execute the following query
-- to illustrate ANSI SQL-89 syntax
-- omitting the WHERE clause and causing an inadvertent Cartesian join.
-- Point out that 75530 rows are returned.
SELECT c.companyname, o.orderdate
FROM Sales.Customers AS c, Sales.Orders AS o;

-- Step 4: Join 2 tables
-- Select and execute the following query
-- to illustrate ANSI SQL-92 syntax
-- to join 2 tables
-- Point out that 830 rows are returned.
SELECT c.companyname, o.orderdate
FROM Sales.Customers AS c JOIN Sales.Orders AS o
ON c.custid = o.custid;

-- Step 5: Join 2 tables
-- Select and execute the following query
-- to illustrate ANSI SQL-92 syntax.
-- Note that the ON clause is deliberately omitted
-- to cause an error, showing the protection
-- against accidental Cartesian products
--THIS WILL INTENTIONALLY CAUSE AN ERROR

SELECT c.companyname, o.orderdate
FROM Sales.Customers AS c JOIN Sales.Orders AS o;
-- ON c.custid = o.custid
