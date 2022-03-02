/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

with bacall_1 as (
    select a.actor_id
    from actor a
    inner join film_actor fa on fa.actor_id = a.actor_id
    where film_id in (
        select fa.film_id
        from film_actor fa
        join actor a on fa.actor_id = a.actor_id
        where first_name = 'RUSSELL' and last_name = 'BACALL')
    and not (first_name = 'RUSSELL' and last_name = 'BACALL')
    )
select distinct a1.first_name || ' ' || a1.last_name as "Actor Name"
from actor a1 join film_actor fa1 on a1.actor_id = fa1.actor_id
join film_actor fa2 on fa1.film_id = fa2.film_id
join actor a2 on fa2.actor_id = a2.actor_id where a2.actor_id in (select * from bacall_1)
and a1.actor_id not in (select * from bacall_1)
and not (a1.first_name = 'RUSSELL' and a1.last_name = 'BACALL')
group by "Actor Name" order by "Actor Name";
