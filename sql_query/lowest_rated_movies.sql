-- What are the lowest rated movie sutios? 

with
base as 
(
select studio_name from rottentomato r 
),
t_studio_avg	as	
(
select
	studio_name 
	,round(avg(tomatometer_rating), 2)	 								as  avg_tomato_raiting
from  rottentomato r 	
group by 1 
),
a_studio_avg	as	
(
select
	studio_name 
	,round(avg(audience_rating), 2) 									as  avg_audience_raiting
from  rottentomato r 
group by 1 
),
agregation 	as
(
select 
	distinct b.studio_name														as studio_name
	,tsa.avg_tomato_raiting												as avg_tomato_raiting	
	,asa.avg_audience_raiting 											as avg_audience_raiting
	,rank() over 
		(order by tsa.avg_tomato_raiting desc)    						as dense_rank_ranking 	
from t_studio_avg tsa	
right join a_studio_avg asa 	on 	tsa.studio_name = asa.studio_name
right join base		  b		on 	b.studio_name 	= asa.studio_name
)
select
	a.studio_name
	,a.avg_tomato_raiting as avg_ranking
from agregation a
order by a.avg_tomato_raiting asc  