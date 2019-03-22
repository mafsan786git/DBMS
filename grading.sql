mysql> create table test(rollno int(10),name char(20),m1 float(5,2), m2 float(5,2),m3 float(5,2),m4 float(5,2),m5 float(5,2),m6 float(5,2),total float(5,2),grade char(2));
Query OK, 0 rows affected (0.30 sec)

mysql> alter table test add primary key(rollno);
Query OK, 0 rows affected (0.46 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into test(rollno,name,m1,m2,m3,m4,m5,m6)
-> values(40,'afsan',90,98,95,96,99,94)
-> ,(44,'anant',85,92,90,100,94,80);
Query OK, 2 rows affected (0.05 sec)
Records: 2  Duplicates: 0  Warnings: 0



mysql> select * from test;
+--------+-------+-------+-------+-------+--------+-------+-------+-------+-------+
| rollno | name  | m1    | m2    | m3    | m4     | m5    | m6    | total | grade |
+--------+-------+-------+-------+-------+--------+-------+-------+-------+-------+
|     40 | afsan | 90.00 | 98.00 | 95.00 |  96.00 | 99.00 | 94.00 |  NULL | NULL  |
|     44 | anant | 85.00 | 92.00 | 90.00 | 100.00 | 94.00 | 80.00 |  NULL | NULL  |
+--------+-------+-------+-------+-------+--------+-------+-------+-------+-------+
2 rows in set (0.00 sec)




mysql>      delimiter #
mysql>      drop procedure if exists grade;
    ->      create procedure grade()
    ->      begin
    ->       DECLARE done INT default 0;
    ->      DECLARE nam VARCHAR(20);
    ->      DECLARE g VARCHAR(2);
    ->      DECLARE r int;
    ->      DECLARE a,b,c,d,e,f,t float(5,2);
    ->      DECLARE cur CURSOR FOR SELECT rollno,name,m1,m2,m3,m4,m5,m6 FROM test;
    ->      DECLARE continue handler FOR NOT FOUND set done = 1;
    ->       OPEN cur;
    ->      readloop:loop
    ->      fetch cur into r,nam,a,b,c,d,e,f;
    ->      set t=a+b+c+d+e+f;
    ->      if t>480 then
    ->      set g='A';
    ->      else if t>400 then
    ->      set g='B+';
    -> else if t>360 then
    -> set g='B';
    -> else if t>300 then
    -> set g='C';
    -> else
    -> set g='F';
    -> end if;
    -> end if;
    -> end if;
    -> end if;
    -> if done = 1 then
    ->         leave readloop;
    -> end if;update test set grade=g,total=t where rollno=r;
    -> end loop;
    -> close cur;
    -> select *from test;
    -> end #
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call grade()#
+--------+-------+-------+-------+-------+--------+-------+-------+--------+-------+
| rollno | name  | m1    | m2    | m3    | m4     | m5    | m6    | total  | grade |
+--------+-------+-------+-------+-------+--------+-------+-------+--------+-------+
|     40 | afsan | 90.00 | 98.00 | 95.00 |  96.00 | 99.00 | 94.00 | 572.00 | A     |
|     44 | anant | 85.00 | 92.00 | 90.00 | 100.00 | 94.00 | 80.00 | 541.00 | A     |
+--------+-------+-------+-------+-------+--------+-------+-------+--------+-------+
2 rows in set (0.10 sec)

Query OK, 0 rows affected (0.10 sec)




	


