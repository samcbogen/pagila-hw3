/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

select first_name || ' ' || last_name as "Actor Name"
from actor a inner join film_actor fa on fa.actor_id = a.actor_id
where film_id in (
    select fa.film_id
    from film_actor fa join actor a on fa.actor_id = a.actor_id where first name = 'RUSSELL' and last_name = 'BACALL')
and not (first_name = 'RUSSELL' and last_name = 'BACALL')
group by "Actor Name" order by "Actor Name";
