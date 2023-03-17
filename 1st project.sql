 select *
from [deaths-by-risk-factor 2]
where Entity like '%nigeria%'
--Total number of deaths in nigeria per year
select [Entity],[Year],([ Outdoor air pollution - OWID] + [High body-mass index] + [ High systolic blood pressure]+ [ Diet high in sodium]+ [ Diet low in nuts and seeds]+[ Alcohol use]+ [ Diet low in fruits ]+ [ Unsafe sex ]+[Secondhand smoke]+[ Low birth weight ]+ [ Child wasting ]+[ Unsafe sex ]+ [ Diet low in vegetables]+[ Household air pollution from solid fuels]+[ Low physical activity]+ Smoking+ [ High fasting plasma glucose ]+[ Air pollution ]+[High body-mass index]+[ Unsafe sanitation]+ [No access to handwashing facility]+[ Drug use ]+ [ Low bone mineral density]+[Vitamin A deficiency ]+[Child stunting]+[Discontinued breastfeeding]+[ Non-exclusive breastfeeding ]+[ Iron deficiency ]) as totalDeath
from [deaths-by-risk-factor 2] 
where Entity like '%Nigeria%'
-- Percentage of death in whole population
-- Adding total deaths to the table.
alter table [deaths-by-risk-factor 2]
alter column TotalDeaths float
-- Removing exponential from the results.
select CONVERT(numeric,cast(totaldeaths as float))
from [deaths-by-risk-factor 2]
update [deaths-by-risk-factor 2]
set TotalDeaths = CONVERT(numeric,cast(totaldeaths as float))
-- joining population to the table
select a. entity, a. year , a. totalDeaths, b. population
from [deaths-by-risk-factor 2] a
join naijapopulation b
on a. entity = b. Entity
and a. year = b. year
where a. entity like '%nigeria%'
--Working out the percentage of deaths per year 
select a. entity, a. year , a. totalDeaths, b. population,  (a. totalDeaths/ b. population * 100) as PercentageOfDeaths
from [deaths-by-risk-factor 2] a
join naijapopulation b
on a. entity = b. Entity
and a. year = b. year
where a. entity like '%nigeria%'
-- Inserting the percentage into the table
alter table [deaths-by-risk-factor 2]
add HighestDeathsCounts  int
Update a
SET PercentageOfDeaths = (totalDeaths/ population * 100)
from [deaths-by-risk-factor 2] a
join naijapopulation b
on a. entity = b. Entity
and a. year = b. year
where a. entity like '%nigeria%'
-- Looking at the the year with the highest deaths in nigeria.
select Entity, Year, PercentageOfDeaths, TotalDeaths
from [deaths-by-risk-factor 2]
where entity like '%nigeria%' 
group by Entity, Year, PercentageOfDeaths, TotalDeaths
order by TotalDeaths desc
--All deaths in nigeria since 1990
Select Sum(TotalDeaths) as SumTotaldeaths
from [deaths-by-risk-factor 2]
where entity like '%nigeria%'

 












