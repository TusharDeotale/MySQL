use cdac1;
#1. Create the MESSAGES table.Write a procedure to insert numbers into the MESSAGES table.
#a. Insert the numbers 1 to 10, excluding 6 and 8.
#b. Commit before the end of the block.
#c. Select from the MESSAGES table to verify..

create table messages1(n int);
delimiter $$
create procedure ins_num1(in num int)
begin
while num <= 10 do
if (num!=6 and num!=8) then
insert into messages1 values(num);
end if;
set num=num+1;
end while;
end $$

call ins_num1(1);
select * from messages1;

/*Q 2. Create a procedure that computes the commission amount for a given employee based on the employee’s salary. 
a. Use the DEFINE command to provide the employee ID. 
b. If the employee’s salary is less than $5,000, display the bonus amount for the employee as 10% of the salary.
c. If the employee’s salary is between $5,000 and $10,000, display the bonus amount for the employee as 15% of the salary.
d. If the employee’s salary exceeds $10,000, display the bonus amount for the employee as 20% of the salary. 
e. If the employee’s salary is NULL, display the bonus amount for the employee as 0. 
f. Test the procedure for each case using the following test cases, and check each bonus amount.  */

delimiter $$
create procedure commission(in v_empid int)
begin
declare bonus,v_sal int;
select salary into v_sal from employees where employee_id=v_empid;
if v_sal< 5000 then
set bonus = (v_sal*1.10);
elseif v_sal  between 5000 and 10000 then
set bonus = (v_sal*1.15);
elseif v_sal > 10001 then
set bonus = (v_sal*1.20);
else  
set bonus = 0;
end if;
select bonus;
end $$

call commission(146);

/*Q3. Create an EMP table that is a replica of the EMPLOYEES table. Add a new column, STARS, of VARCHAR2 data type 
and length of 50 to the EMP table for storing asterisk (*). */

create table emp (employee_id int primary key, first_name varchar(20), last_name varchar(25), email varchar(100), phone_number varchar(20), hire_date date,job_id int,salary decimal(8,2), manager_id int, department_id int);

insert into emp select * from employees;
alter table emp add stars varchar(50);
select * from emp;
desc emp;

/*Q4. Create a procedure that rewards an employee by appending an asterisk in the STARS column for every $1000 of the employee’s salary.*/

delimiter $$
create procedure asterisk(in v_empid int)
begin
declare v_sal decimal(8,2);
declare x, y int;
declare v_asterisk, p varchar(50);
set y = 1;
set v_asterisk = '';
select salary into v_sal from employees where employee_id = v_empid;
set x = v_sal/1000;
while y <= x do
set v_asterisk = concat(v_asterisk, '*');
set y = y + 1;
end while;
update emp set stars = v_asterisk where  employee_id = v_empid;
end $$
call asterisk(206);
select * from emp;

/* Q5. In a loop, use a cursor to retrieve the department number and the department name from the DEPARTMENTS table for those departments
 whose DEPARTMENT_ID is less than 100. Pass the department number to another cursor to retrieve from the EMPLOYEES table the details of 
 employee last name, job, hire date, and salary of those employees whose EMPLOYEE_ID is less than 120 and who work in that department.*/
 
  /*Q6.Write a cursor to display the name, id, salary and job where salary lies between 10000 and 20000.*/
 
 delimiter $$
 create procedure que06()
 begin
 declare v_empid,v_sal,v_jobid int;
 declare v_fname varchar(40);
 declare finished int default 0;
 declare cur06 cursor for select employee_id,salary,job_id,first_name from employees where salary between 10000 and 20000;
 declare continue handler for not found set finished=1;
 open cur06;
 loop3:loop
 fetch cur06 into v_empid,v_sal,v_jobid,v_fname;
 if finished=1 then
 leave loop3;
 end if ;
 select v_empid,v_sal,v_jobid,v_fname;
 end loop;
 close cur06;
 end $$
 
 call que06();
 
 /*Q7. Write a cursor to display the id,name,location whose location is New York.*/
 
 delimiter $$
 create procedure que07()
 begin
 declare v_empid,v_deptid int;
 declare v_fname,v_city varchar(40);
 declare finished int default 0;
 declare cur07 cursor for select e.employee_id,d.department_id,e.first_name,l.city from employees e inner join departments d on 
 (e.department_id=d.department_id) inner join locations l on (d.location_id=l.location_id) where l.city='London';
 declare continue handler for not found set finished=1;
 open cur07;
 loop07:loop
 fetch cur07 into v_empid,v_deptid,v_fname,v_city;
 if finished=1 then
 leave loop07;
 end if;
 select v_empid,v_deptid,v_fname,v_city;
 end loop;
 close cur07;
 end $$
 
 call que07();
 
 /*Q8. Create an AFTER INSERT trigger on jobs table.*/
/* Instead of putting trigger on main tables emp,jobs and regions i have created new table trigger123 */

create table table1 (name varchar(40),rollno int,address varchar(40),course varchar(40));
desc ;
create table table2 (name varchar(40),clg varchar(40));

insert into emps values('santa',12,'kop','pgdac');
insert into table2 values('sam','jj');

select * from table1;
select * from table2;
create table emps2(name varchar(40), changedate date)
delimiter $$
create trigger trigg1 after insert on table1
for each row
begin 
insert into table2 (name,clg) values('insert',new.name);
end $$

insert into emps values('santa',12,'kop','DABDA');

* Q9. Create BEFORE DELETE trigger on emp table.*/

delimiter $$
create trigger trigg09 before delete on table1
for each row
begin
insert into table2 (name,clg) values('Delete',old.name);
end $$

delete from table1 where name='santa';


/*Q10. Create an BEFORE UPDATE trigger on regions table.*/

delimiter $$
create trigger trigg10 before update on table1
for each row
begin
insert into table2 (name,clg) values('update',new.name);
end $$

update  table1 set name='ram' where name='karan';