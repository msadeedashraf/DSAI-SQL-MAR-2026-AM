--  Demonstration B

--  Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Join 2 tables
-- Select and execute the following query
-- to demonstrate a two-table inner join.
-- Point out that there are 77 rows output
SELECT c.categoryid, c.categoryname, p.productid, p.productname
FROM Production.Categories AS c
JOIN Production.Products AS p
ON c.categoryid = p.categoryid;

-- Step 3: Join 2 tables
-- Select and execute the following query
-- to demonstrate a two-table inner composite join.
-- Point out that there are 27 rows output without a distinct filter
select distinct city FROM Sales.Customers AS c--91customers--in 69-cities

select distinct city from HR.Employees AS e --10 employees in  6 cities


----I can server 27 customers in cities where I have employees as well
SELECT e.city, e.country
FROM Sales.Customers AS c
JOIN HR.Employees AS e 
ON c.city = e.city AND c.country = e.country;

---27 cutomer with matching in 3 cities only 


-- Step 4: Join 2 tables
-- Select and execute the following query
-- to demonstrate a two-table inner composite join.
-- Point out that there are 3 rows output with a distinct filter

---I have cutomers in 3 cities 

SELECT DISTINCT  e.city, e.country
FROM Sales.Customers AS c
JOIN HR.Employees AS e 
ON c.city = e.city AND c.country = e.country;

-- Step 5: Join multiples tables
-- Select and execute the following query
-- to demonstrate a two-table inner join.
-- Point out that the elements needed to add and display data
-- from a third table have been commented out to join
-- the first two tables only
-- 830 rows will be returned
SELECT c.custid, c.companyname, o.orderid, o.orderdate-- , od.productid, od.qty
FROM Sales.Customers AS c 
JOIN Sales.Orders AS o
ON c.custid = o.custid;
-- JOIN Sales.OrderDetails od
-- ON o.orderid = od.orderid;

-- Step 6: Join 3 tables
-- Select and execute the following query
-- to demonstrate a three-table inner join.
-- 2155 rows will be returned. Why?
SELECT c.custid, c.companyname, o.orderid, o.orderdate, od.productid, od.qty
FROM Sales.Customers AS c 
JOIN Sales.Orders AS o
ON c.custid = o.custid
JOIN Sales.OrderDetails od
ON o.orderid = od.orderid;




select * from Sales.Orders AS o--830
select * from Sales.OrderDetails od---2155
select * from Sales.Customers AS c 


select * from Sales.Orders AS o
where o.orderid = 10248

---Invoice total for one oderid 10248
select sum (unitprice*qty) from Sales.OrderDetails as od
where od.orderid = 10248

--Total Sales Since in business 
select sum (unitprice*qty) from Sales.OrderDetails as od

---Every Individual Invoice  total
select od.orderid,  sum (unitprice*qty) from Sales.OrderDetails as od
group by od.orderid

select * from 
select count()
select distinct 
select * from sales.customers

select * 
FROM Sales.Customers AS c left outer JOIN Sales.Orders AS o
on c.custid = o.custid
WHERE 
O.orderid IS NULL 

select * 
FROM sales.Orders AS o left outer join Sales.Customers AS c 
on c.custid = o.custid



select * 
FROM sales.Orders AS o right outer join Sales.Customers AS c 
on c.custid = o.custid

select * 
FROM Sales.Customers AS c right outer JOIN Sales.Orders AS o
on c.custid = o.custid


select distinct country from hr.Employees
select distinct CITY from hr.Employees E
select * 
FROM sales.Orders AS o right outer join Sales.Customers AS c 
