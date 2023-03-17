select distinct(SoldAsVacant), count(soldasvacant)
from Akin_tutorial.dbo.[Nashville-housing]
group by SoldAsVacant
order by 2

select SoldAsVacant
,case when SoldAsVacant = 'Y' THEN 'Yes'
      when SoldAsVacant  = 'N' Then 'NO'
	  ELSE SoldAsVacant
	  END
from Akin_tutorial.dbo.[Nashville-housing]
update [Nashville-housing]
set SoldAsVacant =case when SoldAsVacant = 'Y' THEN 'Yes'
      when SoldAsVacant  = 'N' Then 'NO'
	  ELSE SoldAsVacant
	  END
	  select *
	  from Akin_tutorial.dbo.[Nashville-housing]  
