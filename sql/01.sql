/*
 * Compute the number of customers who live outside of the US.
 */

select count(*)
from customer cu inner join address a on cu.address_id = a.address_id
inner join city ci on ci.city_id = a.city_id
inner join country co on co.country_id = ci.country_id where co.country != 'United States';
