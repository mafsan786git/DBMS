--create table employee--
create table employee(EID int(5),name varchar(20),desig varchar(20),bsalary float(8,2),rating varchar(5));
-- insert into employee--
insert into employee values(1,'afsan','manager',50000,'S');
insert into employee values(2,'anat','senior manager',100000,'A');
insert into employee values(3,'apurv','clerk',25000,'C');
select * from employee;
--create table Salary--
create table Salary(EID int(5),salary float(8,2));
-- insert into Salary--
insert into Salary(EID) values(1);
insert into Salary(EID) values(2);
insert into Salary(EID) values(3);
select * from Salary;
-- procedure code for increase and update salar of employee in Salary table using cursor--

delimiter #
drop procedure if exists payroll;
create procedure payroll(id int(5))
begin
declare fs float(8,2);
declare bs float(8,2);
declare rt varchar(5);
declare done int default 0;
declare cur cursor for select bsalary,rating from employee where employee.EID=id;
declare continue handler for not found set done=1;
open cur;
readloop:loop
fetch cur into bs,rt;
if rt='S' then
set fs=bs+bs*0.1;
end if;
if rt='A' then
set fs=bs+bs*0.5;
end if;
if rt='C' then
set fs=bs;
end if;
if rt='B' then
set fs=bs+bs*0.2;
end if;
if done=1 then
leave readloop;
end if;
update Salary set salary=fs where Salary.EID=id;
end loop;
close cur;
select * from Salary where Salary.EID=id;
end #




















