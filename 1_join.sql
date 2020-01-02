-- 1.
select i.* from invoice i
inner join invoice_line il
on i.invoice_id = il.invoice_id
where il.unit_price > 0.99

-- 2.
select i.invoice_date, c.first_name, c.last_name, i.total
from invoice i
inner join customer c
on c.customer_id = i.customer_id

-- 3.
select c.first_name, c.last_name, 
	e.first_name support_rep_first_name, 
	e.last_name support_rep_last_name
from customer c
inner join employee e
on c.support_rep_id = e.employee_id

-- 4.
select al.title, ar.name 
from album al
inner join artist ar
on al.artist_id = ar.artist_id

-- 5.
select pt.track_id
from playlist_track pt
inner join playlist p
on pt.playlist_id = p.playlist_id
where p.name = 'Music'

-- 6.
select t.name
from track t
inner join playlist_track pt
on t.track_id = pt.track_id
where pt.playlist_id = 5

-- 7.
select p.name playlist_name, t.name track_name
from playlist_track pt
inner join playlist p
on p.playlist_id = pt.playlist_id
inner join track t
on t.track_id = pt.track_id

-- 8.
select t.name, a.title 
from track t
inner join album a
on a.album_id = t.album_id
inner join genre g
on t.genre_id = g.genre_id
where g.name = 'Alternative & Punk';

-- BD.
select t.name track_name, g.name genre_name, al.title album_name, ar.name artist_name
from track t
inner join playlist_track pt
on pt.track_id = t.track_id
inner join playlist p
on pt.playlist_id = p.playlist_id
inner join genre g
on g.genre_id = t.genre_id
inner join album al
on al.album_id = t.album_id
inner join artist ar
on ar.artist_id = al.artist_id
where p.name = 'Music';