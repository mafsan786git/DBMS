$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.7.25-0ubuntu0.16.04.2 (Ubuntu)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.


mysql> use COMPANY
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


mysql> SELECT * FROM EMPLOYEE;
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
10 rows in set (0.02 sec)


mysql> SELECT * FROM DEPARTMENT;
+-----+-------+------+
| DNO | DNAME | DHOD |
+-----+-------+------+
|  10 | cs    | 3    |
|  20 | sales | 5    |
|  30 | ec    | 7    |
+-----+-------+------+
3 rows in set (0.00 sec)


mysql> SELECT EMPLOYEE.ENAME,EMPLOYEE.JOB,DEPARTMENT.DNAME FROM EMPLOYEE, DEPARTMENT WHERE EMPLOYEE.ENO=DEPARTMENT.DHOD;
+----------+-----------+-------+
| ENAME    | JOB       | DNAME |
+----------+-----------+-------+
| afsan    | profsr    | cs    |
| janardan | professor | sales |
| jen      | manager   | ec    |
+----------+-----------+-------+
3 rows in set (0.00 sec)


mysql> SELECT * FROM EMPLOYEE LEFT OUTER JOIN DEPARTMENT ON EMPLOYEE.DNO=DEPARTMENT.DNO;
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+------+-------+------+
| ENO | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB          | ADDRESS     | CITY    | PINCODE | DNO  | DNAME | DHOD |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+------+-------+------+
|   1 | aslam    |  10000 |   10 |     10 | 1998-01-01 | senior_clerk | aluva       | kochi   |  683101 |   10 | cs    | 3    |
|   2 | mishal   |   7200 |   10 |      9 | 1999-01-01 | worker       | kalamassery | kochi   |  682021 |   10 | cs    | 3    |
|   3 | afsan    |  12000 |   10 |      8 | 2001-01-01 | profsr       | kalamassery | kochi   |  682021 |   10 | cs    | 3    |
|  11 | asdf     |  18000 |   10 |   NULL | 2000-05-10 | worker       | dharavi     | mumbai  |  682028 |   10 | cs    | 3    |
|   5 | janardan |  12000 |   20 |      6 | 1999-01-01 | professor    | pnl         | chennai |  682023 |   20 | sales | 5    |
|   6 | jony     |  10000 |   20 |      5 | 2000-01-01 | senior_clerk | psl         | chennai |  682024 |   20 | sales | 5    |
|   7 | jen      |  14400 |   20 |      4 | 2002-01-01 | manager      | eddaplly    | mumbai  |  682025 |   20 | sales | 5    |
|   8 | hemant   |  10000 |   30 |      3 | 2004-01-01 | senior_clerk | edda        | kochi   |  682026 |   30 | ec    | 7    |
|   9 | amit     |  14400 |   30 |      2 | 2000-02-10 | worker       | mrk         | kochi   |  682027 |   30 | ec    | 7    |
|  10 | ashwini  |  18000 |   30 |      1 | 2008-01-01 | clerk        | dharavi     | mumbai  |  682028 |   30 | ec    | 7    |
+-----+----------+--------+------+--------+------------+--------------+-------------+---------+---------+------+-------+------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE RIGHT OUTER JOIN DEPARTMENT ON EMPLOYEE.DNO=DEPARTMENT.DNO;
+------+----------+--------+------+--------+------------+--------------+-------------+---------+---------+-----+-------+------+
| ENO  | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB          | ADDRESS     | CITY    | PINCODE | DNO | DNAME | DHOD |
+------+----------+--------+------+--------+------------+--------------+-------------+---------+---------+-----+-------+------+
|    1 | aslam    |  10000 |   10 |     10 | 1998-01-01 | senior_clerk | aluva       | kochi   |  683101 |  10 | cs    | 3    |
|    2 | mishal   |   7200 |   10 |      9 | 1999-01-01 | worker       | kalamassery | kochi   |  682021 |  10 | cs    | 3    |
|    3 | afsan    |  12000 |   10 |      8 | 2001-01-01 | profsr       | kalamassery | kochi   |  682021 |  10 | cs    | 3    |
|    5 | janardan |  12000 |   20 |      6 | 1999-01-01 | professor    | pnl         | chennai |  682023 |  20 | sales | 5    |
|    6 | jony     |  10000 |   20 |      5 | 2000-01-01 | senior_clerk | psl         | chennai |  682024 |  20 | sales | 5    |
|    7 | jen      |  14400 |   20 |      4 | 2002-01-01 | manager      | eddaplly    | mumbai  |  682025 |  20 | sales | 5    |
|    8 | hemant   |  10000 |   30 |      3 | 2004-01-01 | senior_clerk | edda        | kochi   |  682026 |  30 | ec    | 7    |
|    9 | amit     |  14400 |   30 |      2 | 2000-02-10 | worker       | mrk         | kochi   |  682027 |  30 | ec    | 7    |
|   10 | ashwini  |  18000 |   30 |      1 | 2008-01-01 | clerk        | dharavi     | mumbai  |  682028 |  30 | ec    | 7    |
|   11 | asdf     |  18000 |   10 |   NULL | 2000-05-10 | worker       | dharavi     | mumbai  |  682028 |  10 | cs    | 3    |
+------+----------+--------+------+--------+------------+--------------+-------------+---------+---------+-----+-------+------+
10 rows in set (0.00 sec)



mysql> SELECT * FROM EMPLOYEE LEFT JOIN DEPARTMENT ON EMPLOYEE.DNO=DEPARTMENT.DNO UNION SELECT * FROM EMPLOYEE RIGHT OUTER JOIN DEPARTMENT ON EMPLOYEE.DNO=DEPARTMENT.DNO;
+------+----------+--------+------+--------+------------+--------------+-------------+---------+---------+------+------+-------+------+
| ENO  | ENAME    | SALARY | DNO  | MNGRNO | DOJ        | JOB          | ADDRESS     | CITY    | PINCODE | next | DNO  | DNAME | DHOD |
+------+----------+--------+------+--------+------------+--------------+-------------+---------+---------+------+------+-------+------+
|    1 | aslam    |  10000 |   10 |     10 | 1998-01-01 | senior_clerk | aluva       | kochi   |  683101 | NULL |   10 | cs    | 3    |
|    2 | mishal   |   7200 |   10 |      9 | 1999-01-01 | worker       | kalamassery | kochi   |  682021 | NULL |   10 | cs    | 3    |
|    3 | afsan    |  12000 |   10 |      8 | 2001-01-01 | profsr       | kalamassery | kochi   |  682021 | NULL |   10 | cs    | 3    |
|   11 | asdf     |  18000 |   10 |   NULL | 2000-05-10 | worker       | dharavi     | mumbai  |  682028 | NULL |   10 | cs    | 3    |
|    5 | janardan |  12000 |   20 |      6 | 1999-01-01 | professor    | pnl         | chennai |  682023 | NULL |   20 | sales | 5    |
|    6 | jony     |  10000 |   20 |      5 | 2000-01-01 | senior_clerk | psl         | chennai |  682024 | NULL |   20 | sales | 5    |
|    7 | jen      |  14400 |   20 |      4 | 2002-01-01 | manager      | eddaplly    | mumbai  |  682025 | NULL |   20 | sales | 5    |
|    8 | hemant   |  10000 |   30 |      3 | 2004-01-01 | senior_clerk | edda        | kochi   |  682026 | NULL |   30 | ec    | 7    |
|    9 | amit     |  14400 |   30 |      2 | 2000-02-10 | worker       | mrk         | kochi   |  682027 | NULL |   30 | ec    | 7    |
|   10 | ashwini  |  18000 |   30 |      1 | 2008-01-01 | clerk        | dharavi     | mumbai  |  682028 | NULL |   30 | ec    | 7    |
| NULL | NULL     |   NULL | NULL |   NULL | NULL       | NULL         | NULL        | NULL    |    NULL | NULL |   40 | afsan | NULL |
+------+----------+--------+------+--------+------------+--------------+-------------+---------+---------+------+------+-------+------+
11 rows in set (0.00 sec)

----+--------+------------+--------------+-------------+---------+---------+-----+-------+------+



