use tsql
go

DECLARE @currencyValue decimal = 200.364
SELECT [language], FORMAT (@currencyValue, 'c', [langcode]) as FormattedDate 
FROM CountryCurrency

select * from dbo.CountryCurrency
where language like 'english%canada'