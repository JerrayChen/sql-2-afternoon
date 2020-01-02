-- 1.
select c.count, g.name genre_name from 
(select count(*), genre_id from track
group by genre_id) c
inner join genre g
on g.genre_id = c.genre_id

-- 2.
select c.count, g.name genre_name from 
(select count(*), genre_id from track
group by genre_id) c
inner join genre g
on g.genre_id = c.genre_id
where g.name in ('Pop','Rock')

-- 3.
select ar.name, al.count from artist ar
inner join 
(select count(*), artist_id from album
group by artist_id) al
on ar.artist_id = al.artist_id