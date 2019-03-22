mysql> use electricity
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

mysql> create table consumer (id int(6),name varchar(10),address varchar(20),lread int(7),cread int(7),month int(2),year int(5),charge int(2));
Query OK, 0 rows affected (0.44 sec)

mysql> describe consumer;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| id      | int(6)      | YES  |     | NULL    |       |
| name    | varchar(10) | YES  |     | NULL    |       |
| address | varchar(20) | YES  |     | NULL    |       |
| lread   | int(7)      | YES  |     | NULL    |       |
| cread   | int(7)      | YES  |     | NULL    |       |
| month   | int(2)      | YES  |     | NULL    |       |
| year    | int(5)      | YES  |     | NULL    |       |
| charge  | int(2)      | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> INSERT INTO consumer(id,name,address,lread) VALUES (213252,'Sharma','BakerSt',240),(654422,'Varma','SorcerSt',350),(154263,'Karma','WinerSt',450);
Query OK, 3 rows affected (0.04 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM consumer;
+--------+--------+----------+-------+-------+-------+------+--------+
| id     | name   | address  | lread | cread | month | year | charge |
+--------+--------+----------+-------+-------+-------+------+--------+
| 213252 | Sharma | BakerSt  |   240 |  NULL |  NULL | NULL |   NULL |
| 654422 | Varma  | SorcerSt |   350 |  NULL |  NULL | NULL |   NULL |
| 154263 | Karma  | WinerSt  |   450 |  NULL |  NULL | NULL |   NULL |
+--------+--------+----------+-------+-------+-------+------+--------+
3 rows in set (0.00 sec)

mysql> DELIMITER #
mysql> DROP PROCEDURE IF EXISTS ELECT;
    -> CREATE PROCEDURE ELECT(cid INT,curread INT)
    -> BEGIN
    -> DECLARE done INT default 0;
    -> DECLARE charge INT;
    -> DECLARE lastdate date;
    -> DECLARE cunit INT;
    -> DECLARE cname VARCHAR(20);
    -> DECLARE lastread INT;
    -> DECLARE cur CURSOR FOR SELECT id,name,lread FROM consumer WHERE id = cid;
    -> DECLARE continue handler FOR NOT FOUND set done = 1;
    -> OPEN cur;
    -> readloop:loop
    -> fetch cur into cid,cname,lastread;
    -> if done = 1 then
    -> leave readloop;
    -> end if;
    -> set cunit = curread-lastread;
    -> set charge = cunit*2;
    -> set lastdate= date_add(curdate(),interval 10 day);
    -> select cid,cname,lastDATE,cunit,charge;
    -> update consumer set cread=curread where id = cid;
    -> update consumer set month = month(lastdate) where id = cid;
    -> update consumer set year = year(lastdate) where id = cid;
    -> end loop;
    -> close cur;
    -> end #
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call ELECT(213252,340)#
+--------+--------+------------+-------+--------+
| cid    | cname  | lastDATE   | cunit | charge |
+--------+--------+------------+-------+--------+
| 213252 | Sharma | 2019-03-31 |   100 |    200 |
+--------+--------+------------+-------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.14 sec)

mysql> call ELECT(654422,400)#
+--------+-------+------------+-------+--------+
| cid    | cname | lastDATE   | cunit | charge |
+--------+-------+------------+-------+--------+
| 654422 | Varma | 2019-03-31 |    50 |    100 |
+--------+-------+------------+-------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.13 sec)

mysql> call ELECT(154263,600)#
+--------+-------+------------+-------+--------+
| cid    | cname | lastDATE   | cunit | charge |
+--------+-------+------------+-------+--------+
| 154263 | Karma | 2019-03-31 |   150 |    300 |
+--------+-------+------------+-------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.14 sec)

mysql> select * from consumer#
+--------+--------+----------+-------+-------+-------+------+--------+
| id     | name   | address  | lread | cread | month | year | charge |
+--------+--------+----------+-------+-------+-------+------+--------+
| 213252 | Sharma | BakerSt  |   240 |   340 |     3 | 2019 |   NULL |
| 654422 | Varma  | SorcerSt |   350 |   400 |     3 | 2019 |   NULL |
| 154263 | Karma  | WinerSt  |   450 |   600 |     3 | 2019 |   NULL |
+--------+--------+----------+-------+-------+-------+------+--------+
3 rows in set (0.00 sec)


