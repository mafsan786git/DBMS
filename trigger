//AFSAN-55


mysql> create table Account (Accno int(20) primary key , name varchar(20) , balance float);
Query OK, 0 rows affected (0.27 sec)

mysql> create table trans(accno int , trans_type varchar(30) , trans_date date, amount float, foreign key(accno) references Account(Accno) );
Query OK, 0 rows affected (0.30 sec)

mysql> desc trans;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| accno      | int(11)     | YES  | MUL | NULL    |       |
| trans_type | varchar(30) | YES  |     | NULL    |       |
| trans_date | date        | YES  |     | NULL    |       |
| amount     | float       | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> insert into Account values(100,'Shubham',15000),(101,'Mohit',12000),(102,'Shishir',16000);
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from Account;
+-------+---------+---------+
| Accno | name    | balance |
+-------+---------+---------+
|   100 | afsan |   15000 |
|   101 | Mohit   |   12000 |
|   102 | Shishir |   16000 |
+-------+---------+---------+
3 rows in set (0.01 sec)

mysql> delimiter #
mysql> create trigger t1 after insert on trans for each row
    -> begin
    -> if NEW.trans_type='withdraw'
    -> then
    -> update Account set balance=balance-NEW.amount where Account.Accno=NEW.accno;
    -> else if NEW.trans_type='deposit'  then
    -> update Account set balance = balance+NEW.amount where Account.Accno=NEW.accno;
    -> end if;
    -> end if;
    -> end #
Query OK, 0 rows affected (0.07 sec)

mysql> insert into trans values(100,'withdraw','2018-03-12',5000)#
Query OK, 1 row affected (0.07 sec)

mysql> select * from Account#
+-------+---------+---------+
| Accno | name    | balance |
+-------+---------+---------+
|   100 | afsan |   10000 |
|   101 | Mohit   |   12000 |
|   102 | Shishir |   16000 |
+-------+---------+---------+
3 rows in set (0.00 sec)

mysql> insert into trans values(100,'deposit','2018-03-25',10000)#
Query OK, 1 row affected (0.13 sec)

mysql> select * from Account#
+-------+---------+---------+
| Accno | name    | balance |
+-------+---------+---------+
|   100 | afsan |   20000 |
|   101 | Mohit   |   12000 |
|   102 | Shishir |   16000 |
+-------+---------+---------+
3 rows in set (0.01 sec)


