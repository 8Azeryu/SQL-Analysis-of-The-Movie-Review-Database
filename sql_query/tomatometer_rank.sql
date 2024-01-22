select 
	distinct tomatometer_rating
	,movie_title
	,tomatometer_count 
	,genre 
from rottentomato r 
order by tomatometer_rating desc 

-- The top movies rated by totomatometer have in common "Drama"