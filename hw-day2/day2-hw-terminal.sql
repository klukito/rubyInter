mysql> create database day2hw;
Query OK, 1 row affected (0.01 sec)

mysql> use day2hw;
Database changed
mysql> create table items (
    ->     item_id int not null auto_increment, 
    ->     name varchar(60) default null,
    ->     price int default null,
    ->     primary key (item_id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> create table customers (
    ->     customer_id int not null auto_increment, 
    ->     name varchar(60) default null,
    ->     phone_number varchar(20),
    ->     primary key (customer_id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> create table orders (
    ->     order_id int not null auto_increment, 
    ->     order_date date,
    ->     customer_id int not null, 
    ->     primary key (order_id),
    ->     foreign key (customer_id) references customers(customer_id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> create table order_details (
    ->     orderDetails_id int not null auto_increment, 
    ->     order_id int not null,
    ->     item_id int not null,  
    ->     quantity int,
    ->     primary key (orderDetails_id)
    ->     foreign key (order_id) references orders(order_id),
    ->     foreign key (item_id) references items(item_id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'foreign key (order_id) references orders(order_id),
    foreign key (item_id) re' at line 7
mysql> create table order_details (
    ->     orderDetails_id int not null auto_increment, 
    ->     order_id int not null,
    ->     item_id int not null,  
    ->     quantity int,
    ->     primary key (orderDetails_id),
    ->     foreign key (order_id) references orders(order_id),
    ->     foreign key (item_id) references items(item_id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> insert into items (name, price) values
    -> ('Nasi Goreng Gila', 25000),
    -> ('Ice Water', 2000),
    -> ('Spaghetti', 40000),
    -> ('Green Tea Latte', 18000),
    -> ('Orange Juice', 15000),
    -> ('Cordon Bleu', 36000);
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> 
mysql> insert into customers (name, phone_number) values
    -> ('Budiawan', '012345678'),
    -> ('Mary Jones', '087654321'),
    -> ('Ben', '089753124'),
    -> ('Jane', '013243546'),
    -> ('James', '081643781');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> insert into orders (customer_id, order_date) values
    -> (1, '2020-10-22'),
    -> (2, '2020-10-22'),
    -> (3, '2020-10-22'),
    -> (4, '2020-10-23'),
    -> (5, '2020-10-23');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into order_details (order_id, item_id, quantity) values
    -> (1, 1, 1), #add nasi goreng gila
    -> (1, 2, 1), #add ice water
    -> 
    -> (2, 3, 1), #add spaghetti
    -> (2, 4, 1), #add green tea latte
    -> 
    -> (3, 3, 1), #add spaghetti
    -> (3, 5, 1), #add orange juice
    -> 
    -> (4, 1, 1), #add nasi goreng gila
    -> (4, 2, 1), #add ice water
    -> 
    -> (5, 6, 1), #add cordon bleu
    -> (5, 4, 1); #add green tea latte
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select o.order_id as 'Order ID', 
    -> o.order_date as 'Order Date',
    -> c.name as 'Customer Name',
    -> c.phone_number as 'Customer Phone Number',
    -> sum(i.price) as 'Total Price',
    -> group_concat(i.name separator ', ') as 'Items Bought'
    -> from orders o
    -> inner join customers c on o.customer_id = c.customer_id
    -> inner join order_details od on o.order_id = od.order_id
    -> inner join items i on i.item_id = od.item_id
    -> group by o.order_id;
+----------+------------+---------------+-----------------------+-------------+------------------------------+
| Order ID | Order Date | Customer Name | Customer Phone Number | Total Price | Items Bought                 |
+----------+------------+---------------+-----------------------+-------------+------------------------------+
|        1 | 2020-10-22 | Budiawan      | 012345678             |       27000 | Nasi Goreng Gila, Ice Water  |
|        2 | 2020-10-22 | Mary Jones    | 087654321             |       58000 | Spaghetti, Green Tea Latte   |
|        3 | 2020-10-22 | Ben           | 089753124             |       55000 | Spaghetti, Orange Juice      |
|        4 | 2020-10-23 | Jane          | 013243546             |       27000 | Nasi Goreng Gila, Ice Water  |
|        5 | 2020-10-23 | James         | 081643781             |       54000 | Cordon Bleu, Green Tea Latte |
+----------+------------+---------------+-----------------------+-------------+------------------------------+
5 rows in set (0.01 sec)

