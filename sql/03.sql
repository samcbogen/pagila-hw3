/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

select country, sum(p.amount) as total_payments
from payment p inner join customer cu on cu.customer_id = p.customer_id 
inner join address a on cu.address_id = a.address_id
inner join city ci on a.city_id = ci.city_id
inner join country co on co.country_id = ci.country_id
group by country order by total_payments desc, co.country;
