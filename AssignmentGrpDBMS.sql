use cdac1;
/*Write a query to display the first day of the month three months before the current month.*/
select date_add(last_day(date_sub(curdate(), interval 4 month)),interval 1 day); /*1*/

/*Write a query to display the last day of the month three months before the current month.*/
select last_day(date_sub(curdate(), interval 3 month));/*2*/

/*Write a query to get the distinct Mondays from hire_date in employees tables.*/
select hire_date, dayname(hire_date) from employees where dayname(hire_date) = 'Monday';/*3*/

/*Write a query to get the first day of the current year.*/
select date_format(date_add(last_day(date_sub(curdate(), interval 1 year)), interval 1 day), '%W %D %M %Y');/*4*/
select date_format(concat(year(sysdate()), '-01-01'), '%W, %D-%M-%Y');/*4*/

/*Write a query to calculate the age in year.*/
select date_format(from_days(datediff(curdate(), '1997-04-23')),'%y year %m month %d days');/*5*/

/*Write a query to get the current date in the following format
Sample date : 2014-09-04
Output : September 4, 2014
DATE_FORMAT(date,’%M %d “,” %Y)*/
select date_format(curdate(), '%M %D,%Y');/*6*/

/*Write a query to get the DATE value from a given day (number in N).
FROM_DAYS(730677)*/
select from_days(730677);/*7*/

/*Write a query to get the firstname, lastname who joined in the month of June.*/
select first_name, last_name from employees where monthname(hire_date) = 'June';/*8*/

/*Write a query to get the years in which more than 10 employees joined.*/
select year(hire_date), count(employee_id) from employees group by year(hire_date) having count(employee_id) >= 10;/*9*/

/*Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.*/
select d.department_name, manager.last_name, manager.salary, manager.hire_date,year(curdate()) - year(manager.hire_date)
from employees worker inner join employees manager on(worker.manager_id=manager.employee_id)  inner join departments d on(manager.department_id = d.department_id) 
where (year(curdate()) - year(manager.hire_date)) > 30 group by manager.last_name;/*10*/

/*11. Write a query to get employee ID, last name, and date of first salary of the employees.*/
select employee_id, last_name, hire_date, date_add(hire_date, interval 1 month) "salry_date" from employees;

/*Write a query to get first name, hire date and experience of the employees.*/
select first_name, hire_date, date_format(from_days(datediff(curdate(), hire_date)),'%y year %m month %d days') "Experience" from employees;/*12*/

/*Write a query to list the number of jobs available in the employees table.*/
select count(distinct job_id) from employees;/*13*/

/*Write a query to get the maximum salary of an employee working as a Programmer.*/
select e.last_name,max(e.salary),j.job_title from employees e inner join jobs j on(e.job_id=j.job_id) 
where j.job_title = 'Programmer';/*14*/

/*Write a query to get the average salary and number of employees working the department 90.*/
select avg(salary), count(employee_id), department_id from employees where department_id = 9; /*15*/

/*Write a query to get the number of employees with the same job.*/
select count(employee_id), job_id from employees group by job_id;/*16*/

/*Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.*/
select manager_id, last_name, salary from employees where salary in(select min(salary) from employees); /*17*/

/*Write a query to get the average salary for each job ID excluding programmer.*/
select  j.job_title, avg(e.salary), j.job_id from employees e inner join jobs j on(e.job_id=j.job_id) 
where j.job_title != 'Programmer' group by job_id; /*18*/

/*Write a query to get the job ID and maximum salary of the employees where maximum salary is
greater than or equal to $4000.*/
select job_id, max(salary) from employees group by job_id having max(salary) >=4000; /*19*/

/*Write a query to get the average salary for all departments employing more than 10 employees.*/
select avg(salary),count(employee_id) count,department_id from employees group by department_id having count(employee_id)>=5 order by count asc; /*20*/