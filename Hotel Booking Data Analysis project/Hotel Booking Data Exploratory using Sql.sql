
-- union three table to check the revenue than make temp column alias as Revenue and get revenue by year and hotel type
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'])

select arrival_date_year , hotel ,round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as Revenue from hotels group by arrival_date_year,hotel


-- Now join market segment table to our market segment column in this three table

with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'])

select * from hotels
left join dbo.market_segment$
on hotels.market_segment=market_segment$.market_segment
-- join meal cost table and match meal with meal cost
left join dbo.meal_cost$
on meal_cost$.meal=hotels.meal