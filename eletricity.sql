//AFSAN-55

mysql> create table consumer(id int(10),name varchar(25),address varchar(25),Last_Reading int(10),current_reading int(10),month varchar(10),Unit_price int(2));
Query OK, 0 rows affected (0.27 sec)

mysql> desc consumer;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| id              | int(10)     | YES  |     | NULL    |       |
| name            | varchar(25) | YES  |     | NULL    |       |
| address         | varchar(25) | YES  |     | NULL    |       |
| Last_Reading    | int(10)     | YES  |     | NULL    |       |
| current_reading | int(10)     | YES  |     | NULL    |       |
| month           | varchar(10) | YES  |     | NULL    |       |
| Unit_price      | int(2)      | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> insert into consumer values(121,'Gaurav','kochi',560,null,null,2),(700,'deepak',120,null,null,2),(512,'rahul','kochi',650,null,null,2);
ERROR 1136 (21S01): Column count doesn't match value count at row 2
mysql> insert into consumer values(121,'Gaurav','kochi',560,null,null,2),(700,'deepak','kochi',120,null,null,2),(512,'rahul','kochi',650,null,null,2);
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from consumer;
+------+--------+---------+--------------+-----------------+-------+------------+
| id   | name   | address | Last_Reading | current_reading | month | Unit_price |
+------+--------+---------+--------------+-----------------+-------+------------+
|  121 | Gaurav | kochi   |          560 |            NULL | NULL  |          2 |
|  700 | deepak | kochi   |          120 |            NULL | NULL  |          2 |
|  512 | rahul  | kochi   |          650 |            NULL | NULL  |          2 |
+------+--------+---------+--------------+-----------------+-------+------------+
3 rows in set (0.00 sec)








mysql> delimiter #
->drop procedure if exists electricity; 
->create procedure electricity(id int,currentreading float(10,2)) 
->begin declare b varchar(25); declare c float(10,2); 
->declare d float; 
->declare l date; 
->create temporary table temp(id int, pname varchar(20), lastdate date,consumedunit float(10,2),charge float(10,2)); 
->set l=DATE_ADD(CURDATE(),INTERVAL 10 DAY);  
->select name into b from consumer where id= consumer.id; 
->select Last_Reading into c from consumer where id= consumer.id; 
->select Unit_price into d from consumer where id=consumer.id; 
->insert into temp values (id,b,l,(currentreading-c),(currentreading-c)*d); 
->select * from temp; 
->update consumer set consumer.current_reading =currentreading,consumer.month=month(now())where consumer.id=id; 
->end#
->Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call electricity(121,600)#                                                                                                                                        +------+--------+------------+--------------+--------+
| id   | pname  | lastdate   | consumedunit | charge |
+------+--------+------------+--------------+--------+
|  121 | Gaurav | 2019-03-31 |        40.00 |  80.00 |
+------+--------+------------+--------------+--------+
1 row in set (0.00 sec)

Query OK, 1 row affected (0.07 sec)

