-- What percantege of the movie got Certified Fresh status, Fresh status and Rotten? What is the rotten count?

select 
	round((select count(tomatometer_status) from rottentomato r
		where tomatometer_status = 'Certified Fresh') / (select count(tomatometer_status) from rottentomato r)  * 100,2) 	as certified_fresh_prc
	,round((select count(tomatometer_status) from rottentomato r
		where tomatometer_status = 'Fresh')  / (select count(tomatometer_status) from rottentomato r)  * 100,2) 			as fresh_prc
	,round((select count(tomatometer_status) from rottentomato r
		where tomatometer_status = 'Rotten')  / (select count(tomatometer_status) from rottentomato r)  * 100,2) 			as rotten_prc
	,(select count(tomatometer_status) from rottentomato r)																	as total_rotten
from rottentomato r
limit 1

