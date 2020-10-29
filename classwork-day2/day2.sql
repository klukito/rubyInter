show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.03 sec)

mysql> create database food_oms_db;
Query OK, 1 row affected (0.00 sec)

mysql> use food_oms_db;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> create table categories (id INT);
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+-----------------------+
| Tables_in_food_oms_db |
+-----------------------+
| categories            |
+-----------------------+
1 row in set (0.00 sec)

mysql> describe categories;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| id    | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
1 row in set (0.01 sec)

mysql> alter table categories add primary key(id);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table categories add name varchar(50);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe categories;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | NO   | PRI | NULL    |       |
| name  | varchar(50) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create table items ( 
    -> id int not null, 
    -> name varchar(50) default null,
    -> price int default 0,
    -> primary key (id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> describe items;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | NO   | PRI | NULL    |       |
| name  | varchar(50) | YES  |     | NULL    |       |
| price | int         | YES  |     | 0       |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> create table item_categories (
    -> item_id INT, 
    -> category_id INT
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> show tables;
+-----------------------+
| Tables_in_food_oms_db |
+-----------------------+
| categories            |
| item_categories       |
| items                 |
+-----------------------+
3 rows in set (0.00 sec)

mysql> show table categories;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'categories' at line 1
mysql> describe categories;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | NO   | PRI | NULL    |       |
| name  | varchar(50) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> describe item_categories;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| item_id     | int  | YES  |     | NULL    |       |
| category_id | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> describe items;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | NO   | PRI | NULL    |       |
| name  | varchar(50) | YES  |     | NULL    |       |
| price | int         | YES  |     | 0       |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into items (id, name, price);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> insert into items (id, name, price) values
    -> (1, 'Nasi Goreng', 25000),
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 3
mysql>  insert into items (id, name, price) values
    -> (1, 'Nasi Goreng', 25000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into items (id, name) values
    -> (2, 'Air Putih');
Query OK, 1 row affected (0.00 sec)

mysql> insert into items values (3, 'Spaghetti', 40000), (4, 'Green Tea Latte',
18000);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from items;
+----+-----------------+-------+
| id | name            | price |
+----+-----------------+-------+
|  1 | Nasi Goreng     | 25000 |
|  2 | Air Putih       |     0 |
|  3 | Spaghetti       | 40000 |
|  4 | Green Tea Latte | 18000 |
+----+-----------------+-------+
4 rows in set (0.00 sec)

mysql> alter table items modify id int not null auto_increment;
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> alter table categories modify id int not null auto_increment;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe items;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(50) | YES  |     | NULL    |                |
| price | int         | YES  |     | 0       |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> insert into items values (null, 'Orange Juice' 15000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '15000)' at line 1
mysql> insert into items values (null, 'Orange Juice', 15000);
Query OK, 1 row affected (0.00 sec)

mysql> insert into items(name, price) values
    -> ('Vannila Ice Cream', 13000);
Query OK, 1 row affected (0.00 sec)

mysql> describe items;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(50) | YES  |     | NULL    |                |
| price | int         | YES  |     | 0       |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Nasi Goreng       | 25000 |
|  2 | Air Putih         |     0 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vannila Ice Cream | 13000 |
+----+-------------------+-------+
6 rows in set (0.00 sec)

mysql> insert into items(name, price) values ('Cordon Bleu', 36000), ('Cordon Bleu', 36000), ('French Fries', 20000), ('Mango Juice', 15000);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Nasi Goreng       | 25000 |
|  2 | Air Putih         |     0 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vannila Ice Cream | 13000 |
|  7 | Cordon Bleu       | 36000 |
|  8 | Cordon Bleu       | 36000 |
|  9 | French Fries      | 20000 |
| 10 | Mango Juice       | 15000 |
+----+-------------------+-------+
10 rows in set (0.00 sec)

mysql> select * from items where price < 20000;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  2 | Air Putih         |     0 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vannila Ice Cream | 13000 |
| 10 | Mango Juice       | 15000 |
+----+-------------------+-------+
5 rows in set (0.01 sec)

mysql> select * from items where price >= 15000 and price <= 25000;
+----+-----------------+-------+
| id | name            | price |
+----+-----------------+-------+
|  1 | Nasi Goreng     | 25000 |
|  4 | Green Tea Latte | 18000 |
|  5 | Orange Juice    | 15000 |
|  9 | French Fries    | 20000 |
| 10 | Mango Juice     | 15000 |
+----+-----------------+-------+
5 rows in set (0.00 sec)

mysql> select * from items where price between 15000 and 25000;
+----+-----------------+-------+
| id | name            | price |
+----+-----------------+-------+
|  1 | Nasi Goreng     | 25000 |
|  4 | Green Tea Latte | 18000 |
|  5 | Orange Juice    | 15000 |
|  9 | French Fries    | 20000 |
| 10 | Mango Juice     | 15000 |
+----+-----------------+-------+
5 rows in set (0.00 sec)

mysql> select * from items where name = 'French Fries';
+----+--------------+-------+
| id | name         | price |
+----+--------------+-------+
|  9 | French Fries | 20000 |
+----+--------------+-------+
1 row in set (0.00 sec)

mysql> select * from items where name like "%Juice%";
+----+--------------+-------+
| id | name         | price |
+----+--------------+-------+
|  5 | Orange Juice | 15000 |
| 10 | Mango Juice  | 15000 |
+----+--------------+-------+
2 rows in set (0.01 sec)

mysql> update items set name = 'Nasi Goreng Gila' where id = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Nasi Goreng Gila  | 25000 |
|  2 | Air Putih         |     0 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vannila Ice Cream | 13000 |
|  7 | Cordon Bleu       | 36000 |
|  8 | Cordon Bleu       | 36000 |
|  9 | French Fries      | 20000 |
| 10 | Mango Juice       | 15000 |
+----+-------------------+-------+
10 rows in set (0.00 sec)

mysql> update items set name = 'Vanilla Ice Cream' where id = 6;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update items set name = 'Ice Water', price = 2000 where id = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> describe items;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(50) | YES  |     | NULL    |                |
| price | int         | YES  |     | 0       |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Ice Water         |  2000 |
|  2 | Air Putih         |     0 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vanilla Ice Cream | 13000 |
|  7 | Cordon Bleu       | 36000 |
|  8 | Cordon Bleu       | 36000 |
|  9 | French Fries      | 20000 |
| 10 | Mango Juice       | 15000 |
+----+-------------------+-------+
10 rows in set (0.00 sec)

mysql> delete from items where name="Mango Juice";
Query OK, 1 row affected (0.01 sec)

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Ice Water         |  2000 |
|  2 | Air Putih         |     0 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vanilla Ice Cream | 13000 |
|  7 | Cordon Bleu       | 36000 |
|  8 | Cordon Bleu       | 36000 |
|  9 | French Fries      | 20000 |
+----+-------------------+-------+
9 rows in set (0.00 sec)

mysql> delete from items where name="Cordon Bleu" id=8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'id=8' at line 1
mysql> delete from items where name="Cordon Bleu" where id=8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where id=8' at line 1
mysql> delete from items where name="Cordon Bleu", id=8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', id=8' at line 1
mysql> delete from items where id=8;
Query OK, 1 row affected (0.00 sec)

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Ice Water         |  2000 |
|  2 | Air Putih         |     0 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vanilla Ice Cream | 13000 |
|  7 | Cordon Bleu       | 36000 |
|  9 | French Fries      | 20000 |
+----+-------------------+-------+
8 rows in set (0.00 sec)

mysql> delete from items where id=9;
Query OK, 1 row affected (0.01 sec)

mysql> insert into items(name, price) values ('French Fries', 20000);
Query OK, 1 row affected (0.00 sec)

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Ice Water         |  2000 |
|  2 | Air Putih         |     0 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vanilla Ice Cream | 13000 |
|  7 | Cordon Bleu       | 36000 |
| 11 | French Fries      | 20000 |
+----+-------------------+-------+
8 rows in set (0.00 sec)

mysql> update items set name = 'French Fries', price = 20000 where id = 9;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Ice Water         |  2000 |
|  2 | Air Putih         |     0 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vanilla Ice Cream | 13000 |
|  7 | Cordon Bleu       | 36000 |
| 11 | French Fries      | 20000 |
+----+-------------------+-------+
8 rows in set (0.00 sec)

mysql> iysql> insert into categories (name) values ('main dish'), ('beverage'), ('dessert');
ERROR 1146 (42S02): Table 'food_oms_db.categoriategories' doesn't exist
mysql> show tables;
+-----------------------+
| Tables_in_food_oms_db |
+-----------------------+
| categories            |
| item_categories       |
| items                 |
+-----------------------+
3 rows in set (0.00 sec)

mysql> insert into categories (name) values ('main dish'), ('beverage'), ('dessert');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> update items set name = 'Nasi Goreng Gila', price = 25000 where id = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update items set name = 'Ice Water', price = 2000 where id = 2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update items set name = 'French Fries', price = 20000 where id = 8;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Nasi Goreng Gila  | 25000 |
|  2 | Ice Water         |  2000 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vanilla Ice Cream | 13000 |
|  7 | Cordon Bleu       | 36000 |
| 11 | French Fries      | 20000 |
+----+-------------------+-------+
8 rows in set (0.00 sec)

mysql> insert into item categories (item_id, category_id) values (1, 1), (2,2), (3,1), (4,2), (5,2), (6,3), (7,1);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'categories (item_id, category_id) values (1, 1), (2,2), (3,1), (4,2), (5,2), (6,' at line 1
mysql> insert into item_categories (item_id, category_id) values (1, 1), (2, 2),
 (3, 1), (4, 2), (5, 2), (6, 3), (7, 1);
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> insert into items values (8, 'French Fries', 20000);
Query OK, 1 row affected (0.00 sec)

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Nasi Goreng Gila  | 25000 |
|  2 | Ice Water         |  2000 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vanilla Ice Cream | 13000 |
|  7 | Cordon Bleu       | 36000 |
|  8 | French Fries      | 20000 |
| 11 | French Fries      | 20000 |
+----+-------------------+-------+
9 rows in set (0.00 sec)

mysql> delete from items where id=11;
Query OK, 1 row affected (0.01 sec)

mysql> select * from items;
+----+-------------------+-------+
| id | name              | price |
+----+-------------------+-------+
|  1 | Nasi Goreng Gila  | 25000 |
|  2 | Ice Water         |  2000 |
|  3 | Spaghetti         | 40000 |
|  4 | Green Tea Latte   | 18000 |
|  5 | Orange Juice      | 15000 |
|  6 | Vanilla Ice Cream | 13000 |
|  7 | Cordon Bleu       | 36000 |
|  8 | French Fries      | 20000 |
+----+-------------------+-------+
8 rows in set (0.00 sec)

mysql> show table item_categories;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'item_categories' at line 1
mysql> show tables;
+-----------------------+
| Tables_in_food_oms_db |
+-----------------------+
| categories            |
| item_categories       |
| items                 |
+-----------------------+
3 rows in set (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| food_oms_db        |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> show table item_categories;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'item_categories' at line 1
mysql> show table items;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'items' at line 1
mysql> show items;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'items' at line 1
mysql> describe item_categories;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| item_id     | int  | YES  |     | NULL    |       |
| category_id | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> describe items;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(50) | YES  |     | NULL    |                |
| price | int         | YES  |     | 0       |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> select items.id, items.name, items_categories.category_id from items left join item_categories on items.id = item_categories.item_id;
ERROR 1054 (42S22): Unknown column 'items_categories.category_id' in 'field list'
mysql> select items.id, items.name, item_categories.category_id from items left
join item_categories on items.id = item_categories.item_id;
+----+-------------------+-------------+
| id | name              | category_id |
+----+-------------------+-------------+
|  1 | Nasi Goreng Gila  |           1 |
|  2 | Ice Water         |           2 |
|  3 | Spaghetti         |           1 |
|  4 | Green Tea Latte   |           2 |
|  5 | Orange Juice      |           2 |
|  6 | Vanilla Ice Cream |           3 |
|  7 | Cordon Bleu       |           1 |
|  8 | French Fries      |        NULL |
+----+-------------------+-------------+
8 rows in set (0.00 sec)

mysql> select items.id, items.name, item_categories.category_id from items join
item_categories on items.id = item_categories.item_id;
+----+-------------------+-------------+
| id | name              | category_id |
+----+-------------------+-------------+
|  1 | Nasi Goreng Gila  |           1 |
|  2 | Ice Water         |           2 |
|  3 | Spaghetti         |           1 |
|  4 | Green Tea Latte   |           2 |
|  5 | Orange Juice      |           2 |
|  6 | Vanilla Ice Cream |           3 |
|  7 | Cordon Bleu       |           1 |
+----+-------------------+-------------+
7 rows in set (0.00 sec)

mysql> select items.id, items.name, item_categories.category_id from items right join item_categories on items.id = item_categories.item_id;
+------+-------------------+-------------+
| id   | name              | category_id |
+------+-------------------+-------------+
|    1 | Nasi Goreng Gila  |           1 |
|    2 | Ice Water         |           2 |
|    3 | Spaghetti         |           1 |
|    4 | Green Tea Latte   |           2 |
|    5 | Orange Juice      |           2 |
|    6 | Vanilla Ice Cream |           3 |
|    7 | Cordon Bleu       |           1 |
+------+-------------------+-------------+
7 rows in set (0.00 sec)

mysql> describe item_categories;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| item_id     | int  | YES  |     | NULL    |       |
| category_id | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table item_categories modify item_id int not null;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table item_categories modify category_id int not null;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> add foreign key (item_id) references items(id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'add foreign key (item_id) references items(id)' at line 1
mysql> alter table item_categories add foreign key (item_id) references items(id);
Query OK, 7 rows affected (0.03 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> alter table item_categories add foreign key (category_id) references categories(id);
Query OK, 7 rows affected (0.02 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> describe item_categories;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| item_id     | int  | NO   | MUL | NULL    |       |
| category_id | int  | NO   | MUL | NULL    |       |
+-------------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)