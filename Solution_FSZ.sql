

-- List the number of films per category.
select category_id, count(film_id) from film_category group by category_id order by count(film_id) desc;
select count(*) from film;
select count(*) from film_category;

-- Retrieve the store ID, city, and country for each store.

select store_id,city,country from store left 
join address using (address_id)
join city using (city_id)
join country using (country_id);

-- Calculate the total revenue generated by each store in dollars. Identify the film categories with the longest average running time.
select store_id, sum(amount) as 'total revenue' from customer left join payment using (customer_id) group by store_id;

-- Determine the average running time of films for each category.
select category_id, avg(length) as 'running time' from film left join film_category using (film_id) group by category_id order by avg(length) desc;

-- Display the top 10 most frequently rented movies in descending order.
select title, count(rental_id) as '# of time rented' from rental
left join inventory using (inventory_id)
left join film using (film_id) group by title order by count(rental_id) desc limit 10;

-- Determine if "Academy Dinosaur" can be rented from Store 1.
select store_id, sum(if(title='ACADEMY DINOSAUR', 1, 0)) as '# of copy' from inventory left join film using (film_id) group by store_id;

/*Bonus:
Provide a list of all distinct film titles, along with their availability status in the inventory. 
Include a column indicating whether each title is 'Available' or 'NOT available.
' Note that there are 42 titles that are not in the inventory, and this information can be obtained using a CASE statement combined with IFNULL."*/