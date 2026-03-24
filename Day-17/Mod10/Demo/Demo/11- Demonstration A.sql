-- Demonstration A

-- Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Scalar subqueres:
-- Select this query and execute it to
-- obtain most recent order
SELECT MAX(orderid) AS lastorder
FROM Sales.Orders;

select top(1) * from sales.orders
order by orderid desc

-- Step 3: Select this query and execute it to
-- find details in Sales.OrderDetails
-- for most recent order

---Static Order
SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails
WHERE orderid = 11077

--
SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails
WHERE orderid = ( SELECT MAX(orderid) AS lastorder FROM Sales.Orders);

-- Step 4: THIS WILL FAIL, since
-- subquery returns more than 
-- 1 value
select empid, count(*) from Sales.Orders
group by empid
order by 2

select * from Sales.OrderDetails
where orderid in (10248,10254,10269,10297,10320)

select * from Sales.OrderDetails
where orderid in (select orderid from Sales.Orders where empid = 5)

select orderid from Sales.Orders where empid = 5

select * from Sales.OrderDetails


SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails
WHERE orderid = 
	(SELECT orderid AS O
	FROM Sales.Orders
	WHERE empid =2);

-- Step 5: Multi-valued subqueries 
-- Select this query and execute it to	
-- return order info for customers in Mexico
SELECT  custid, orderid
FROM Sales.orders
WHERE custid IN (
	SELECT custid
	FROM Sales.Customers
	WHERE country = N'Mexico')

select o.*
from Sales.orders as o inner join Sales.Customers as c
on o.custid = c.custid
WHERE c.country = N'Mexico'


select * from sales.OrderDetails
where orderid in (SELECT  orderid
FROM Sales.orders
WHERE custid IN (
	SELECT custid
	FROM Sales.Customers
	WHERE country = N'Mexico'))



select o.*
from Sales.orders as o 
	inner join Sales.Customers as c
	on o.custid = c.custid
	inner join sales.OrderDetails as od
	on o.orderid = od.orderid
WHERE c.country = N'Mexico'



-- Step 6: Same result expressed as a join:
SELECT c.custid, o.orderid
FROM Sales.Customers AS c JOIN Sales.Orders AS o
ON c.custid = o.custid
WHERE c.country = N'Mexico';
