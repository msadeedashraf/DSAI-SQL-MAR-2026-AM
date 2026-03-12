USE TSQL
GO

create table new_employees
(
[empid] [int] NOT NULL,
[lastname] [nvarchar](20) NOT NULL,
[firstname] [nvarchar](10) NOT NULL,
[birthdate] [datetime] NOT NULL,
[hiredate] [datetime] NOT NULL,
[city] [nvarchar](15) NOT NULL,
[country] [nvarchar](15) NOT NULL,
[mgrid] [int] NULL
)

insert into new_employees
(
[empid] ,
[lastname] ,
[firstname] ,
[birthdate] ,
[hiredate] ,
[city] ,
[country] ,
[mgrid] 
)
values
( 1	,'Davis',	'Sara', '1958-12-08', '2002-05-01', 'Seattle', 'USA', NULL
)


insert into new_employees
VALUES
(
2,	'Funk',	'Don'	,'1962-02-19', '2002-08-14',	'Tacoma',	'USA',	1
),
(
3,	'Funk',	'Don'	,'1962-02-19', '2002-08-14',	'Tacoma',	'USA',	1
)


INSERT INTO new_employees
SELECT 
E.empid, E.lastname, E.firstname, E.birthdate, E.hiredate, E.city, E.country, E.mgrid
FROM HR.EMPLOYEES AS E 
WHERE E.EMPID IN (3,4,5)



select * into new_employee2
from 
(  
--your select goes here  

) A

select * into new_employee2
from ( select  
[empid] ,
[firstname] +' ' + [lastname] as FullName,
[birthdate] ,
[hiredate] ,
[city],
[country],
[mgrid] 
from hr.Employees
) A

select * into NewProducts
from Production.Products--77 rows
where productid >=70


--	First try the INSERT by stored procedure to see that it doesn't work becasue it is not there
INSERT INTO Production.Products 
	(	productID
	,	productname
	,	supplierid
	,	categoryid
	,	unitprice)
EXEC Production.AddNewProducts;

--	To make this routine work we remove some rows from two linked tables to allow 
--	deletion, delete the rows and then put the rows back ;-)

--	Create a backup of the Products with a chosen ID
DROP TABLE IF EXISTS NewProducts
GO

create table new_products



select * into NewProducts
from Production.Products--77 rows
where productid >=70


SELECT * INTO NewProducts 
FROM PRODUCTION.PRODUCTS WHERE ProductID >= 70		

-- Create a backup of the Order Details for the chosen productID
DROP TABLE IF EXISTS NewOrderDetails
GO

SELECT * INTO NewOrderDetails 
FROM SALES.OrderDetails WHERE ProductID >= 70		

-- Delete the copied data from the original tables 
DELETE FROM SALES.OrderDetails		
OUTPUT DELETED.*
WHERE ProductID >= 70

DELETE FROM Production.Products		
OUTPUT DELETED.*
WHERE ProductID >= 70

-- check that they have been transfered safely
SELECT * FROM NewProducts
SELECT * FROM NewOrderDetails

SELECT * FROM SALES.OrderDetails	
WHERE productid >= 70

SELECT * FROM Production.Products
WHERE productid >= 70

-- Now we can put back the rows from the NewTables, using the INSERT statement
-- Firstly the Products, for which we will create a run a stored procedure
DROP PROCEDURE IF EXISTS Production.AddNewProducts
GO

CREATE PROCEDURE Production.AddNewProducts
AS
	BEGIN
		SELECT Productid, productname, SUpplierID, CategoryID, Unitprice FROM NewProducts
	END

-- Having created it, we can run it to feed the missing rows into the Products table
INSERT INTO Production.Products (productid, productname, supplierid, categoryid, unitprice)
EXEC Production.AddNewProducts;

SELECT * FROM Production.Products
WHERE productid >= 70

-- The OrderDetails will be put back using INSERT .. SELECT
INSERT Sales.OrderDetails (orderid, productid, unitprice, qty, discount)
OUTPUT INSERTED.*
SELECT * FROM NewOrderDetails

-- Clean up the database

DROP TABLE NewProducts
GO

DROP TABLE NewOrderDetails
GO

DROP PROCEDURE Production.AddNewProducts
GO