create database lab;
show databases;
use lab;
create table DEPT(DeptNo int, DeptName varchar(40), Loc int);
show tables;
desc dept;
select * from dept;
insert into dept values
(10,'Mechanical',124),
(11,'Electrical',121),
(12,'Civil',123);
commit;
create table LOCATIONS(Loc int, Name varchar(40));
desc locations;
alter table locations add city varchar(15);
insert into locations values
(111, 'Mihan', 'Nagpur'),
(121, 'IT Park', 'Nahpur');
select * from locations;
commit;
create table emp (empNo int,eName varchar(40),salary int,dept_id int,manager_id int);
desc emp;
insert into emp(empNO,eName,salary,dept_id,manager_id) values (101,'Tushar',90000,10,NULL);
insert into emp(empNO,eName,salary,dept_id,manager_id) values 
(102,'Rjat',75000,11,2), 
(103,'Chetan',50000,10,3), 
(104,'Yash',60000,20,4), 
(105,'John',55000,30,5);
commit;
select * from emp;
alter table emp modify salary varchar(7);
create table salgrade(HISAL int, LOSAL int, GRADE char(3));
desc salgrade;
insert into salgrade values
(10000, 8000, 'b'),
(15000, 12000, 'a');
select * from salgrade;
commit;


