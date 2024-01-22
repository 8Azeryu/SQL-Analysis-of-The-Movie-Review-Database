-- How is the total movie count changeing during years and how by months?

select month(in_theaters_date) 			as relese_month
	,count(movie_title)	   				as total_movies
from rottentomato r
where in_theaters_date between '01.01.1998' and '31.07.2012'
group by relese_month 
order by total_movies desc
