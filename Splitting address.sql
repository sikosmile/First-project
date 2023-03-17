select PropertyAddress
from Akin_tutorial.dbo.[Nashville-housing]
SELECT
SUBSTRING(PropertyAddress,1,charindex(',',PropertyAddress)-1) as Address
,SUBSTRING(PropertyAddress,charindex(',',PropertyAddress)+1, len(PropertyAddress)) as Address
from Akin_tutorial.dbo.[Nashville-housing]

alter table [Nashville-housing]
Add PropertysplitAddress nvarchar(200);

Update [Nashville-housing]
set PropertysplitAddress = SUBSTRING(PropertyAddress,1,charindex(',',PropertyAddress)-1)

alter table [Nashville-housing]
Add PropertysplitCity nvarchar(200);

Update [Nashville-housing]
set Propertysplitcity = SUBSTRING(PropertyAddress,charindex(',',PropertyAddress)+1, len(PropertyAddress))
select *
from Akin_tutorial.dbo.[Nashville-housing]
select OwnerAddress
from Akin_tutorial.dbo.[Nashville-housing]
select 
parsename(replace(OwnerAddress, ',','.'),3)
,parsename(replace(OwnerAddress, ',','.'),2)
,parsename(replace(OwnerAddress, ',','.'),1)
from Akin_tutorial.dbo.[Nashville-housing]
alter table [Nashville-housing]
Add OwnersplitAddress nvarchar(200);
alter table [Nashville-housing]
Add Ownersplitcity nvarchar(200);
alter table [Nashville-housing]
Add OwnersplitState nvarchar(200);
Update [Nashville-housing]
set OwnersplitAddress = parsename(replace(OwnerAddress, ',','.'),3)
Update [Nashville-housing]
set Ownersplitcity = parsename(replace(OwnerAddress, ',','.'),2)
Update [Nashville-housing]
set OwnersplitState = parsename(replace(OwnerAddress, ',','.'),1)


