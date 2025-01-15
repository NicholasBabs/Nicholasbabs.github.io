SELECT [order_id]
      ,[pizza_name_id]
      ,[quantity]
      ,[order_date]
      ,[order_time]
      ,[unit_price]
      ,[total_price]
      ,[pizza_size]
      ,[pizza_category]
      ,[pizza_ingredients]
      ,[pizza_name]
      ,[Column1]
  FROM [dbo].[pizza]

GO

--Total Revenue
select SUM([total_price]) as Revenue from  [dbo].[pizza]
--Total Pizzas Sold
select SUM([QUANTITY]) as total_pizzas from [dbo].[pizza]

--Total number of Orders
select count(*) from [dbo].[pizza]
select * from [dbo].[pizza]
--How many order Veggie pizza category was sold
select count(*) from [dbo].[pizza] where [pizza_category] = 'Veggie' 
--How many  The Hawaiian Pizza and  The Greek Pizza  was sold
select count(*) from [dbo].[pizza] where [pizza_name] in ('The Hawaiian Pizza', 'The Greek Pizza') 

--List of pizza ordered in January 2015
select * from [dbo].[pizza] where [order_date] between '2015-01-01' and '2015-01-31'

--List of pizza ordered between 1st of November till 31st December 2015
select * from [dbo].[pizza] where [order_date] between '2015-11-01' and '2015-12-31'

--What is the quantity of The Spinach Supreme Pizza sold in March 2015
select count(*) from [dbo].[pizza] where [pizza_name] = 'The Spinach Supreme Pizza' and [order_date] between '2015-03-01' and '2015-03-31'
--List of Medium pizza sold
select [pizza_name], [pizza_category], [pizza_size], [pizza_ingredients] from [dbo].[pizza] where [pizza_size] = 'M'
--List of pizza that sold for more than 12.5
select [pizza_name], [pizza_category], [pizza_size], [pizza_ingredients] from [dbo].[pizza] where [unit_price] > '12.5'
