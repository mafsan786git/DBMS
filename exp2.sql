
$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 4
Server version: 5.7.25-0ubuntu0.16.04.2 (Ubuntu)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| COMPANY            |
| DEPARTMENT         |
| EMPLOYEE           |
| arenafc            |
| cycle              |
| employee           |
| mysql              |
| performance_schema |
| school             |
| student            |
| studentdetails     |
| sys                |
| university         |
+--------------------+
14 rows in set (0.00 sec)


mysql> use COMPANY;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

mysql> show tables;
+-------------------+
| Tables_in_COMPANY |
+-------------------+
| DEPARTMENT        |
| EMPLOYEE          |
+-------------------+
2 rows in set (0.00 sec)

mysql> describe EMPLOYEE;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| ENO     | int(10)     | NO   | PRI | NULL    |       |
| ENAME   | varchar(20) | NO   |     | NULL    |       |
| SALARY  | int(10)     | NO   |     | NULL    |       |
| DNO     | int(10)     | YES  | MUL | NULL    |       |
| MNGRNO  | int(10)     | YES  |     | NULL    |       |
| DOJ     | date        | YES  |     | NULL    |       |
| JOB     | varchar(20) | YES  |     | NULL    |       |
| ADDRESS | varchar(50) | YES  |     | NULL    |       |
| CITY    | varchar(20) | YES  |     | NULL    |       |
| PINCODE | int(6)      | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
10 rows in set (0.00 sec)



mysql> INSERT INTO DEPARTMENT VALUES(10,'cs','A'),(20,'it','B'),(30,'ec','C');
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> DELETE FROM DEPARTMENT WHERE DNO=1;
Query OK, 1 row affected (0.04 sec)

mysql> SELECT * FROM DEPARTMENT;
+-----+-------+------+
| DNO | DNAME | DHOD |
+-----+-------+------+
|  10 | cs    | A    |
|  20 | it    | B    |
|  30 | ec    | C    |
+-----+-------+------+
3 rows in set (0.00 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(1,'aslam',5000,10,'1988-01-01','lab_assi','aluva','kochi',683101);
Query OK, 1 row affected (0.05 sec)

mysql> SELECT * from EMPLOYEE;
+-----+-------+--------+------+--------+------------+----------+---------+-------+---------+
| ENO | ENAME | SALARY | DNO  | MNGRNO | DOJ        | JOB      | ADDRESS | CITY  | PINCODE |
+-----+-------+--------+------+--------+------------+----------+---------+-------+---------+
|   1 | aslam |   5000 |   10 |   NULL | 1988-01-01 | lab_assi | aluva   | kochi |  683101 |
+-----+-------+--------+------+--------+------------+----------+---------+-------+---------+
1 row in set (0.00 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(2,'mishal',6000,10,'1990-01-01','assi_p','kalamassery','kochi',682021);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(3,'afsan',10000,10,'1994-01-01','profsr','kalamassery','kochi',682021);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(4,'anant',110000,10,'1996-01-01','co-ordinate','panvale','mumbai',682022);
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(5,'abhisek',10000,20,'1999-01-01','professor','pnl','chennai',682023);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(6,'aditya',5000,20,'2000-01-01','library_asi','psl','chennai',682024);
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(7,'apurv',12000,20,'2002-01-01','xyz','eddaplly','mumbai',682025);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(8,'hemant',1200,30,'2004-01-01','xyzp','edda','kochi',682026);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(9,'amit',12000,30,'2006-01-01','x','mrk','kochi',682027);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(10,'ashwini',15000,30,'2008-01-01','y','dharavi','mumbai',682028);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * from EMPLOYEE;
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME   | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam   |   5000 |   10 |   NULL | 1988-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal  |   6000 |   10 |   NULL | 1990-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan   |  10000 |   10 |   NULL | 1994-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant   | 110000 |   10 |   NULL | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | abhisek |  10000 |   20 |   NULL | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | aditya  |   5000 |   20 |   NULL | 2000-01-01 | library_asi | psl         | chennai |  682024 |
|   7 | apurv   |  12000 |   20 |   NULL | 2002-01-01 | xyz         | eddaplly    | mumbai  |  682025 |
|   8 | hemant  |   1200 |   30 |   NULL | 2004-01-01 | xyzp        | edda        | kochi   |  682026 |
|   9 | amit    |  12000 |   30 |   NULL | 2006-01-01 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini |  15000 |   30 |   NULL | 2008-01-01 | y           | dharavi     | mumbai  |  682028 |
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
10 rows in set (0.00 sec)


mysql> UPDATE EMPLOYEE SET MNGRNO=10 WHERE ENO=1;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * from EMPLOYEE;
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME   | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam   |   5000 |   10 |     10 | 1988-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal  |   6000 |   10 |   NULL | 1990-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan   |  10000 |   10 |   NULL | 1994-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant   | 110000 |   10 |   NULL | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | abhisek |  10000 |   20 |   NULL | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | aditya  |   5000 |   20 |   NULL | 2000-01-01 | library_asi | psl         | chennai |  682024 |
|   7 | apurv   |  12000 |   20 |   NULL | 2002-01-01 | xyz         | eddaplly    | mumbai  |  682025 |
|   8 | hemant  |   1200 |   30 |   NULL | 2004-01-01 | xyzp        | edda        | kochi   |  682026 |
|   9 | amit    |  12000 |   30 |   NULL | 2006-01-01 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini |  15000 |   30 |   NULL | 2008-01-01 | y           | dharavi     | mumbai  |  682028 |
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
10 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET MNGRNO=9 WHERE ENO=2;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET MNGRNO=8 WHERE ENO=3;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET MNGRNO=7 WHERE ENO=4;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET MNGRNO=6 WHERE ENO=5;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET MNGRNO=5 WHERE ENO=6;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET MNGRNO=4 WHERE ENO=7;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET MNGRNO=3 WHERE ENO=8;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET MNGRNO=2 WHERE ENO=9;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET MNGRNO=1 WHERE ENO=10;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * from EMPLOYEE;
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME   | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam   |   5000 |   10 |     10 | 1988-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal  |   6000 |   10 |      9 | 1990-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan   |  10000 |   10 |      8 | 1994-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant   | 110000 |   10 |      7 | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | abhisek |  10000 |   20 |      6 | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | aditya  |   5000 |   20 |      5 | 2000-01-01 | library_asi | psl         | chennai |  682024 |
|   7 | apurv   |  12000 |   20 |      4 | 2002-01-01 | xyz         | eddaplly    | mumbai  |  682025 |
|   8 | hemant  |   1200 |   30 |      3 | 2004-01-01 | xyzp        | edda        | kochi   |  682026 |
|   9 | amit    |  12000 |   30 |      2 | 2006-01-01 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini |  15000 |   30 |      1 | 2008-01-01 | y           | dharavi     | mumbai  |  682028 |
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
10 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET DOJ='1998-01-01' WHERE ENO=1;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET DOJ='1999-01-01' WHERE ENO=2;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET DOJ='2001-01-01' WHERE ENO=3;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * from EMPLOYEE;
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME   | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam   |   5000 |   10 |     10 | 1998-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal  |   6000 |   10 |      9 | 1999-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan   |  10000 |   10 |      8 | 2001-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant   | 110000 |   10 |      7 | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | abhisek |  10000 |   20 |      6 | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | aditya  |   5000 |   20 |      5 | 2000-01-01 | library_asi | psl         | chennai |  682024 |
|   7 | apurv   |  12000 |   20 |      4 | 2002-01-01 | xyz         | eddaplly    | mumbai  |  682025 |
|   8 | hemant  |   1200 |   30 |      3 | 2004-01-01 | xyzp        | edda        | kochi   |  682026 |
|   9 | amit    |  12000 |   30 |      2 | 2006-01-01 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini |  15000 |   30 |      1 | 2008-01-01 | y           | dharavi     | mumbai  |  682028 |
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
10 rows in set (0.00 sec)


mysql> SELECT ENAME AS NAME FROM EMPLOYEE WHERE DOJ >'1998-01-01' AND DNO=
    -> 10;
+--------+
| NAME   |
+--------+
| mishal |
| afsan  |
+--------+
2 rows in set (0.00 sec)


mysql> SELECT ENAME AS NAME FROM EMPLOYEE WHERE NOT DNO=30;
+---------+
| NAME    |
+---------+
| aslam   |
| mishal  |
| afsan   |
| anant   |
| abhisek |
| aditya  |
| apurv   |
+---------+
7 rows in set (0.00 sec)


mysql> UPDATE DEPARTMENT SET DNAME='sales' WHERE DNAME='it';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * from DEPARTMENT;
+-----+-------+------+
| DNO | DNAME | DHOD |
+-----+-------+------+
|  10 | cs    | A    |
|  20 | sales | B    |
|  30 | ec    | C    |
+-----+-------+------+
3 rows in set (0.00 sec)


mysql> SELECT ENAME AS NAME FROM EMPLOYEE WHERE DNO IN(SELECT DNO FROM DEPARTMENT WHERE DNAME='sales');
+---------+
| NAME    |
+---------+
| abhisek |
| aditya  |
| apurv   |
+---------+
3 rows in set (0.00 sec)


mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(11,'asdf',15000,30,'2012-01-01','y','dharavi','mumbai',682028);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO EMPLOYEE (ENO,ENAME,SALARY,DNO,DOJ,JOB,ADDRESS,CITY,PINCODE) VALUES(12,'sdf',15000,20,'2019-01-01','y','dharavi','mumbai',682028);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM EMPLOYEE;
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME   | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam   |   5000 |   10 |     10 | 1998-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal  |   6000 |   10 |      9 | 1999-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan   |  10000 |   10 |      8 | 2001-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant   | 110000 |   10 |      7 | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | abhisek |  10000 |   20 |      6 | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | aditya  |   5000 |   20 |      5 | 2000-01-01 | library_asi | psl         | chennai |  682024 |
|   7 | apurv   |  12000 |   20 |      4 | 2002-01-01 | xyz         | eddaplly    | mumbai  |  682025 |
|   8 | hemant  |   1200 |   30 |      3 | 2004-01-01 | xyzp        | edda        | kochi   |  682026 |
|   9 | amit    |  12000 |   30 |      2 | 2006-01-01 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini |  15000 |   30 |      1 | 2008-01-01 | y           | dharavi     | mumbai  |  682028 |
|  11 | asdf    |  15000 |   30 |   NULL | 2012-01-01 | y           | dharavi     | mumbai  |  682028 |
|  12 | sdf     |  15000 |   20 |   NULL | 2019-01-01 | y           | dharavi     | mumbai  |  682028 |
+-----+---------+--------+------+--------+------------+-------------+-------------+---------+---------+
12 rows in set (0.00 sec)

mysql> SELECT ENAME AS NAME FROM EMPLOYEE WHERE MNGRNO IS NULL;
+------+
| NAME |
+------+
| asdf |
| sdf  |
+------+
2 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET ENAME='janardan' WHERE ENO=5;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET ENAME='jony' WHERE ENO=6;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET ENAME='jen' WHERE ENO=7;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM EMPLOYEE;
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam    |   5000 |   10 |     10 | 1998-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal   |   6000 |   10 |      9 | 1999-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan    |  10000 |   10 |      8 | 2001-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant    | 110000 |   10 |      7 | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | janardan |  10000 |   20 |      6 | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | jony     |   5000 |   20 |      5 | 2000-01-01 | library_asi | psl         | chennai |  682024 |
|   7 | jen      |  12000 |   20 |      4 | 2002-01-01 | xyz         | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |   1200 |   30 |      3 | 2004-01-01 | xyzp        | edda        | kochi   |  682026 |
|   9 | amit     |  12000 |   30 |      2 | 2006-01-01 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini  |  15000 |   30 |      1 | 2008-01-01 | y           | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  15000 |   30 |   NULL | 2012-01-01 | y           | dharavi     | mumbai  |  682028 |
|  12 | sdf      |  15000 |   20 |   NULL | 2019-01-01 | y           | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
12 rows in set (0.00 sec)


mysql> SELECT * FROM EMPLOYEE WHERE ENAME LIKE '%j_n%';
+-----+----------+--------+------+--------+------------+-------------+----------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS  | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+-------------+----------+---------+---------+
|   5 | janardan |  10000 |   20 |      6 | 1999-01-01 | professor   | pnl      | chennai |  682023 |
|   6 | jony     |   5000 |   20 |      5 | 2000-01-01 | library_asi | psl      | chennai |  682024 |
|   7 | jen      |  12000 |   20 |      4 | 2002-01-01 | xyz         | eddaplly | mumbai  |  682025 |
+-----+----------+--------+------+--------+------------+-------------+----------+---------+---------+
3 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET DOJ='2000-02-10' WHERE DOj='2006-01-01';
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET DOJ='2000-05-10' WHERE DOJ='2012-01-01';
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM EMPLOYEE;
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam    |   5000 |   10 |     10 | 1998-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal   |   6000 |   10 |      9 | 1999-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan    |  10000 |   10 |      8 | 2001-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant    | 110000 |   10 |      7 | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | janardan |  10000 |   20 |      6 | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | jony     |   5000 |   20 |      5 | 2000-01-01 | library_asi | psl         | chennai |  682024 |
|   7 | jen      |  12000 |   20 |      4 | 2002-01-01 | xyz         | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |   1200 |   30 |      3 | 2004-01-01 | xyzp        | edda        | kochi   |  682026 |
|   9 | amit     |  12000 |   30 |      2 | 2000-02-10 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini  |  15000 |   30 |      1 | 2008-01-01 | y           | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  15000 |   30 |   NULL | 2000-05-10 | y           | dharavi     | mumbai  |  682028 |
|  12 | sdf      |  15000 |   20 |   NULL | 2019-01-01 | y           | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
12 rows in set (0.00 sec)


mysql> SELECT * FROM EMPLOYEE WHERE DOJ LIKE '%2000______%';
+-----+-------+--------+------+--------+------------+-------------+---------+---------+---------+
| ENO | ENAME | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS | CITY    | PINCODE |
+-----+-------+--------+------+--------+------------+-------------+---------+---------+---------+
|   6 | jony  |   5000 |   20 |      5 | 2000-01-01 | library_asi | psl     | chennai |  682024 |
|   9 | amit  |  12000 |   30 |      2 | 2000-02-10 | x           | mrk     | kochi   |  682027 |
|  11 | asdf  |  15000 |   30 |   NULL | 2000-05-10 | y           | dharavi | mumbai  |  682028 |
+-----+-------+--------+------+--------+------------+-------------+---------+---------+---------+
3 rows in set, 1 warning (0.00 sec)

mysql> SELECT 'EVERY YEAR', ENAME,'EARNS',(12*SALARY) AS AMOUNT FROM EMPLOYEE;
+------------+----------+-------+---------+
| EVERY YEAR | ENAME    | EARNS | AMOUNT  |
+------------+----------+-------+---------+
| EVERY YEAR | aslam    | EARNS |   60000 |
| EVERY YEAR | mishal   | EARNS |   72000 |
| EVERY YEAR | afsan    | EARNS |  120000 |
| EVERY YEAR | anant    | EARNS | 1320000 |
| EVERY YEAR | janardan | EARNS |  120000 |
| EVERY YEAR | jony     | EARNS |   60000 |
| EVERY YEAR | jen      | EARNS |  144000 |
| EVERY YEAR | hemant   | EARNS |   14400 |
| EVERY YEAR | amit     | EARNS |  144000 |
| EVERY YEAR | ashwini  | EARNS |  180000 |
| EVERY YEAR | asdf     | EARNS |  180000 |
| EVERY YEAR | sdf      | EARNS |  180000 |
+------------+----------+-------+---------+
12 rows in set (0.00 sec)

mysql> SELECT COUNT(ENO) FROM EMPLOYEE;
+------------+
| COUNT(ENO) |
+------------+
|         12 |
+------------+
1 row in set (0.00 sec)


mysql> SELECT DNO,JOB,MIN(SALARY) FROM EMPLOYEE WHERE SALARY>7000 GROUP BY DNO,JOB;
+------+-------------+-------------+
| DNO  | JOB         | MIN(SALARY) |
+------+-------------+-------------+
|   10 | co-ordinate |      110000 |
|   10 | profsr      |       10000 |
|   20 | professor   |       10000 |
|   20 | xyz         |       12000 |
|   20 | y           |       15000 |
|   30 | x           |       12000 |
|   30 | y           |       15000 |
+------+-------------+-------------+
7 rows in set (0.00 sec)


mysql> SELECT DNO,MNGRNO,MIN(SALARY) AS MINIMUM_SALARY FROM EMPLOYEE GROUP BY DNO,MNGRNO;
+------+--------+----------------+
| DNO  | MNGRNO | MINIMUM_SALARY |
+------+--------+----------------+
|   10 |      7 |         110000 |
|   10 |      8 |          10000 |
|   10 |      9 |           6000 |
|   10 |     10 |           5000 |
|   20 |   NULL |          15000 |
|   20 |      4 |          12000 |
|   20 |      5 |           5000 |
|   20 |      6 |          10000 |
|   30 |   NULL |          15000 |
|   30 |      1 |          15000 |
|   30 |      2 |          12000 |
|   30 |      3 |           1200 |
+------+--------+----------------+
12 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET JOB='manager' WHERE ENO=6;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET JOB='manager' WHERE ENO=7;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET JOB='manager' WHERE ENO=8;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0


mysql> select * from EMPLOYEE;
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam    |   5000 |   10 |     10 | 1998-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal   |   6000 |   10 |      9 | 1999-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan    |  10000 |   10 |      8 | 2001-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant    | 110000 |   10 |      7 | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | janardan |  10000 |   20 |      6 | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | jony     |   5000 |   20 |      5 | 2000-01-01 | manager     | psl         | chennai |  682024 |
|   7 | jen      |  12000 |   20 |      4 | 2002-01-01 | manager     | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |   1200 |   30 |      3 | 2004-01-01 | manager     | edda        | kochi   |  682026 |
|   9 | amit     |  12000 |   30 |      2 | 2000-02-10 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini  |  15000 |   30 |      1 | 2008-01-01 | y           | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  15000 |   30 |   NULL | 2000-05-10 | y           | dharavi     | mumbai  |  682028 |
|  12 | sdf      |  15000 |   20 |   NULL | 2019-01-01 | y           | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
12 rows in set (0.00 sec)

mysql> SELECT DNO,MIN(SALARY) FROM EMPLOYEE WHERE JOB='manager' GROUP BY DNO;
+------+-------------+
| DNO  | MIN(SALARY) |
+------+-------------+
|   20 |        5000 |
|   30 |        1200 |
+------+-------------+
2 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET JOB='clerk' WHERE JOB='y';
Query OK, 3 rows affected (0.04 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from EMPLOYEE;
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam    |   5000 |   10 |     10 | 1998-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal   |   6000 |   10 |      9 | 1999-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan    |  10000 |   10 |      8 | 2001-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant    | 110000 |   10 |      7 | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | janardan |  10000 |   20 |      6 | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | jony     |   5000 |   20 |      5 | 2000-01-01 | manager     | psl         | chennai |  682024 |
|   7 | jen      |  12000 |   20 |      4 | 2002-01-01 | manager     | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |   1200 |   30 |      3 | 2004-01-01 | manager     | edda        | kochi   |  682026 |
|   9 | amit     |  12000 |   30 |      2 | 2000-02-10 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini  |  15000 |   30 |      1 | 2008-01-01 | clerk       | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  15000 |   30 |   NULL | 2000-05-10 | clerk       | dharavi     | mumbai  |  682028 |
|  12 | sdf      |  15000 |   20 |   NULL | 2019-01-01 | clerk       | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
12 rows in set (0.00 sec)



mysql> SELECT ENAME AS NAME_OF_CLERK ,DEPARTMENT.DNAME FROM EMPLOYEE,DEPARTMENT WHERE JOB='clerk' AND EMPLOYEE.DNO=DEPARTMENT.DNO;
+---------------+-------+
| NAME_OF_CLERK | DNAME |
+---------------+-------+
| ashwini       | ec    |
| asdf          | cs    |
| sdf           | sales |
+---------------+-------+
3 rows in set (0.00 sec)


mysql> SELECT ENAME AS NAME,DATE_FORMAT(DOJ,'%d/%m/%y') AS DOJ FROM EMPLOYEE;
+----------+----------+
| NAME     | DOJ      |
+----------+----------+
| aslam    | 01/01/98 |
| mishal   | 01/01/99 |
| afsan    | 01/01/01 |
| anant    | 01/01/96 |
| janardan | 01/01/99 |
| jony     | 01/01/00 |
| jen      | 01/01/02 |
| hemant   | 01/01/04 |
| amit     | 10/02/00 |
| ashwini  | 01/01/08 |
| asdf     | 10/05/00 |
| sdf      | 01/01/19 |
+----------+----------+
12 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET SALARY=1.2*SALARY;
Query OK, 12 rows affected (0.05 sec)
Rows matched: 12  Changed: 12  Warnings: 0

mysql> SELECT * FROM EMPLOYEE;
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam    |   6000 |   10 |     10 | 1998-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal   |   7200 |   10 |      9 | 1999-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan    |  12000 |   10 |      8 | 2001-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant    | 132000 |   10 |      7 | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | janardan |  12000 |   20 |      6 | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | jony     |   6000 |   20 |      5 | 2000-01-01 | manager     | psl         | chennai |  682024 |
|   7 | jen      |  14400 |   20 |      4 | 2002-01-01 | manager     | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |   1440 |   30 |      3 | 2004-01-01 | manager     | edda        | kochi   |  682026 |
|   9 | amit     |  14400 |   30 |      2 | 2000-02-10 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini  |  18000 |   30 |      1 | 2008-01-01 | clerk       | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  18000 |   10 |   NULL | 2000-05-10 | clerk       | dharavi     | mumbai  |  682028 |
|  12 | sdf      |  18000 |   20 |   NULL | 2019-01-01 | clerk       | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
12 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET SALARY=10000 WHERE SALARY<7000;
Query OK, 3 rows affected (0.05 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> SELECT * FROM EMPLOYEE;
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB         | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
|   1 | aslam    |  10000 |   10 |     10 | 1998-01-01 | lab_assi    | aluva       | kochi   |  683101 |
|   2 | mishal   |   7200 |   10 |      9 | 1999-01-01 | assi_p      | kalamassery | kochi   |  682021 |
|   3 | afsan    |  12000 |   10 |      8 | 2001-01-01 | profsr      | kalamassery | kochi   |  682021 |
|   4 | anant    | 132000 |   10 |      7 | 1996-01-01 | co-ordinate | panvale     | mumbai  |  682022 |
|   5 | janardan |  12000 |   20 |      6 | 1999-01-01 | professor   | pnl         | chennai |  682023 |
|   6 | jony     |  10000 |   20 |      5 | 2000-01-01 | manager     | psl         | chennai |  682024 |
|   7 | jen      |  14400 |   20 |      4 | 2002-01-01 | manager     | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |  10000 |   30 |      3 | 2004-01-01 | manager     | edda        | kochi   |  682026 |
|   9 | amit     |  14400 |   30 |      2 | 2000-02-10 | x           | mrk         | kochi   |  682027 |
|  10 | ashwini  |  18000 |   30 |      1 | 2008-01-01 | clerk       | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  18000 |   10 |   NULL | 2000-05-10 | clerk       | dharavi     | mumbai  |  682028 |
|  12 | sdf      |  18000 |   20 |   NULL | 2019-01-01 | clerk       | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+-------------+-------------+---------+---------+
12 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET JOB='senior_clerk' WHERE SALARY=10000;
Query OK, 3 rows affected (0.03 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> SELECT * FROM EMPLOYEE;
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB          | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
|   1 | aslam    |  10000 |   10 |     10 | 1998-01-01 | senior_clerk | aluva       | kochi   |  683101 |
|   2 | mishal   |   7200 |   10 |      9 | 1999-01-01 | assi_p       | kalamassery | kochi   |  682021 |
|   3 | afsan    |  12000 |   10 |      8 | 2001-01-01 | profsr       | kalamassery | kochi   |  682021 |
|   4 | anant    | 132000 |   10 |      7 | 1996-01-01 | co-ordinate  | panvale     | mumbai  |  682022 |
|   5 | janardan |  12000 |   20 |      6 | 1999-01-01 | professor    | pnl         | chennai |  682023 |
|   6 | jony     |  10000 |   20 |      5 | 2000-01-01 | senior_clerk | psl         | chennai |  682024 |
|   7 | jen      |  14400 |   20 |      4 | 2002-01-01 | manager      | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |  10000 |   30 |      3 | 2004-01-01 | senior_clerk | edda        | kochi   |  682026 |
|   9 | amit     |  14400 |   30 |      2 | 2000-02-10 | x            | mrk         | kochi   |  682027 |
|  10 | ashwini  |  18000 |   30 |      1 | 2008-01-01 | clerk        | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  18000 |   10 |   NULL | 2000-05-10 | clerk        | dharavi     | mumbai  |  682028 |
|  12 | sdf      |  18000 |   20 |   NULL | 2019-01-01 | clerk        | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
12 rows in set (0.00 sec)




mysql> DELETE FROM EMPLOYEE WHERE DOJ <'1998-01-01';
Query OK, 1 row affected (0.04 sec)

mysql> SELECT *  FROM EMPLOYEE
    -> ;
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB          | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
|   1 | aslam    |  10000 |   10 |     10 | 1998-01-01 | senior_clerk | aluva       | kochi   |  683101 |
|   2 | mishal   |   7200 |   10 |      9 | 1999-01-01 | assi_p       | kalamassery | kochi   |  682021 |
|   3 | afsan    |  12000 |   10 |      8 | 2001-01-01 | profsr       | kalamassery | kochi   |  682021 |
|   5 | janardan |  12000 |   20 |      6 | 1999-01-01 | professor    | pnl         | chennai |  682023 |
|   6 | jony     |  10000 |   20 |      5 | 2000-01-01 | senior_clerk | psl         | chennai |  682024 |
|   7 | jen      |  14400 |   20 |      4 | 2002-01-01 | manager      | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |  10000 |   30 |      3 | 2004-01-01 | senior_clerk | edda        | kochi   |  682026 |
|   9 | amit     |  14400 |   30 |      2 | 2000-02-10 | x            | mrk         | kochi   |  682027 |
|  10 | ashwini  |  18000 |   30 |      1 | 2008-01-01 | clerk        | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  18000 |   10 |   NULL | 2000-05-10 | clerk        | dharavi     | mumbai  |  682028 |
|  12 | sdf      |  18000 |   20 |   NULL | 2019-01-01 | clerk        | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
11 rows in set (0.00 sec)

mysql>  UPDATE EMPLOYEE SET JOB='senior_clerk' WHERE SALARY=10000;
Query OK, 0 rows affected (0.03 sec)
Rows matched: 3  Changed: 0  Warnings: 0

mysql>  UPDATE EMPLOYEE SET JOB='worker' WHERE JOB='assi_p';
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  UPDATE EMPLOYEE SET JOB='worker' WHERE JOB='x';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  UPDATE EMPLOYEE SET JOB='worker' WHERE JOB='clerk';
Query OK, 3 rows affected (0.04 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> SELECT *  FROM EMPLOYEE
    -> ;
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB          | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
|   1 | aslam    |  10000 |   10 |     10 | 1998-01-01 | senior_clerk | aluva       | kochi   |  683101 |
|   2 | mishal   |   7200 |   10 |      9 | 1999-01-01 | worker       | kalamassery | kochi   |  682021 |
|   3 | afsan    |  12000 |   10 |      8 | 2001-01-01 | profsr       | kalamassery | kochi   |  682021 |
|   5 | janardan |  12000 |   20 |      6 | 1999-01-01 | professor    | pnl         | chennai |  682023 |
|   6 | jony     |  10000 |   20 |      5 | 2000-01-01 | senior_clerk | psl         | chennai |  682024 |
|   7 | jen      |  14400 |   20 |      4 | 2002-01-01 | manager      | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |  10000 |   30 |      3 | 2004-01-01 | senior_clerk | edda        | kochi   |  682026 |
|   9 | amit     |  14400 |   30 |      2 | 2000-02-10 | worker       | mrk         | kochi   |  682027 |
|  10 | ashwini  |  18000 |   30 |      1 | 2008-01-01 | worker       | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  18000 |   10 |   NULL | 2000-05-10 | worker       | dharavi     | mumbai  |  682028 |
|  12 | sdf      |  18000 |   20 |   NULL | 2019-01-01 | worker       | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
11 rows in set (0.00 sec)

mysql>  UPDATE EMPLOYEE SET JOB='clerk' WHERE JOB='worker' AND ENO=10;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  UPDATE EMPLOYEE SET JOB='clerk' WHERE JOB='worker' AND ENO=10 AND MNGRNO=1 ;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> SELECT *  FROM EMPLOYEE;
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB          | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
|   1 | aslam    |  10000 |   10 |     10 | 1998-01-01 | senior_clerk | aluva       | kochi   |  683101 |
|   2 | mishal   |   7200 |   10 |      9 | 1999-01-01 | worker       | kalamassery | kochi   |  682021 |
|   3 | afsan    |  12000 |   10 |      8 | 2001-01-01 | profsr       | kalamassery | kochi   |  682021 |
|   5 | janardan |  12000 |   20 |      6 | 1999-01-01 | professor    | pnl         | chennai |  682023 |
|   6 | jony     |  10000 |   20 |      5 | 2000-01-01 | senior_clerk | psl         | chennai |  682024 |
|   7 | jen      |  14400 |   20 |      4 | 2002-01-01 | manager      | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |  10000 |   30 |      3 | 2004-01-01 | senior_clerk | edda        | kochi   |  682026 |
|   9 | amit     |  14400 |   30 |      2 | 2000-02-10 | worker       | mrk         | kochi   |  682027 |
|  10 | ashwini  |  18000 |   30 |      1 | 2008-01-01 | clerk        | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  18000 |   10 |   NULL | 2000-05-10 | worker       | dharavi     | mumbai  |  682028 |
|  12 | sdf      |  18000 |   20 |   NULL | 2019-01-01 | worker       | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
11 rows in set (0.00 sec)


mysql> DELETE FROM EMPLOYEE WHERE JOB='worker' AND DNO=20;
Query OK, 1 row affected (0.04 sec)

mysql> SELECT *  FROM EMPLOYEE;
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB          | ADDRESS     | CITY    | PINCODE |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
|   1 | aslam    |  10000 |   10 |     10 | 1998-01-01 | senior_clerk | aluva       | kochi   |  683101 |
|   2 | mishal   |   7200 |   10 |      9 | 1999-01-01 | worker       | kalamassery | kochi   |  682021 |
|   3 | afsan    |  12000 |   10 |      8 | 2001-01-01 | profsr       | kalamassery | kochi   |  682021 |
|   5 | janardan |  12000 |   20 |      6 | 1999-01-01 | professor    | pnl         | chennai |  682023 |
|   6 | jony     |  10000 |   20 |      5 | 2000-01-01 | senior_clerk | psl         | chennai |  682024 |
|   7 | jen      |  14400 |   20 |      4 | 2002-01-01 | manager      | eddaplly    | mumbai  |  682025 |
|   8 | hemant   |  10000 |   30 |      3 | 2004-01-01 | senior_clerk | edda        | kochi   |  682026 |
|   9 | amit     |  14400 |   30 |      2 | 2000-02-10 | worker       | mrk         | kochi   |  682027 |
|  10 | ashwini  |  18000 |   30 |      1 | 2008-01-01 | clerk        | dharavi     | mumbai  |  682028 |
|  11 | asdf     |  18000 |   10 |   NULL | 2000-05-10 | worker       | dharavi     | mumbai  |  682028 |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+
10 rows in set (0.00 sec) 

