--                                Source Queries For ETL 

--Customers Analysis
select 
C.Customer,
C.[Primary Contact],
D.[Calendar Year],
S.Profit,
S.Quantity,
S.[Sale Key],
S.[Customer Key]
from Fact.Sale S
join Dimension.Customer C on S.[Customer Key]=C.[Customer Key]
join Dimension.Date D on S.[Invoice Date Key]=D.Date

--Cities Sales Analysis 
select 
C.[City Key],
C.City,
C.[Sales Territory],
S.Quantity,
S.Profit,
Cust.[Customer Key],
D.[Calendar Year]
from Fact.Sale S
join Dimension.City C on S.[City Key]=C.[City Key]
join Dimension.Customer Cust on S.[Customer Key]=Cust.[Customer Key]
join Dimension.Date D on S.[Invoice Date Key]=D.Date

--Supplier 
select
S.Supplier,
S.[Supplier Key],
D.Month,
D.[Calendar Year],
P.[Ordered Quantity],
St.[Stock Item]
from Fact.Purchase P
join Dimension.Date D on P.[Date Key]=D.Date
join Dimension.Supplier S on P.[Supplier Key]=S.[Supplier Key]
join Dimension.[Stock Item] St on P.[Stock Item Key]=St.[Stock Item Key]


--Trend Overtimes
select 
D.[Calendar Year],
D.Month,
S.Profit,
S.Quantity
from Fact.Sale S
join Dimension.[Date] D on S.[Invoice Date Key]=D.Date
------------------------------------------------
-- sales person
select
s.[Sale key],
s.[Salesperson key],
s.Quantity,
s.Profit,
e.Employee,
D.[Calendar Year],
C.[Customer Key]
from Fact.Sale s
join Dimension.Employee e on S.[Salesperson Key]=E.[Employee Key]
join Dimension.Customer C on S.[Customer Key]=C.[Customer Key]
join Dimension.Date D on S.[Invoice Date Key]=D.Date
------------------------------------------------
--total Orders for each year in each month
select St.[Stock Item Key],
St.[Stock Item],
D.[Calendar Month Number],
D.[Calendar Year],
count(O.[Order Date Key]) as total_orders
from Fact.[Order] O
join Dimension.[Stock Item] St on O.[Stock Item Key]=St.[Stock Item Key]
join Dimension.Date D on O.[Order Date Key]=D.Date
group by St.[Stock Item Key],
St.[Stock Item],D.[Calendar Year],
D.[Calendar Month Number]
order by [Calendar Year] desc
------------------------------------------------

