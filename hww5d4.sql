--q1
create or replace procedure insert_new_film (
	title varchar,
	description varchar,
	release_year integer,
	language_id integer,
	rental_duration integer,
	rental_rate numeric(4,2),
	length integer,
	replace_cost numeric(5,2),
	rating mpaa_rating
)
language plpgsql
as $$
begin 
	insert into film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	values(title, description, release_year, language_id, rental_duration, rental_rate, length, replace_cost, rating);
end;
$$;

call insert_new_film('One Piece', 'Best anime out', 2024, 1, 5, 4.99, 120, 9.99, 'PG-13' );

select *
from film
order by film_id desc;


--q2
create or replace function get_category_count(cate_id integer)
returns integer
language plpgsql
as $$
	declare cat_count integer;
begin
	select count(*) into cat_count
	from film_category
	where category_id = cate_id;
	return cat_count;
end;
$$;
end
