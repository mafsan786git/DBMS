mysql> create database CITY_exp3;
Query OK, 1 row affected (0.00 sec)

mysql> use CITY_exp3
Database changed
mysql> create table kerala(NAMAE VARCHAR(20),LITERACY VARCHAR(20),POPULATION INT(10),AREA VARCHAR(20));
Query OK, 0 rows affected (0.29 sec)

mysql> describe kerala;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| NAMAE      | varchar(20) | YES  |     | NULL    |       |
| LITERACY   | varchar(20) | YES  |     | NULL    |       |
| POPULATION | int(10)     | YES  |     | NULL    |       |
| AREA       | varchar(20) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> CREATE TABLE tamilnadu(NAMAE VARCHAR(20),LITERACY VARCHAR(20),POPULATION INT(10),AREA VARCHAR(20));
Query OK, 0 rows affected (0.41 sec)

mysql> describe tamilnadu;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| NAMAE      | varchar(20) | YES  |     | NULL    |       |
| LITERACY   | varchar(20) | YES  |     | NULL    |       |
| POPULATION | int(10)     | YES  |     | NULL    |       |
| AREA       | varchar(20) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


mysql> INSERT INTO kerala VALUES('KOCHI',90,10000,5000);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO kerala VALUES('calicut',95,12000,6000);
Query OK, 1 row affected (0.06 sec)

mysql> INSERT INTO kerala VALUES('thrisur',90,15000,7000);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO kerala VALUES('kasargod',85,9000,2000);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO kerala VALUES('alapuzha',96,20000,3000);
Query OK, 1 row affected (0.05 sec)

mysql> SELECT * FROM kerala;
+----------+----------+------------+------+
| NAMAE    | LITERACY | POPULATION | AREA |
+----------+----------+------------+------+
| KOCHI    | 89       |      10000 | 5000 |
| calicut  | 95       |      12000 | 6000 |
| thrisur  | 90       |      15000 | 7000 |
| kasargod | 85       |       9000 | 2000 |
| alapuzha | 96       |      20000 | 3000 |
+----------+----------+------------+------+
5 rows in set (0.00 sec)


mysql> INSERT INTO tamilnadu VALUES('chennai',90,30000,9000);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO tamilnadu VALUES('selem',80,50000,10000);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO tamilnadu VALUES('pondicherry',87,80000,15000);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO tamilnadu VALUES('madhurai',97,85000,16000);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO tamilnadu VALUES('coimbator',89,95000,14000);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM tamilnadu;
+-------------+----------+------------+-------+
| NAMAE       | LITERACY | POPULATION | AREA  |
+-------------+----------+------------+-------+
| chennai     | 89       |      30000 | 9000  |
| selem       | 80       |      50000 | 10000 |
| pondicherry | 87       |      80000 | 15000 |
| madhurai    | 97       |      85000 | 16000 |
| coimbator   | 90       |      95000 | 14000 |
+-------------+----------+------------+-------+
5 rows in set (0.00 sec)


mysql> SELECT kerala.NAME AS KERALA_DISTRICT ,tamilnadu.NAME AS TAMIL_DISTRICT, tamilnadu.LITERACY FROM kerala,tamilnadu WHERE kerala.LITERACY=tamilnadu.LITERACY;
+-----------------+----------------+----------+
| KERALA_DISTRICT | TAMIL_DISTRICT | LITERACY |
+-----------------+----------------+----------+
| KOCHI           | chennai        | 89       |
| thrisur         | coimbator      | 90       |
+-----------------+----------------+----------+
2 rows in set (0.00 sec)


mysql> SELECT kerala.NAME AS DISTRICT FROM kerala UNION SELECT tamilnadu.NAME FROM tamilnadu;
+-------------+
| DISTRICT    |
+-------------+
| calicut     |
| thrisur     |
| kasargod    |
| alapuzha    |
| KOCHI       |
| chennai     |
| selem       |
| pondicherry |
| madhurai    |
| coimbator   |
+-------------+
10 rows in set (0.00 sec)


mysql> SELECT * FROM kerala WHERE kerala.LITERACY NOT IN(SELECT LITERACY FROM tamilnadu);
+----------+----------+------------+------+
| NAME     | LITERACY | POPULATION | AREA |
+----------+----------+------------+------+
| calicut  | 95       |      12000 | 6000 |
| kasargod | 85       |       9000 | 2000 |
| alapuzha | 96       |      20000 | 3000 |
+----------+----------+------------+------+
3 rows in set (0.00 sec)


mysql> SELECT * FROM tamilnadu WHERE tamilnadu.LITERACY NOT IN(SELECT LITERACY FROM kerala);
+-------------+----------+------------+-------+
| NAME        | LITERACY | POPULATION | AREA  |
+-------------+----------+------------+-------+
| selem       | 80       |      50000 | 10000 |
| pondicherry | 87       |      80000 | 15000 |
| madhurai    | 97       |      85000 | 16000 |
+-------------+----------+------------+-------+
3 rows in set (0.00 sec)


