-- 1. List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, district
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.address_id = city.city_id
where district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, amount
from payment
right join customer
on payment.customer_id = customer.customer_id 
where amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)
select customer.first_name, customer.last_name
from customer
where customer.customer_id in (
	select payment.customer_id
	from payment
	where amount > 175
);


-- 4. List all customers that live in Nepal (use the city table) ...question not well-defined. There is no one living in Nepal
-- in the city table
select customer.first_name, customer.last_name, city
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.address_id = city.city_id
where city = 'Nepal';


-- 5. Which staff member had the most transactions?
-- There is no "transactions" database.


-- 6. How many movies of each rating are there?
select movie_rating, count(*)
from movies m
group by movie_rating
order by movie_rating asc;



-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name, amount
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    from payment p 
    WHERE amount > 6.99
);



-- 8. How many free rentals did our store give away?
SELECT COUNT(*)
FROM rental
JOIN payment 
ON rental.rental_id = payment.rental_id
WHERE payment.amount = 0;

