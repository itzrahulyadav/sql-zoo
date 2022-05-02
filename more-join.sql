--1.
SELECT id, title
 FROM movie
 WHERE yr=1962

 --2
 select yr
from movie
where title = 'Citizen Kane';

--3
select id,title,yr
from movie
where title like 'Star Trek%'
order by yr;

--4
select id 
from actor
where name regexp 'Glenn Close';

--5
select id 
from movie
where title like 'Casablanca';

--6
select a.name
from actor a
join casting c
on c.actorid = a.id
where c.movieid = (select id from movie where title = 'Casablanca');

--7
select a.name 
from actor a
join casting c
on c.actorid = a.id
where c.movieid = (select id from movie where title = 'Alien');

--8
select m.title 
from movie m
join actor a
on m.id = a.id
join casting c
on c.movieid = a.id
where c.actorid = (select a.id from actor a where name = 'Harrison Ford');

--9
select m.title
from movie m
join actor a
on a.id = m.id
join casting c
on c.movieid = m.id
where c.actorid = (select id from actor where name = 'Harrison Ford') and c.ord != 1;

--10
select m.title,a.name
from casting c
join movie m 
on m.id = c.movieid
join actor a
on c.actorid = a.id
where m.yr = '1962' and ord = 1;

--11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--12
