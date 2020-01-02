-- 1.
create table users (
	user_id serial primary key,
  name varchar(50),
  email varchar(75)
);

create table product (
	product_id serial primary key,
  name varchar(50),
  price numeric
);

create table orders (
	order_id integer not null,
  item_id integer not null,
  product_id integer references product(product_id),
  primary key(order_id, item_id)
);

-- 2.
insert into users (name, email)
values
('Rosa','rosa@pokemon.com.unova'),
('Serena','serena@pokemon.com.kalos'),
('Mallow', 'mallow@pokemon.com.alola');

insert into product (name, price)
values
('Ratata',10.99),
('Ekans',16),
('Turtwig', 32);

insert into orders (order_id, item_id, product_id)
values
(1,1,2),
(1,2,3),
(2,1,1),
(3,1,3),
(3,2,2),
(3,3,1);

-- 3.
select p.name product_name, p.price from orders o
inner join product p
on p.product_id = o.product_id
where o.order_id = 1;

select o.order_id, p.name product_name, p.price from orders o
inner join product p
on p.product_id = o.product_id;

select g.order_id, sum(g.price) from (
select o.order_id, p.price from orders o
inner join product p
on p.product_id = o.product_id
) g group by g.order_id;

-- 4.
ALTER TABLE orders
ADD user_id integer REFERENCES users(user_id); 

-- 5.
update orders
set user_id = 3
where order_id = 1;

update orders
set user_id = 2
where order_id = 2;

update orders
set user_id = 1
where order_id = 3;

-- 6.
select u.name, o.item_id, p.name, p.price from orders o
inner join users u
on u.user_id = o.user_id
inner join product p
on p.product_id = o.product_id
where u.name = 'Rosa';

select u.name, count(o.order_id)
from (select distinct orders.user_id, orders.order_id from orders) o
inner join users u
on u.user_id = o.user_id
group by u.name;

-- BD.
select u.name, o.order_id ,sum(p.price) from orders o
inner join users u
on u.user_id = o.user_id
inner join product p
on p.product_id = o.product_id
group by u.name, o.order_id;