---Case study: MALARIA IN NIGERIA
--Malaria deaths per year in nigeria (1990-2019)
select year, [ Malaria]
from Causes_Of_Deaths
WHERE entity like '%Nigeria%'
order by Year asc
--Year with highest number of deaths in Nigeria
select  year, [ Malaria]
from Causes_Of_Deaths
WHERE Entity like '%Nigeria%'
order by [ Malaria] desc
--Total number of deaths caused by malaria(1990-2019)
select  sum([ Malaria]) as totalDeaths
from Causes_Of_Deaths
WHERE Entity like '%Nigeria%'
---The percentage of malaria deaths in the population per year
--Joining population to the table
select a. entity, a. year , a. [ MalariaDeaths], b. population
from ['annual-number-of-deaths-by-cause'] a
join naijapopulation b
on a. entity = b. Entity
and a. year = b. year
where a. entity like '%nigeria%'
--Calculating the percentage of deaths by malaria in nigeria(1990-2019)
select a. entity, a. year , a. [ MalariaDeaths], b. population,  (a. [ MalariaDeaths]/ b. population * 100) as PercentageOfMalariaDeaths
from ['annual-number-of-deaths-by-cause'] a
join naijapopulation b
on a. entity = b. Entity
and a. year = b. year
where a. entity like '%nigeria%'
--Adding percentage to the table
alter table ['annual-number-of-deaths-by-cause']
add PercentageOfMalariaDeaths float
Update a
SET PercentageOfMalariaDeaths = ([ MalariaDeaths]/ population * 100)
from ['annual-number-of-deaths-by-cause'] a
join naijapopulation b
on a. entity = b. Entity
and a. year = b. year
where a. entity like '%nigeria%'
select year, PercentageOfMalariaDeaths
from ['annual-number-of-deaths-by-cause']
WHERE Entity like '%Nigeria%'
order by Year asc

