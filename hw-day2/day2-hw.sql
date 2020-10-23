#2

create table items (
    item_id int not null auto_increment, 
    name varchar(60) default null,
    price int default null,
    primary key (item_id)
);

create table customers (
    customer_id int not null auto_increment, 
    name varchar(60) default null,
    phone_number varchar(20),
    primary key (customer_id)
);

create table orders (
    order_id int not null auto_increment, 
    order_date date,
    customer_id int not null, 
    primary key (order_id),
    foreign key (customer_id) references customers(customer_id)
);

create table order_details (
    orderDetails_id int not null auto_increment, 
    order_id int not null,
    item_id int not null,  
    quantity int,
    primary key (orderDetails_id),
    foreign key (order_id) references orders(order_id),
    foreign key (item_id) references items(item_id)
);

#3

insert into items (name, price) values
('Nasi Goreng Gila', 25000),
('Ice Water', 2000),
('Spaghetti', 40000),
('Green Tea Latte', 18000),
('Orange Juice', 15000),
('Cordon Bleu', 36000);

insert into customers (name, phone_number) values
('Budiawan', '012345678'),
('Mary Jones', '087654321'),
('Ben', '089753124'),
('Jane', '013243546'),
('James', '081643781');

insert into orders (customer_id, order_date) values
(1, '2020-10-22'),
(2, '2020-10-22'),
(3, '2020-10-22'),
(4, '2020-10-23'),
(5, '2020-10-23');

insert into order_details (order_id, item_id, quantity) values
(1, 1, 1), #add nasi goreng gila
(1, 2, 1), #add ice water

(2, 3, 1), #add spaghetti
(2, 4, 1), #add green tea latte

(3, 3, 1), #add spaghetti
(3, 5, 1), #add orange juice

(4, 1, 1), #add nasi goreng gila
(4, 2, 1), #add ice water

(5, 6, 1), #add cordon bleu
(5, 4, 1); #add green tea latte

#4

select o.order_id as 'Order ID', 
	o.order_date as 'Order Date',
	c.name as 'Customer Name',
	c.phone_number as 'Customer Phone Number',
	sum(i.price) as 'Total Price',
	group_concat(i.name separator ', ') as 'Items Bought'
from orders o
inner join customers c on o.customer_id = c.customer_id
inner join order_details od on o.order_id = od.order_id
inner join items i on i.item_id = od.item_id
group by o.order_id;