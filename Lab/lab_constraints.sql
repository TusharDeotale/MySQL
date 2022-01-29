show databases;
use cdac;
show tables;
desc emp;

/*1. Write a query to create a new table as emp2 with the columns and following constraints-

empno int primary key
ename varchar not null
salary int default value as 10000
deptno int foreign key reference of depid in dept1 table.
mgr_id  int foreign key reference of empno
job_id  int foreign key reference of job_id of jobs. */

create table dept1(depid int primary key);
desc dept1;
create table emp2 (empno int primary key, ename varchar(40) not null, salary int default 10000, depid int, mgr_id int, job_id int, constraint fk_d foreign key(depid) references dept1(depid), constraint fk_m foreign key(mgr_id) references emp2(empno), constraint fk_j foreign key(job_id) references jobs(job_id));
desc emp2;

/*2.Write a query to create a new table as jobs with 

job_id int primary key
job_title varchar
salary int */
create table jobs (job_id int primary key, job_title varchar(40), salary int);
desc jobs;

/*3. Write a query to add constriant as NOT NULL in Q2 for job_title.*/
alter table jobs modify job_title varchar(40) not null;

/*4. Write a query to add default value to job_title.*/
alter table jobs modify job_title varchar(40) default 'Programmer';