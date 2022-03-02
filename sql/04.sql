/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */


select first_name, last_name
from actor
where actor_id in (
    select distinct(a.actor_id)
    from actor a
    inner join film_actor fa on a.actor_id = fa.actor_id
    inner join film fi on fi.film_id = fa.film_id
    inner join film_category fc on fc.film_id = fi.film_id
    inner join category c on c.category_id = fc.category_id
    where c.name = 'Children')
and actor_id not in (
    select distinct(a.actor_id)
    from actor a
    inner join film_actor fa on a.actor_id = fa.actor_id
    inner join film fi on fi.film_id = fa.film_id
    inner join film_category fc on fc.film_id = fi.film_id
    inner join category c on c.category_id = fc.category_id
    where c.name = 'Horror')
order by last_name, first_name;
