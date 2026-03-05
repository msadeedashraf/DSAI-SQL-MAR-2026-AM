-- Demonstration D - Use the AdventureWorksLT database on SQL Azure

-- Step 1: Connect to the AdventureWorksLT database
-- The USE statement is not currently compatible with SQL Azure databases.
-- Instead, select AdventureWorksLT from the Available Databases list


select 

-- Step 2: Simple CASE Expression
-- Select and execute the following query to show the use of a simple CASE expression
-- to convert values in a flag-type column to a label.
SELECT ProductNumber, Name, ListPrice,size,
							case size 
							WHEN 'S' THEN 'Small'
							WHEN 'M' THEN 'Medium'
							WHEN 'L' THEN 'Large' 
							WHEN 'XL' THEN 'Extra Large'
							else isnull(size, 'N-A')
							end as [Size]
FROM SalesLT.Product;


	CASE Size
		WHEN 'S' THEN 'Small'
		WHEN 'M' THEN 'Medium'
		WHEN 'L' THEN 'Large' 
		WHEN 'XL' THEN 'Extra Large' 
		ELSE Size
	END AS Size

-- Step 3: Simple CASE Expression
-- Select and execute the following query to show the use of a simple CASE expression
-- to replace an id with a name. Point out that a JOIN to a reference table will be 
-- a better solution.
SELECT ProductNumber, Name,-- ProductCategoryID,
	CASE ProductCategoryID
		WHEN 5 THEN 'Mountain Bikes'
		WHEN 6 THEN 'Road Bikes'
		WHEN 7 THEN 'Touring Bikes'
		ELSE 'Bike Accessories'
	END AS Category
FROM SalesLT.Product;

