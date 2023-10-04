/*1.Write a SQL query to count the number of characters except for the spaces for each actor.
 Return the first 10 actors' name lengths along with their names.*/

select concat(first_name,' ',last_name) as full_name,
length(concat(first_name,last_name)) as name_length
from actor 
limit 10;

/*2.List all Oscar awardees(Actors who received the Oscar award) with their full names and 
the length of their names.*/

select concat(first_name,' ',last_name) as full_name,
length(concat(first_name,' ',last_name)) as name_length,awards 
from actor_award 
where awards like '%oscar%';

/*3.Find the actors who have acted in the film ‘Frost Head.’*/

select first_name,last_name,title from actor a 
join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
where title = 'Frost Head';

/*4.Pull all the films acted by the actor ‘Will Wilson.’*/

select title,concat(first_name,' ',last_name) as full_name from film f 
join film_actor fa on f.film_id=fa.film_id 
join actor a on a.actor_id=fa.actor_id
where a.actor_id=168;

/*5.Pull all the films which were rented and return them in the month of May.*/
select title,monthname(rental_date) as rental_month,
monthname(return_date) as return_month from film f 
left join inventory i on f.film_id=i.film_id
join rental r on r.inventory_id=i.inventory_id
where month(rental_date)=5 and month(return_date)=5;

/*6.Pull all the films with ‘Comedy’ category.*/
select title,name from film f 
left join film_category fc on f.film_id=fc.film_id
join category c on c.category_id=fc.category_id
where name='Comedy';
