USE AdventureWorks
SELECT
	FirstName,
	LastName
FROM
	[AdventureWorks].[SalesLT].[Customer]
ORDER BY 
	LastName
	
SELECT
	FirstName + ' ' +  LastName AS FullName
FROM
	[AdventureWorks].[SalesLT].[Customer]
ORDER BY 
	FirstName

SELECT
	CountryRegion
FROM
	[AdventureWorks].[SalesLT].[Address]

SELECT  DISTINCT
	FirstName, LastName, [Address].City, [Address].CountryRegion
FROM
	[AdventureWorks].[SalesLT].[Customer] AS Customer
INNER JOIN 
	[AdventureWorks].[SalesLT].[CustomerAddress] AS CustomerAddress ON CustomerAddress.CustomerID = Customer.CustomerID
INNER JOIN 
	[AdventureWorks].[SalesLT].[Address] AS [Address] ON CustomerAddress.AddressID = [Address].AddressID
ORDER BY
	[Address].CountryRegion, 
	[Address].City,
	Customer.LastName,
	Customer.FirstName