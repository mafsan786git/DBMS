$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.7.25-0ubuntu0.16.04.2 (Ubuntu)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database Bank;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| Bank               |
| CITY_exp3          |
| COMPANY            |
| DEPARTMENT         |
| EMPLOYEE           |
| EXPERIMENT         |
| account            |
| arenafc            |
| cycle              |
| dept               |
| emp                |
| employee           |
| kerela             |
| mysql              |
| performance_schema |
| school             |
| student            |
| studentdetails     |
| sys                |
| tamilnadu          |
| transaction        |
| university         |
+--------------------+
23 rows in set (0.00 sec)


mysql> use Bank;
Database changed

mysql> CREATE TABLE account(acc_no VARCHAR(20) PRIMARY KEY,acc_name VARCHAR(20),address VARCHAR(20),pan_no VARCHAR(20),acc_type VARCHAR(20), balance VARCHAR(20),phone VARCHAR(15));
Query OK, 0 rows affected (0.30 sec)


mysql> CREATE TABLE transaction(tran_id INT(20) PRIMARY KEY AUTO_INCREMENT, acc_no VARCHAR(20),tran_date date,amount INT(20),tran_type VARCHAR(20));
Query OK, 0 rows affected (0.27 sec)

mysql> show tables;
+----------------+
| Tables_in_Bank |
+----------------+
| account        |
| transaction    |
+----------------+
2 rows in set (0.00 sec)

mysql> describe account;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| acc_no   | varchar(20) | NO   | PRI | NULL    |       |
| acc_name | varchar(20) | YES  |     | NULL    |       |
| address  | varchar(20) | YES  |     | NULL    |       |
| pan_no   | varchar(20) | YES  |     | NULL    |       |
| acc_type | varchar(20) | YES  |     | NULL    |       |
| balance  | varchar(20) | YES  |     | NULL    |       |
| phone    | varchar(15) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> describe transaction;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| tran_id   | int(20)     | NO   | PRI | NULL    | auto_increment |
| acc_no    | varchar(20) | YES  |     | NULL    |                |
| tran_date | date        | YES  |     | NULL    |                |
| amount    | int(20)     | YES  |     | NULL    |                |
| tran_type | varchar(20) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)


mysql> ALTER TABLE transaction ADD FOREIGN KEY(acc_no) REFERENCES account(acc_no);
Query OK, 0 rows affected (0.92 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO account VALUES(12180056,'megha s nair','aluva',80056,'saving',6000, 8129976681),(12180055,'megha rose','thrissur',80055,'current',3000,7842565120),(12180057,'mishal','calicut',80057,'current',4500,9544023537),(12180058,'afsan','allahabad',80058,'current',250000,7355327683),(12180059,'aslam','ernakulum',80059,'current',300000,9744368174);
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM account;
+----------+--------------+-----------+--------+----------+---------+------------+
| acc_no   | acc_name     | address   | pan_no | acc_type | balance | phone      |
+----------+--------------+-----------+--------+----------+---------+------------+
| 12180055 | megha rose   | thrissur  | 80055  | current  | 3000    | 7842565120 |
| 12180056 | megha s nair | aluva     | 80056  | saving   | 6000    | 8129976681 |
| 12180057 | mishal       | calicut   | 80057  | current  | 4500    | 9544023537 |
| 12180058 | afsan        | allahabad | 80058  | current  | 250000  | 7355327683 |
| 12180059 | aslam        | ernakulum | 80059  | current  | 300000  | 9744368174 |
+----------+--------------+-----------+--------+----------+---------+------------+
5 rows in set (0.00 sec)


mysql> INSERT INTO transaction(acc_no,tran_date,amount,tran_type) VALUES(12180055,'2019-01-15',1500,'credit');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO transaction(acc_no,tran_date,amount,tran_type) VALUE(12180056,'2019-02-15',1000,'debit');                                                           Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO transaction(acc_no,tran_date,amount,tran_type) VALUES(12180057,'2019-02-20',1000,'debit');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO transaction(acc_no,tran_date,amount,tran_type) VALUES(12180059,'2019-01-21',50000,'credit');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO transaction(acc_no,tran_date,amount,tran_type) VALUES(12180058,'2019-01-20',50000,'debit');
Query OK, 1 row affected (0.03 sec)


mysql> SELECT * FROM transaction;
+---------+----------+------------+--------+-----------+
| tran_id | acc_no   | tran_date  | amount | tran_type |
+---------+----------+------------+--------+-----------+
|       1 | 12180055 | 2019-01-15 |   1500 | credit    |
|       2 | 12180056 | 2019-02-15 |   1000 | debit     |
|       3 | 12180057 | 2019-02-20 |   1000 | debit     |
|       5 | 12180059 | 2019-01-21 |  50000 | credit    |
|       6 | 12180058 | 2019-02-25 |  50000 | debit     |
+---------+----------+------------+--------+-----------+
5 rows in set (0.00 sec)


mysql> CREATE VIEW V1 AS SELECT acc_name,acc_no,pan_no FROM account WHERE acc_type='current';
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE VIEW V2 AS SELECT acc_name,phone,balance FROM account,transaction WHERE tran_date < '2019-02-01' AND balance > 100000 AND account.acc_no=transaction.acc_no;
Query OK, 0 rows affected (0.04 sec)


mysql> SELECT * FROM V1;
+------------+----------+--------+
| acc_name   | acc_no   | pan_no |
+------------+----------+--------+
| megha rose | 12180055 | 80055  |
| mishal     | 12180057 | 80057  |
| afsan      | 12180058 | 80058  |
| aslam      | 12180059 | 80059  |
+------------+----------+--------+
4 rows in set (0.00 sec)


mysql> SELECT * FROM V2;
+----------+------------+---------+
| acc_name | phone      | balance |
+----------+------------+---------+
| aslam    | 9744368174 | 300000  |
+----------+------------+---------+
1 row in set (0.00 sec)

mysql> UPDATE account SET acc_type='saving' WHERE balance<5000 AND acc_type='current';
Query OK, 2 rows affected (0.03 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM account;
+----------+--------------+-----------+--------+----------+---------+------------+
| acc_no   | acc_name     | address   | pan_no | acc_type | balance | phone      |
+----------+--------------+-----------+--------+----------+---------+------------+
| 12180055 | megha rose   | thrissur  | 80055  | saving   | 3000    | 7842565120 |
| 12180056 | megha s nair | aluva     | 80056  | saving   | 6000    | 8129976681 |
| 12180057 | mishal       | calicut   | 80057  | saving   | 4500    | 9544023537 |
| 12180058 | afsan        | allahabad | 80058  | current  | 250000  | 7355327683 |
| 12180059 | aslam        | ernakulum | 80059  | current  | 300000  | 9744368174 |
+----------+--------------+-----------+--------+----------+---------+------------+
5 rows in set (0.00 sec)


mysql> INSERT INTO transaction(acc_no,tran_date,amount,tran_type) 
    -> SELECT acc_no,now(),10000,'debit' FROM account
    -> WHERE balance>200000 AND account.acc_no NOT IN 
    -> (SELECT acc_no FROM transaction WHERE month(tran_date)=month(now()));
Query OK, 1 row affected, 1 warning (0.06 sec)
Records: 1  Duplicates: 0  Warnings: 1

mysql> SELECT * FROM transaction;
+---------+----------+------------+--------+-----------+
| tran_id | acc_no   | tran_date  | amount | tran_type |
+---------+----------+------------+--------+-----------+
|       1 | 12180055 | 2019-01-15 |   1500 | credit    |
|       2 | 12180056 | 2019-02-15 |   1000 | debit     |
|       3 | 12180057 | 2019-02-20 |   1000 | debit     |
|       5 | 12180059 | 2019-01-21 |  50000 | credit    |
|       6 | 12180058 | 2019-02-25 |  50000 | debit     |
|       7 | 12180059 | 2019-02-28 |  10000 | debit     |
+---------+----------+------------+--------+-----------+
6 rows in set (0.00 sec)



