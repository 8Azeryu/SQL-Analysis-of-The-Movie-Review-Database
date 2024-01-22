select 
	audience_rating
	,movie_title
	,audience_count 
	,genre 
from rottentomato r 
where audience_count > 100000
order by audience_rating desc
-- The top movies rated by audience have in common "Drama" , heavy emotional response engaging scenes that get into viewers mind are mostly rated very high.