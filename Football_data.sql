SELECT [Year]
      ,[Team]
      ,[NAME ]
      ,[No#]
      ,[Pos]
      ,[Ht]
      ,[Wt]
      ,[Age]
      ,[Exp]
      ,[College]
      ,[FirstName]
      ,[LastName]
      ,[Ft]
      ,[In]
      ,[Inches]
  FROM [dbo].[Football Data 1]

GO
--Write a query to find all the players in the "Arizona" team.
select * from [dbo].[Football Data 1] where team = 'Arizona'

--Write a query to find all the players who play as a "WR" (Wide Receiver).
select * from [dbo].[Football Data 1] where [Pos] = 'WR'

--Write a query to list all players taller than 6 feet 2 inches.
select * from [dbo].[Football Data 1] where [Inches] > '74'

--Write a query to find all players who attended the "Washington" college.	
select * from [dbo].[Football Data 1] where [College] = 'Washington'

--Write a query to list players who are 25 years old or younger.	
select * from [dbo].[Football Data 1] where [Age] <= '25'
--Write a query to find all players with missing Age data.	
select * from [dbo].[Football Data 1] where [age] = 'N/A'
--Write a query to find players who are rookies (Exp = 'R').
select * from [dbo].[Football Data 1] where [Exp] = 'R'

--Write a query to find the tallest player on the "New Orleans" team.	
Select [Team], MAX([inches]) as Max_height
from [dbo].[Football Data 1] group by [team] having [team] = 'New Orleans'

--Write a query to find players weighing more than 250 pounds.		
select * from [dbo].[Football Data 1] where [wt] > '250'

--Write a query to find the heaviest player for each position.
select [pos], max([wt]) as max_wt from  [dbo].[Football Data 1] group by [pos]

--Write a query to rank players by age within their team. If two players have the same age, rank them by their weight.
select *, Rank() over(partition by [team] order by [age] desc, [wt] desc) AS Rank_age from [dbo].[Football Data 1] where [age] <> 'N/A'

--Write a query to calculate the average height (in inches) for all players older than 25 years.
select avg("Inches") as avg_inches from [dbo].[Football Data 1] where age > '25'

--Write a query to find all players whose height is greater than the average height of their respective team.
SELECT 
    [Name], 
    [Pos], 
    [Age], 
    [Inches],
    avg_height_per_team
FROM (
    SELECT 
        [Name], 
        [Pos], 
        [Age], 
        [Inches], 
        AVG([Inches]) OVER (PARTITION BY [Team]) AS avg_height_per_team
    FROM [dbo].[Football Data 1]
) AS subquery
WHERE [Inches] > avg_height_per_team;


--Write a query to find all players who share the same last name.
select * from [dbo].[Football Data 1] where [lastname] in (select [lastname] from [dbo].[Football Data 1] group by [lastname] having count(*) > 1)

--Write a query to find the players with the minimum height for each position.
select [name], [pos], MIN([inches]) as min_ht from [dbo].[Football Data 1] group by [pos], [name]
--Write a query to get the number of players for each team grouped by their experience level.
select count(*) as no_of_players, [exp], [team] from [dbo].[Football Data 1] group by [exp], [team] order by [exp] desc


--Write a query to find the tallest and shortest players from each college.
select [college], MIN([inches]) as [minimum height], MAX([inches]) as [maximum height] from [dbo].[Football Data 1] group by [college] order by [college] asc

--Write a query to find all players whose weight is above the average weight for their respective position.
select [name], [college], [pos], [team], [wt], [avg_wt] from (select *, avg([wt]) over(partition by [pos]) as avg_wt from [dbo].[Football Data 1]) as subquery where [wt] > [avg_wt]

--Write a query to calculate the percentage of players in each position for every team.
Select [team], [pos], count(*) as number_of_people, 
count(*) * 100/sum(count(*)) OVER (PARTITION BY [TEAM]) AS PERCENTAGE_OF_TEAM
from [dbo].[Football Data 1] group by [pos],[TEAM]
