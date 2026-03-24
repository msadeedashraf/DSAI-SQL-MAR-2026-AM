--  Demonstration B

--  Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Correlated subqueries
-- Select this query and execute it to show
-- Customers with most recent order info per customer
-- 
-- (Note that this query may return more than one row per
-- customer if there are multiple orders placed per customer
-- per date. Be sure to test your own data
-- when adapting this query to other data sources. There is no
-- logic in this example to handle ties.)

SELECT custid, orderid, orderdate
FROM Sales.Orders AS outerorders
WHERE orderdate =
	(SELECT MAX(orderdate)
	FROM Sales.Orders AS innerorders
	WHERE innerorders.custid = outerorders.custid)
ORDER BY custid;



SELECT custid, orderid, orderdate
FROM Sales.Orders AS oo 
where orderdate = (select max(orderdate) from Sales.Orders ino where oo.custid = ino.custid)
order by 1

SELECT custid, orderid, orderdate
FROM Sales.Orders AS oo 
order by 1,3 desc

1	11011	2008-04-09 00:00:00.000
2	10926	2008-03-04 00:00:00.000
3	10856	2008-01-28 00:00:00.000
4	11016	2008-04-10 00:00:00.000


SELECT custid, count(*)
FROM Sales.Orders AS oo 
where orderdate = (select max(orderdate) from Sales.Orders ino where ino.custid =  oo.custid)
group by custid
having count(*) > 1

SELECT custid, orderid, orderdate
FROM Sales.Orders AS oo 
where orderdate = 


select t1.custid, t2.orderid, t2.orderdate from 
(select custid,  max(orderdate) as max_cust_orderdate from Sales.Orders ino 
group by custid)  t1 
inner join 
( SELECT custid, orderid, orderdate FROM Sales.Orders AS oo ) t2
on  t1.custid = t2.custid
and t1.max_cust_orderdate = t2.orderdate
order by 1


-- Step 3: Select and execute the following query to 
-- show the use of a correlated subquery that
-- uses the empid from Sales.Orders to retrieve
-- orders placed by an employee on the latest order 
-- date for each employee
SELECT orderid, empid, orderdate
FROM Sales.Orders AS O1
WHERE orderdate =
	(SELECT MAX(orderdate)
	 FROM Sales.Orders AS O2
	 WHERE O2.empid = O1.empid)
ORDER BY empid, orderdate;


SELECT empid, orderid, orderdate
FROM Sales.Orders AS oo 
order by 1,3 desc


-- Step 4: Select and execute the following query to 
-- show the use of a correlated subquery that
-- uses the custid from Sales.Custorders to retrieve
-- orders placed by a customer with the highest 
-- quantity for each customer
SELECT custid, ordermonth, qty
FROM Sales.Custorders AS outercustorders
WHERE qty =
	(SELECT MAX(qty)
		FROM Sales.CustOrders AS innercustorders
		WHERE innercustorders.custid =outercustorders.custid
	)
ORDER BY custid;


SELECT custid, ordermonth, qty
FROM Sales.Custorders
order by 1, 3 desc
/*
1	2008-04-01 00:00:00.000	60
2	2008-03-01 00:00:00.000	29
3	2007-09-01 00:00:00.000	102
*/