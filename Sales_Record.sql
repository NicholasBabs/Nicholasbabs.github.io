SELECT [Salesman_id]
      ,[Name]
      ,[city]
      ,[commission]
  FROM [dbo].[Salesman$]

SELECT [Customer_ID]
      ,[Customer_Name]
      ,[City]
      ,[Grade]
      ,[Salesman_ID]
  FROM [dbo].[Customer$]

  SELECT [Order Number]
      ,[Purchase_Amount]
      ,[Order Date]
      ,[Customer ID]
      ,[Salesman_id]
  FROM [dbo].[Order$]
  where [order number] is not null

GO


--write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
Select S.[name], C.[customer_name], S.[city]
from [dbo].[Salesman$] as S 
inner join [dbo].[Customer$] as C 
ON S.[CITY] = C.[CITY]

--write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
select O.[order number], O.[purchase_amount], C.[customer_name], C.[city] 
from [dbo].[Order$] as O 
inner join [dbo].[Customer$] as C
ON o.[Customer ID] = C.[Customer_ID]
WHERE O.[Purchase_Amount] BETWEEN '500' AND '2000'

--write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
SELECT S.[Name], C.[Customer_Name],C.[City], S.[Commission]
from [dbo].[Salesman$] as S
INNER JOIN [dbo].[Customer$] AS C
ON S.[Salesman_ID] = C.[Salesman_ID]


--write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.  
Select S.[Name], S.[Commission], C.[Customer_Name], C.[City] 
from [dbo].[Salesman$] as S
INNER JOIN [dbo].[Customer$] as C
ON  S.[Salesman_ID] = C.[Salesman_ID]
WHERE S.[Commission] > 0.12

--write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  
select S.[Name], C.[Customer_Name], S.[city], C.[city], S.[commission]
from [dbo].[Salesman$] as S
inner join [dbo].[Customer$] as C
on s.[Salesman_ID] = c.[Salesman_Id]
where S.[city] <> C.[city] and s.[commission] > '0.12'

--write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
select o.[order number], o.[order date], o.[purchase_amount], c.[customer_name], c.[grade], s.[name], s.[commission]
from [dbo].[Order$] as O
INNER JOIN [dbo].[Customer$] AS C 
ON O.[customer id] = c.[customer_id]
inner join [dbo].[Salesman$] as S
on o.[salesman_id] = S.[salesman_id]

--Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
select o.[order number], o.[order date], o.[purchase_amount], c.[Customer_ID], c.[customer_name], c.[grade], c.City,  s.[name], s.[commission], s.Salesman_id, s.city
from [dbo].[Order$] as O
INNER JOIN [dbo].[Customer$] AS C 
ON O.[customer id] = c.[customer_id]
inner join [dbo].[Salesman$] as S
on o.[salesman_id] = S.[salesman_id]

--write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
select  c.[customer_name], c.[city], c.[grade], s.[name], s.[city]
from [dbo].[Customer$] as C
INNER JOIN [dbo].[Salesman$] AS S
ON C.[Salesman_ID] = s.Salesman_id
order by c.Customer_ID asc

--write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.
select C.[customer_name], C.[city], C.[grade], S.[name] as salesman, S.[city] as salesmancity
from [dbo].[Customer$] as C
inner join [dbo].[Salesman$] AS S
on C.[Salesman_ID] = s.Salesman_id
where c.[grade] < '300' 
order by c.[customer_id] asc

--Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.
select C.[customer_name], C.[city], O.[order number], O.[order date], O.[purchase_amount] 
from [dbo].[Customer$] as C
inner join [dbo].[Order$] as O
ON C.Customer_ID = O.[Customer ID]
order by o.[Order Date] asc

--SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
select c.[customer_name], c.[city], o.[order date], o.[order number], o.[purchase_amount], S.[name], S.[commission]
from [dbo].[Customer$] as C
LEFT JOIN [dbo].[Order$] as O
ON C.[Customer_id] = o.[customer id]
inner join [dbo].[Salesman$] as S
on c.[salesman_id] = S.[Salesman_id]

--Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
SELECT 
    S.salesman_id, 
    S.name AS salesman_name, 
    S.commission, 
    COUNT(C.customer_id) AS customer_count
FROM 
    [dbo].[Salesman$] AS S
LEFT JOIN 
    [dbo].[Customer$] AS C
    ON S.salesman_id = C.salesman_id
GROUP BY 
    S.salesman_id, 
    S.name, 
    S.commission
ORDER BY 
    customer_count DESC
	


--write a SQL query to list all salespersons along with customer name, city, grade, order number, date, amount.
SELECT S.Name, S.city, S.commission, S.Salesman_id, C.Customer_Name, C.City, C.Grade, o.[Order Number], o.[Order Date], o.Purchase_Amount
FROM [dbo].[Salesman$] AS S
LEFT JOIN [dbo].[Customer$] AS C
ON S.[Salesman_id] = C.[Salesman_Id]
left join [dbo].[Order$] as o
on s.Salesman_id = o.Salesman_id
--Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
select s.Salesman_id, s.[NAME], s.commission, s.city, C.[customer_name], C.[grade], O.[purchase_amount]
from [dbo].[Salesman$] as s
left join [dbo].[Customer$] as C
ON S.[SALESMAN_ID] = C.[SALESMAN_ID]
LEFT JOIN [dbo].[Order$] AS O
ON S.[SALESMAN_ID] = C.[SALESMAN_ID]
WHERE O.[PURCHASE_AMOUNT] > '2000' AND C.[Grade] IS NOT NULL


--For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount

SELECT 
    C.[customer_name] , 
    C.[City],
    O.[order number], 
    O.[Order Date], 
    O.purchase_amount
FROM 
    [dbo].[Order$] AS O
LEFT JOIN 
    [dbo].[Customer$] AS C
    ON O.[customer id] = C.customer_id
WHERE 
    O.[Order Number] IS NOT NULL

--Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.

SELECT 
    C.Customer_Name,
    C.City,
    O.[Order Number],
    O.[Order Date],
    O.purchase_amount
FROM 
    [dbo].[Order$] AS O
LEFT JOIN 
    [dbo].[Customer$] AS C
    ON O.[Customer ID] = C.customer_id
WHERE 
    C.customer_id IS NOT NULL AND C.grade IS NOT NULL
    

--Write a SQL query to combine each row of the salesman table with each row of the customer table.
SELECT 
    S.[Salesman_id],
    S.[NAME], 
    S.[COMMISSION], 
    S.[CITY], 
    C.[customer_id], 
    C.[customer_name], 
    C.[CITY],
	C.[GRADE]
FROM 
    [dbo].[Salesman$] AS S
CROSS JOIN 
    [dbo].[Customer$] AS C;

--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.
SELECT 
    S.[Salesman_id], 
    S.[name], 
    S.[city], 
    C.[customer_id], 
    C.[customer_name], 
    C.[city] AS customer_city
FROM 
    [dbo].[Salesman$] AS S
CROSS JOIN 
    [dbo].[Customer$] AS C
WHERE 
    S.city = C.city


--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.
SELECT 
    S.[Salesman_id], 
    S.[name], 
    S.[city], 
    C.[customer_id], 
    C.[customer_name], 
    C.[city] AS customer_city,
	c.[grade]
FROM 
    [dbo].[Salesman$] AS S
CROSS JOIN 
    [dbo].[Customer$] AS C
WHERE 
    S.[city] is not null AND C.[Grade] is not null



--Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.
SELECT 
    S.[Salesman_id], 
    S.[name], 
    S.[city], 
    C.[customer_id], 
    C.[customer_name], 
    C.[city] AS customer_city,
	c.[grade]
FROM 
    [dbo].[Salesman$] AS S
CROSS JOIN 
    [dbo].[Customer$] AS C
WHERE 
    S.[city] <> c.[City] and C.[Grade] is not null
