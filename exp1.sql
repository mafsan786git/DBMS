$ mysql -u root -p
Enter password: 

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| DEPARTMENT         |
| EMPLOYEE           |
| arenafc            |
| employee           |
| mysql              |
| performance_schema |
| school             |
| student            |
| studentdetails     |
| sys                |
| university         |
+--------------------+
12 rows in set (0.07 sec)

mysql> use student;
Database changed

mysql> create table student(sroll int(10), sname varchar(20),sage int(5),sbranch varchar(10));
Query OK, 0 rows affected (0.38 sec)

mysql> show tables;
+-------------------+
| Tables_in_student |
+-------------------+
| student           |
+-------------------+
1 row in set (0.00 sec)

mysql> describe student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| sroll   | int(10)     | YES  |     | NULL    |       |
| sname   | varchar(20) | YES  |     | NULL    |       |
| sage    | int(5)      | YES  |     | NULL    |       |
| sbranch | varchar(10) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)


mysql> insert into student values(55,'afsan',20,'cs');
Query OK, 1 row affected (0.04 sec)

mysql> insert into student values(56,'aslam',20,'cs'),(57,'anant',21,'it'),(52,'abhi',19,'it');
Query OK, 3 rows affected (0.04 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM student;
+-------+-------+------+---------+
| sroll | sname | sage | sbranch |
+-------+-------+------+---------+
|    55 | afsan |   20 | cs      |
|    56 | aslam |   20 | cs      |
|    57 | anant |   21 | it      |
|    52 | abhi  |   19 | it      |
+-------+-------+------+---------+
4 rows in set (0.00 sec)

mysql> ALTER TABLE student ADD(total varchar(10));
Query OK, 0 rows affected (0.66 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM student;
+-------+-------+------+---------+-------+
| sroll | sname | sage | sbranch | total |
+-------+-------+------+---------+-------+
|    55 | afsan |   20 | cs      | NULL  |
|    56 | aslam |   20 | cs      | NULL  |
|    57 | anant |   21 | it      | NULL  |
|    52 | abhi  |   19 | it      | NULL  |
+-------+-------+------+---------+-------+
4 rows in set (0.00 sec)

mysql> UPDATE student SET total=90 where sroll=55;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM student;
+-------+-------+------+---------+-------+
| sroll | sname | sage | sbranch | total |
+-------+-------+------+---------+-------+
|    55 | afsan |   20 | cs      | 90    |
|    56 | aslam |   20 | cs      | NULL  |
|    57 | anant |   21 | it      | NULL  |
|    52 | abhi  |   19 | it      | NULL  |
+-------+-------+------+---------+-------+
4 rows in set (0.00 sec)

mysql> UPDATE student SET total=80 where sroll=56;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM student;
+-------+-------+------+---------+-------+
| sroll | sname | sage | sbranch | total |
+-------+-------+------+---------+-------+
|    55 | afsan |   20 | cs      | 90    |
|    56 | aslam |   20 | cs      | 80    |
|    57 | anant |   21 | it      | NULL  |
|    52 | abhi  |   19 | it      | NULL  |
+-------+-------+------+---------+-------+
4 rows in set (0.00 sec)

mysql> UPDATE student SET total=85 where sroll=57;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM student;
+-------+-------+------+---------+-------+
| sroll | sname | sage | sbranch | total |
+-------+-------+------+---------+-------+
|    55 | afsan |   20 | cs      | 90    |
|    56 | aslam |   20 | cs      | 80    |
|    57 | anant |   21 | it      | 85    |
|    52 | abhi  |   19 | it      | NULL  |
+-------+-------+------+---------+-------+
4 rows in set (0.00 sec)

mysql> UPDATE student SET total=70 where sroll=52;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM student;
+-------+-------+------+---------+-------+
| sroll | sname | sage | sbranch | total |
+-------+-------+------+---------+-------+
|    55 | afsan |   20 | cs      | 90    |
|    56 | aslam |   20 | cs      | 80    |
|    57 | anant |   21 | it      | 85    |
|    52 | abhi  |   19 | it      | 70    |
+-------+-------+------+---------+-------+
4 rows in set (0.00 sec)

mysql> ALTER TABLE student change sroll student_roll int(10);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM student;
+--------------+-------+------+---------+-------+
| student_roll | sname | sage | sbranch | total |
+--------------+-------+------+---------+-------+
|           55 | afsan |   20 | cs      | 90    |
|           56 | aslam |   20 | cs      | 80    |
|           57 | anant |   21 | it      | 85    |
|           52 | abhi  |   19 | it      | 70    |
+--------------+-------+------+---------+-------+
4 rows in set (0.01 sec)

mysql> ALTER TABLE student change sname student_name varchar(20);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM student;
+--------------+--------------+------+---------+-------+
| student_roll | student_name | sage | sbranch | total |
+--------------+--------------+------+---------+-------+
|           55 | afsan        |   20 | cs      | 90    |
|           56 | aslam        |   20 | cs      | 80    |
|           57 | anant        |   21 | it      | 85    |
|           52 | abhi         |   19 | it      | 70    |
+--------------+--------------+------+---------+-------+
4 rows in set (0.01 sec)

mysql> SELECT * FROM student WHERE sbranch='cs';
+--------------+--------------+------+---------+-------+
| student_roll | student_name | sage | sbranch | total |
+--------------+--------------+------+---------+-------+
|           55 | afsan        |   20 | cs      | 90    |
|           56 | aslam        |   20 | cs      | 80    |
+--------------+--------------+------+---------+-------+
2 rows in set (0.00 sec)

mysql> SELECT MAX(total) FROM student;
+------------+
| MAX(total) |
+------------+
| 90         |
+------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(total) FROM student;
+------------+
| MIN(total) |
+------------+
| 70         |
+------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(total),MAX(total) FROM student;
+------------+------------+
| MIN(total) | MAX(total) |
+------------+------------+
| 70         | 90         |
+------------+------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(total) FROM student;
+------------+
| AVG(total) |
+------------+
|      81.25 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(total),MAX(total),AVG(total) FROM student;
+------------+------------+------------+
| MIN(total) | MAX(total) | AVG(total) |
+------------+------------+------------+
| 70         | 90         |      81.25 |
+------------+------------+------------+
1 row in set (0.00 sec)


