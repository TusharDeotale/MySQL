use cdac1;
#Q1 Write a procedure to display the even numbers from 2 to 12.

DELIMITER $$
create procedure evenNumber(in n int)
begin
declare str varchar(255);
declare x int;
set str=' ';
set x=2;
while x<=n do
set str=concat(str,x,',');
set x=x+2;
end while;
select str;
end$$
call evenNumber(12);

#Q2.Write a procedure  to Increase the salary of employee 115 based on the following conditions: If experience is more than 10 years, increase salary by 20% If experience is greater than 5 years, increase salary by 10% Otherwise 5%.

delimiter $$
create procedure increment(in empid int)
begin
declare v_sal int;
declare v_updtsal int;
declare v_exp int;
select salary,  (year(curdate())- year(hire_date)) into v_sal, v_exp from employees where employee_id = empid;
if v_exp >= 10 then
set v_updtsal = v_sal*1.20;
elseif v_exp >= 5 then
set v_updtsal = v_sal*1.10;
else
set v_updtsal = v_sal*1.05;
end if;
select v_sal, v_exp, v_updtsal;
end $$
call increment(115);

#Q3. Write a procedure to display the average salary according to the department.
delimiter $$
create procedure avgsal(in deptId int)
begin
declare v_avgsal int;
select avg(salary) into v_avgsal from employees where department_id = deptId;
select v_avgsal;
end$$
call avgsal(3);

#Q4. Find out the name of the employee and name of the department for the employee who is managing for employee 103.
delimiter $$
create procedure emp(in empid int)
begin
declare v_empName varchar(40);
declare v_deptName varchar(40);
select concat(manager.first_name," ",manager.last_name), d.department_name into v_empName, v_deptName from employees manager inner join employees worker on (manager.employee_id = worker.employee_id) inner join departments d on (d.department_id = manager.department_id) where manager.employee_id = (select manager_id from employees where employee_id = empid);
select v_empName, v_deptName;
end $$
call emp(103);

#Q5.Create a function that takes employee ID and return the number of jobs done by the employee in the past.

#Q6. Create a procedure to calculate area of square from side 10 to 15.
create table area_of_square (side int, area int);
drop table area_Of_square;

delimiter $$
create procedure AreaOfSquare(in m int, in n int)
begin
declare side int;
declare ar int;
set side=m;
while side <= n do
set ar = power(side,2);
insert into area_Of_square values (side, ar);
set side = side +1;
end while;
end $$

call AreaOfSquare(10, 15);
select * from area_of_square;

/*Q7. Write a procedure to create the patterns-

*
**
***
****
*****                

*****
****
***
**
*
*/
delimiter $$
create procedure pattern(in n int)
begin
declare x, y, d, c int;
declare a varchar(2);
declare str, e, p, q varchar(5000);
set p = ''; 
set x=1; 
set a = '*';

	while x <= n do
	set str='';
	set y=1;
		while y <= x do
			set str = concat(str,a);
			set y = y + 1;
		end while;
		set p = concat(p, str,'\n');
	set x = x + 1;
	end while;
##################################
set c = 1;
set q = '';
	while c <= n do
	set d = n;
	set e = '';
		while d >= c do
			set e = concat(e,a);
			set d = d - 1;
		end while;
		set q = concat(q, e,'\n');
	set c = c + 1;
	end while;
select concat('\n',p,'\n',q) "¯\_('-')_/¯";
end $$

call pattern(10);
drop procedure pattern;

#Q8. First create messages table.Create a procedure to insert numbers from 1 to 10 show the messages table.
create table messages (Numbers int primary key AUTO_INCREMENT );

delimiter $$
create procedure ins_num(in n int)
begin
declare num int;
set num = 1;
while num <= n do 
insert into messages values (default);
set num = num +1;
end while;
end $$

call ins_num(10);
select * from messages;

#Q9. Create a procedure, NEW_EMP, to insert a new employee into the EMPLOYEES table. The procedure should contain a call to the VALID_DEPTID function to check whether the department ID specified for the new employee exists in the DEPARTMENTS table.
#and
#Q10.a. Create the function VALID_DEPTID to validate a specified department ID. The function should return a BOOLEAN value.
#b. Create the procedure NEW_EMP to add an employee to the EMPLOYEES table. A new row should be added to the EMPLOYEES table if the function returns TRUE. If the function returns FALSE, the procedure should alert the user with an appropriate message. 

delimiter $$
create function VALID_DEPTID (dept_id int)
returns boolean
deterministic
begin
declare finished int default 0;
declare v_deptID int;
declare result boolean;
DECLARE continue HANDLER FOR NOT FOUND SET finished = 1;
select department_id into v_deptID from DEPARTMENTS where department_id = dept_id;
if finished = 1 then
set result = false;
else
set result = true;
end if;
return result;
end $$

select VALID_DEPTID(1);
select * from employees;
desc employees;

delimiter $$
create procedure NEW_EMP (in v_empID int, in v_fName varchar(20), in v_lName varchar(25), in v_email varchar(100), in v_phn varchar(20), in v_hireD date, in v_jbID int, in v_salary decimal(8,2), in v_mgrID int, in dptID int)
begin
if VALID_DEPTID(dptID) = 1 then
insert into employees values (v_empID, v_fName, v_lName, v_email, v_phn, v_hireD, v_jbID, v_salary, v_mgrID, dptID);
else
select "department does not exist";
end if;
end $$

call NEW_EMP (207, "Tushar", "Deotale", "tushardeotale77@gmail.com", "8668354091", '2021-12-25', 6, 70000.00, 100, 13);

#Q11. Create a function to display circumference of the circle with a radius.

delimiter $$
create function circumference(radius int)
returns decimal(10,2)
deterministic
begin
declare result decimal(10,2);
declare pi decimal(10,2);
set pi = 3.14;
set result = 2 * pi * radius;
return result;
end $$

select circumference(4);
drop function circumference;

#Q12. Create a procedure that rewards an employee by appending an asterik in STARS for every 1000 for salary column in employees.

delimiter $$
create procedure reward(in salary int)
begin
declare sal decimal (10,2);
declare result varchar(20);
set sal = salary/1000;
set result = concat(sal,'*');
select result;
end $$

call reward(17000);