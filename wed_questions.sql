--Week 5 - Wednesday Questions

--1. List all customers who live in Texas (use JOINs)
SELECT *
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, email,rental_id, amount, payment_date
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
where payment.amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)

SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

--4. List all customers that live in Nepal (use the city table)

SELECT *
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE city_id in (select city_id 
		from city
		where country_id in (select country_id 
					from country
					where country = 'Nepal'));
				


--5. Which staff member had the most transactions?
				
SELECT staff.staff_id, count(*)
FROM staff
full JOIN rental
ON staff.staff_id = rental.staff_id
group by staff.staff_id 
order by count(*) desc;


--6. How many movies of each rating are there?

select rating, count(film_id)
from film
group by rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select * from customer
where customer_id in (select customer_id  
						from payment
						where amount > 6.99);


