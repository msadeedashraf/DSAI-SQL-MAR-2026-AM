select 
	e.firstname,
	e.lastname,
	e.city,
	e.country
from [HR].[Employees] as e

select  
c.contacttitle,c.country,c.city, c.address
from [Sales].[Customers] as c

select 
s.companyname, s.phone, s.shipperid
from [Sales].[Shippers] as s

select 
od.productid, od.qty, od.unitprice
from [Sales].[OrderDetails] as od

