select * from uber.dbo.drives;

-- Questions and Conclusions.

--------------------------------------------------------------------------------------------------------------------------

-- 1) What is the total numer of rides for each category (business/personal)?

select category, count(*) as drives_count, sum(miles) as total_miles
from uber.dbo.drives
group by category;

-- Conclusion: Business cabs have not only used more but have also travelled the most distance.

--------------------------------------------------------------------------------------------------------------------------

-- 2) What is the total number of round trips for each month?

select month(start_date) as drive_month, count(*) as drives_count
from uber.dbo.drives
where start = stop
group by month(start_date);

--------------------------------------------------------------------------------------------------------------------------

-- 3) What is the best month for rising fares?

select top 1 month(start_date) as drive_month,count(*) as drive_count
from uber.dbo.drives
group by month(start_date)
order by drive_count desc;

-- Conclusion: December is the best month for making profit by raising fares as the demand is more.

--------------------------------------------------------------------------------------------------------------------------

-- 4) Is there any noticeable trend in number of cab drives per month ?

select month(start_date) as drive_month, count(*) as drive_count
from uber.dbo.drives
group by month(start_date)
order by drive_month;

-- Conclusion: There is a seasonal pattern in cab rides, with December having the highest demand.

--------------------------------------------------------------------------------------------------------------------------

-- 5) What are the top cities with highest number of cab rides ?

select top 5 start as 'cities', count(*) as 'drives_count'
from uber.dbo.drives
group by start
order by drives_count desc;

-- Conclusions: Carry, Morrisville, Whitebridge and Islamabad are top cities with highest number of cab rides.

--------------------------------------------------------------------------------------------------------------------------
