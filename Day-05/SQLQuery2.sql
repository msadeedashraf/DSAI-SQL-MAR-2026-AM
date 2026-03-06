SELECT TOP (1000) [SalesOrderID]
      ,[RevisionNumber]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
      ,[Status]
      ,[OnlineOrderFlag]
      ,[SalesOrderNumber]
      ,[PurchaseOrderNumber]
      ,[AccountNumber]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[TerritoryID]
      ,[BillToAddressID]
      ,[ShipToAddressID]
      ,[ShipMethodID]
      ,[CreditCardID]
      ,[CreditCardApprovalCode]
      ,[CurrencyRateID]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
      ,[Comment]
      ,[rowguid]
      ,[ModifiedDate]
 
 
 select year(soh.OrderDate) as [YEAR] , Count(*)
 FROM [AdventureWorks].[Sales].[SalesOrderHeader] as soh
 --where year(soh.OrderDate)  = 2007
 group by year(soh.OrderDate)
 order by [YEAR]

 select year(soh.OrderDate) as [YEAR] , Count(*)
 FROM [AdventureWorks].[Sales].[SalesOrderHeader] as soh
 --where year(soh.OrderDate)  = 2007
 group by year(soh.OrderDate)
 order by 2 desc
