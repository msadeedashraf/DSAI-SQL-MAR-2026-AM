use tsql
go

create schema test

select * from [Production].[Product]

--SQL89
select * from [Production].[Products] P, 
Production.Categories C
where 
p.categoryid = c.categoryid 
and c.categoryname = 'Beverages'

--SQL92
select * from [Production].[Products] P inner join Production.Categories C
on p.categoryid = c.categoryid 
where
c.categoryname = 'Beverages'



select * from tsql.Production.Categories

/*Lets increase the price of bevarages by 5%*/



select * into test.Products
from tsql.[Production].[Products] p
where p.categoryid = 1


select * from [Production].[Products] 
where categoryid = 1

update  [Production].[Products] 
set unitprice = tp.unitprice 
select pp.*, tp.unitprice 
from [Production].[Products]  pp inner join test.Products tp
on pp.productid = tp.productid



select * from [Production].[Products]  pp 
select * from test.Products tp



select pp.* from [Production].[Products] as pp 
where pp.categoryid = 1

select * from test.Products as tp






select p.*,   (unitprice * 1.05) from [Production].[Products] p
where p.categoryid = 1
1	Product HHYDP	1	1	18.00	0	18.900000
2	Product RECZE	1	1	19.00	0	19.950000
24	Product QOGNU	10	1	4.50	1	4.725000
34	Product SWNJY	16	1	14.00	0	14.700000
35	Product NEVTJ	16	1	18.00	0	18.900000
38	Product QDOMO	18	1	263.50	0	276.675000
39	Product LSOFL	18	1	18.00	0	18.900000
43	Product ZZZHR	20	1	46.00	0	48.300000
67	Product XLXQF	16	1	14.00	0	14.700000
70	Product TOONT	7	1	15.00	0	15.750000
75	Product BWRLG	12	1	7.75	0	8.137500
76	Product JYGFE	23	1	18.00	0	18.900000

set p.uni
select * from tsql.Production.Categories



USE AdventureWorks -- Or connect to azure Database if you have access to it
GO


SELECT * INTO Store FROM Sales.Store				-- Make a copy of the Sales.Store Table
SELECT TOP 10 * FROM Sales.Store					-- Show that you have done this
SELECT TOP 10 * INTO StoreBackup FROM Sales.Store   -- Copy the top 10 rows into source
SELECT * FROM StoreBackup							-- Make a copy of the Sales.Store Table
SELECT * FROM Store									-- Make a copy of the Sales.Store Table


-- Remove the copied rows from the store table
DELETE FROM Store	
OUTPUT DELETED.*
--select * from Store
WHERE BusinessEntityID <= (SELECT MAX(BusinessENtityID) FROM StoreBackup)	-- Remove top 10 rows from target

-- Show that they have been removed
SELECT BusinessEntityID FROM Store					-- Show that the rows have been copied back into Sales
INTERSECT
SELECT BusinessEntityID FROM StoreBackup


-- Use the Merge statement to put them back

MERGE top (10) INTO		Store AS Destination					-- Known in online help as Target, which is a reserved word
	USING		StoreBackup AS StagingTable						-- Known in online help as the source, which is also a reserved word
	ON			(Destination.BusinessEntityID = StagingTable.BusinessEntityID)	-- the matching control column
WHEN NOT MATCHED THEN
	INSERT (	BusinessEntityID
			,	Name
			,	SalesPersonID
			,	Demographics
			,	rowguid
			,	ModifiedDate
			)
	VALUES (	StagingTable.BusinessEntityID
			,	StagingTable.Name
			,	StagingTable.SalesPersonID
			,	StagingTable.Demographics
			,	StagingTable.rowguid
			,	StagingTable.ModifiedDate
			)
OUTPUT INSERTED.*;



-- SELECT * FROM Sales.Store where 1 = 0 -- used to extract column names for all columns, without cost of data access

SELECT BusinessEntityID FROM Store					-- Show that the rows have been copied back into Sales
INTERSECT
SELECT BusinessEntityID FROM StoreBackup

UPDATE Store SET Name = 'TestUpdate' 
OUTPUT	INSERTED.name	AS NewName, 		DELETED.name	AS OldName
--select * from Store
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM StoreBackup)	-- Update Names in store that are for backed up stores

SELECT * FROM Store WHERE Name = 'TestUpdate'							-- Show that they have been changed

-- Use the Merge statement to Change the names back

MERGE top (10) INTO		Store AS Destination			-- Known in online help as Target, which is a reserved word
	USING		StoreBackup AS StagingTable				-- Known in online help as the source, which is also a reserved word
	ON			(Destination.BusinessEntityID = StagingTable.BusinessEntityID)	-- the matching control column
WHEN MATCHED THEN -- 
	UPDATE SET
	            Destination.BusinessEntityID	= StagingTable.BusinessEntityID
,				Destination.Name				= StagingTable.Name
,				Destination.SalesPersonID		= StagingTable.SalesPersonID
,				Destination.Demographics		= StagingTable.Demographics
,				Destination.rowguid				= StagingTable.rowguid
,				Destination.ModifiedDate		= StagingTable.ModifiedDate
OUTPUT $Action, INSERTED.*, DELETED.*;


-- Ensure that the environment has been restored to the 
-- state it was in before the changes were made

SELECT * FROM store

-- Clean up the database

DROP TABLE IF EXISTS Store;
DROP TABLE IF EXISTS StoreBackup;




