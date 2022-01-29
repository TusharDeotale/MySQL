create database cdac1;
show databases;
use cdac1;
show tables;
desc countries;
select * from countries;
desc departments;
select * from departments;
desc employees;
select * from employees;
desc locations;
select * from locations;
desc jobs;
select * from jobs;
select employee_id,last_name,salary from employees;
select distinct department_id from employees;
select distinct manager_id from employees;
select employee_id,last_name,salary,salary+1000 from employees;
select employee_id,last_name,salary,salary*12 from employees;
select employee_id,last_name,salary,(salary+1000)*12 "INC_ANN_SAL" from employees;
select employee_id,last_name,salary,salary*12 "ANN_SAL" from employees;
select employee_id,last_name,salary,((salary*8)/100) "TAX 8%" from employees;
select employee_id,last_name,salary,manager_id from employees where salary > 10000;
select employee_id,last_name,salary,manager_id from employees where manager_id=103;
select employee_id,last_name,salary,job_id from employees where salary < 10000 and job_id = 9;
select employee_id,last_name,salary,job_id from employees where salary < 10000 or job_id = 9;
select employee_id,last_name,salary from employees where salary between 10000 and 20000;
select * from employees where last_name like 'R%';
select * from employees where last_name like 'R%' or last_name like '%s%';
select * from employees where last_name like '_o%';
select * from employees where last_name like '%a';
select * from employees where department_id in(2,3,4);
select * from employees where department_id in(2,3,4) or salary > 10000;
select * from employees where department_id in(2,3,4) and salary < 10000;
select * from employees where manager_id is null;
select * from employees where manager_id is not null;
select * from employees where salary not between 10000 and 20000;
select * from employees where phone_number is null;
select * from employees where salary between 10000 and 20000 order by salary asc;

/*STRING*/

select * from employees;
select *,lower(last_name),upper(email) from employees;
select *,concat(first_name,' ',last_name,' ','= ',salary) 'name & salary' from employees;
select *,substr(email,1,3) from employees;
select *,substr(email,-3,3) from employees;
select substring_index('https://www.test.com','.',1) from employees;
select *,substring_index(email,'@',1) from employees;
select email,substring_index(email,'@',-1) from employees;
select email,substring_index(email,'@',1) from employees;
select instr('helloworld','d');
select email, instr(email,'a') from employees;
select lpad('helloworld',15,'*'),rpad('helloworld',15,'#');
select phone_number, rpad(phone_number,15,'#') from employees;
select lpad(rpad('hello',10,'*'),15,'*');
select concat(rpad(substr('hello',1,2),5,'*'),substr('hello',-3,3));
select email, length(email) from employees;
select email, length(email) from employees order by length(email) asc;
select email, rpad(email,33,'*') from employees;
select trim('o' from substr('helloworld',1,5));
select concat(trim('o' from substr('helloworld',1,5)),substr('helloworld',-5,5));
select replace('helloworld', 'hello', 'abcd');


select abs(-89);
select ceil(23.67),floor(23.67);
select greatest(123,456,789),least(123,456,789);
select mod(5,3);
select pow(3,2), pi();
select round(125.37,1), truncate(125.37,1);
select round(125.37,-1), truncate(125.37,-1);
select round(125.37,-2), truncate(125.37,-2);
select round(155.37,-2), truncate(155.37,-2);

/*DATE*/

select sysdate(), now();
select current_date(), curdate(), current_time(), curtime(), current_timestamp(),current_user();
select datediff(curdate(),'2021-11-30');
select hire_date, datediff(curdate(),hire_date) from employees;
select datediff(curdate(), '1997-04-23')/365;
select round(datediff(curdate(), '1997-04-23')/365,1);
select date_add('2021-12-01', interval 30 day);
select date_sub('2021-12-01', interval 30 day);
select date_sub('2021-12-01', interval 6 month);
select date_format('2021-09-21', '%D %M %Y');
select date_format('2021-09-21', '%D %b %Y');
select date_format(sysdate(), '%D %M %Y %h %i %s');
select hire_date, date_format(hire_date, '%D-%b-%Y') from employees;
select dayname(sysdate());
select hire_date, dayname(hire_date) from employees order by hire_date asc;
select dayofweek(sysdate());
select hire_date, dayofweek(hire_date) from employees;
select extract(month from sysdate());
select extract(year from sysdate());
select extract(day from sysdate());
select hire_date, extract(month from hire_date) from employees;
select last_day(sysdate());
select last_day('2020-02-1');
select week(sysdate()),weekday(sysdate()),year(sysdate());
select to_days('2021-11-8');
select to_days(curdate());
select from_days(738497);

/*IS NULL*/

select *, isnull(manager_id) from employees;
select nullif(15,15);
select length(first_name),length(last_name), nullif(length(first_name), length(last_name)) from employees;
select coalesce(null,null,123); /* return firsr not null values*/
select *, coalesce(manager_id, phone_number) from employees;

/*GROUP FUNCTIONS*/

select max(salary), min(salary), max(hire_date), min(hire_date), max(last_name), min(last_name) from employees;
select lpad(max(salary),10,'0'), lpad(min(salary),10,'0') from employees;

/*GROUP BY FUNCTION*/

select department_id, salary from employees order by department_id asc; /* for referance*/
select department_id, avg(salary) from employees group by department_id;
select department_id, sum(salary) from employees group by department_id;
select department_id, avg(salary) from employees where department_id != 4 group by department_id; /* for not equal to we can use <> */
select job_id, avg(salary) from employees where job_id in(6,7) group by job_id;
select manager_id ,sum(salary) from employees where manager_id is not null group by manager_id having sum(salary) > 10000 ;

/*COUNT*/

select count(*) from employees;
select department_id, count(employee_id) from employees group by department_id;
select department_id, count(distinct employee_id) from employees group by department_id;
select year(hire_date), count(employee_id) from employees group by year(hire_date) having count(employee_id) >= 10;

/*SUBQUERY*/

select last_name, salary from employees where salary > (select salary from employees where  last_name='kochhar');
select last_name, department_id, job_id from employees where job_id = (select job_id from employees where last_name='Ernst');
select job_id from employees where last_name='Ernst';
select employee_id, last_name, department_id, salary from employees where salary = (select min(salary) from employees);
select employee_id, last_name, department_id, salary from employees where salary = (select max(salary) from employees);
select employee_id, last_name, salary, department_id from employees where department_id in(select distinct department_id from employees);
select employee_id, last_name, salary from employees where salary in(select salary from employees where job_id=6);
select employee_id, last_name, job_id, salary from employees where salary >any(select salary from employees where job_id=6);
select salary, job_id from employees where job_id=6;

/*Second Highest Salary*/

select * from employees 
where salary =(select max(salary) from employees where salary <(select max(salary) from employees));
select * from employees where 
salary = (select distinct salary from employees order by salary desc limit 1,1);

/*JOINS*/

select employees.employee_id,employees.last_name,employees.department_id,departments.department_id,departments.department_name 
from employees,departments;
/*OR*/
select employees.employee_id,employees.last_name,employees.salary,departments.department_id,departments.department_name
from employees CROSS JOIN departments;

/*Write a query to display the employee number,name,salary,department number and department name of all employees.*/
select e.employee_id,e.last_name,e.salary,e.department_id,d.department_id,d.department_name 
from employees e INNER JOIN departments d on (e.department_id=d.department_id);

/*Write a query to display the employee number,name,salary,department name and city of all employees.*/
select e.employee_id,e.last_name,e.salary,d.department_id,d.department_name,l.city 
from employees e INNER JOIN departments d on(e.department_id=d.department_id)
INNER JOIN locations l on(d.location_id=l.location_id);

/*OUTER JOIN (LEFT AND RIGHT OUTER JOIN)*/
/*Write a query to display employee number,name,salary,department name of all those employees who have not been assigned any department.*/
select e.employee_id,e.last_name,e.salary,e.department_id,d.department_id,d.department_name 
from employees e LEFT OUTER JOIN departments d on (e.department_id=d.department_id);

/*Write a query to display employee number,name,salary,department name of all the employees also those departments who have no employees.*/
select e.employee_id,e.last_name,e.salary,e.department_id,d.department_id,d.department_name 
from employees e RIGHT OUTER JOIN departments d on (e.department_id=d.department_id);

/*SELF JOIN*/
/*Write a query to display the names of the persons who are working for their managers.*/
select concat(worker.last_name,'works for',manager.last_name),worker.manager_id,manager.employee_id 
from employees worker inner join employees manager on(worker.manager_id=manager.employee_id);

/*6.  Write a query to display the department number, name ( first name and last name ), job and department name for all employees in the Finance department. */
select e.department_id,concat(e.first_name,e.last_name) name,e.job_id,d.department_name 
from employees e inner join departments d on(e.department_id=d.department_id) where d.department_name='Finance';

/* 10 assignment Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.*/
select manager.last_name,manager.salary,d.department_name,(year(curdate())-year(manager.hire_date)) 
from employees worker inner join employees manager on(worker.manager_id=manager.employee_id) 
inner join departments d on(manager.department_id=d.department_id)
where (year(curdate())-year(manager.hire_date)) > 30;

select concat(first_name,last_name),year(curdate())-year(hire_date) from employees where year(curdate())-year(hire_date)>30;