/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

select title
from film fi join film_actor fa on fa.film_id = fi.film_id
where actor_id in (
    select actor_id
    from film_actor fa join film fi on fa.film_id = fi.film_id where title = 'AMERICAN CIRCUS')
group by title having count(*) > 1
order by title;
