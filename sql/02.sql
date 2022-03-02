/*
 * Compute the country with the most customers in it. 
 */

select country
from customer cu inner join address a on cu.address_id = a.address_id 
inner join city ci on a.city_id = ci.city_id 
inner join country co on co.country_id = ci.country_id 
group by co.country order by count(*) desc limit 1;
