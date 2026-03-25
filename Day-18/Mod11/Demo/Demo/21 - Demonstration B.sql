-- Demonstration B

-- Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Using functions
-- Select and execute the following to 
-- demonstrate using the sample function
-- Note: dbo.GetNums() takes as parameters: @low (bigint) and (@high) bigint
SELECT * FROM dbo.GetNums(10,20);
GO

-- Step 3: Creating simple functions
-- Select and execute the following to 
-- Create a function to calculate line extension for orders
CREATE FUNCTION Sales.fn_LineTotal ( @orderid INT )
RETURNS TABLE
AS
RETURN
    SELECT  orderid, productid, unitprice, qty, discount,
            CAST(( qty * unitprice * ( 1 - discount ) ) AS DECIMAL(8, 2)) AS line_total
    FROM    Sales.OrderDetails
    WHERE   orderid = @orderid ;
GO
-- Use the function


SELECT orderid, productid, unitprice, qty, discount, line_total
FROM Sales.fn_LineTotal(10252) AS LT;
GO

--Table value function
--TVF

year(orderdate)


CREATE FUNCTION Sales.fn_LineTotal ( @my_orderid INT )
RETURNS TABLE
AS
RETURN
  SELECT  orderid, productid, unitprice, qty, discount,
            CAST(( qty * unitprice * ( 1 - discount ) ) AS DECIMAL(8, 2)) AS line_total
    FROM    Sales.OrderDetails
    WHERE   orderid = @my_orderid ;

select * from Sales.fn_LineTotal(10449)

select * from abc()

create view hr.v_hr_emp_list
as
select e.empid , e.lastname, e.firstname, e.hiredate, e.country, e.city from hr.employees as e

select * from hr.v_hr_emp_list
where 
country = 'USA'
--empid = 9

drop function hr.tvf_hr_emp_list

CREATE FUNCTION  hr.tvf_hr_emp_list(@my_city varchar(10) )
RETURNS TABLE
AS
RETURN
select  e.empid , e.lastname, e.firstname, e.hiredate, e.country, e.city from hr.employees as e
where e.city like @my_city



select * from hr.tvf_hr_emp_list('Toronto')

select * from hr.tvf_hr_emp_list('%')

drop FUNCTION  sales.tvf_my_top_orders

CREATE FUNCTION  sales.tvf_my_top_orders(@my_top int , @my_order_date varchar(10))
RETURNS TABLE
AS
RETURN
select top(@my_top) o.orderid,o.custid,o.orderdate  from sales.orders as o
where year(o.orderdate) = @my_order_date

select * from Sales.tvf_my_top_orders(100, '2007')

-- Step 4: Cleanup
DROP FUNCTION Sales.fn_LineTotal;
GO