

select * from [Sample - Superstore];
--
select Top(5) * from [Sample - Superstore];
-- sales by city
select top(10) City , SUM(Sales) as TotaL_Sales
from [Sample - Superstore]
group by city;

-- Customer by Transaction

select Top(10) Customer_Name , Count(Order_ID) as Transation_NUM
from [Sample - Superstore]
group by Customer_Name
order by Transation_NUM desc;

-- Customer Segmentation
Create view Customers_Levels AS
select Customer_Name ,round(SUM(Sales),1) as TotaL_Sales,
Case
    when SUM(Sales)>=10000 then 'VIP Customer'
    when SUM(Sales)>=5000 then 'AVG Customer'
    else  'Normal Customer'
end as Customer_level

from [Sample - Superstore]
group by Customer_Name;
---------------
select * from Customers_Levels;
----------------
Select Customer_Level, count(Customer_Level) as customer_Count
from Customers_Levels
group by Customer_Level
order by customer_Count desc;
-----------------
select * from Customers_Levels
where Customer_Level ='VIP Customer';

-----------------------------------------
--sales over Time?--

-- By Year
select Year(Order_Date) as year ,
round(SUM(Sales),1) as TotaL_Sales
From [Sample - Superstore]
Group by Year(Order_Date)
order by year;

--By year , Month
select Year(Order_Date) as year ,Month(Order_Date) as Month,
round(SUM(Sales),1) as TotaL_Sales
From [Sample - Superstore]
Group by Year(Order_Date),Month(Order_Date)
order by year, Month;

----- sales by segment 
select Segment,round(SUM(Sales),2) AS Total_Sales
From [Sample - Superstore]
Group by Segment
order by Total_Sales DESC;
