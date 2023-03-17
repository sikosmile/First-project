select *
from Akin_tutorial.dbo.[Nashville-housing]
select SaleDate, CONVERT(DATE,SaleDate)
from Akin_tutorial.dbo.[Nashville-housing]
update [Nashville-housing]
SET SaleDate = CONVERT(DATE,SaleDate)
select*
from Akin_tutorial.dbo.[Nashville-housing]
where PropertyAddress is null
select a.ParcelID, a.PropertyAddress, b. ParcelID, b. PropertyAddress, ISNULL(a. PropertyAddress,b. PropertyAddress)
from Akin_tutorial.dbo.[Nashville-housing] a
join Akin_tutorial.dbo.[Nashville-housing] b
on a.ParcelID = b. ParcelID
And a.[UniqueID ] <> b.[UniqueID ]
update a
set propertyaddress = ISNULL(a. PropertyAddress,b. PropertyAddress)
from Akin_tutorial.dbo.[Nashville-housing] a
join Akin_tutorial.dbo.[Nashville-housing] b
on a.ParcelID = b. ParcelID
And a.[UniqueID ] <> b.[UniqueID ]
--where a.PropertyAddress is null 

select PropertyAddress
from Akin_tutorial.dbo.[Nashville-housing]
