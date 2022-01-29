use cdac1;
select * from employees;
select * from jobs;
select * from locations;
#1. Write a query to display the name ( first name and last name ) for those employees who gets more salary than the employee whose ID is 201.
select employee_id, concat(first_name," ", last_name) "name", salary from employees where salary > (select salary from employees where employee_id = 201);

#2. Write a query to display the name ( first name and last name ), salary, department id, job id for those employees who works in the same designation as the employee works whose id is 203.
select concat(first_name,"",last_name) "name", salary, department_id, job_id from employees where job_id = (select job_id from employees where employee_id = 203);

#3.Write a query to display the name ( first name and last name ), salary, department id for those employees who earn such amount of salary which is the smallest salary of any of the departments.
select concat(first_name," ",last_name) "name", salary, department_id from employees where salary = (select min(salary) from employees);

#4. Write a query to display the employee id, employee name (first name and last name ) for all employees who earn more than the average salary. 
select employee_id, concat(first_name," ",last_name) "name", salary from employees where salary > (select avg(salary) from employees);

#5. Write a query to display the employee name ( first name and last name ), employee id and salary of all employees who report to first name 'Neena'.
select concat(first_name," ",last_name) "name", employee_id, salary from employees where manager_id = (select employee_id from employees where concat(first_name, last_name) like '%Neena%');

#6. Write a query to display the department number, name ( first name and last name ), job and department name for all employees in the Finance department.
select e.department_id,concat(e.first_name,e.last_name) name,e.job_id,d.department_name 
from employees e inner join departments d on(e.department_id=d.department_id) where d.department_name='Finance';

#7. Write a query to display all the information of an employee whose salary and reporting person id is 3000 and 121 respectively.
select * from employees where salary = 17000 and employee_id = 101;

#8. Display all the information of an employee whose id is any of the number 134, 159 and 183.
select * from employees where employee_id in (121, 126, 145);

#9.  Write a query to display all the information of the employees whose salary is within the range 1000 and 3000.
select * from employees where salary between 1000 and 3000;

#10. Write a query to display all the information of the employees whose salary is within the range of smallest salary and 2500.
select * from employees where salary <= 2500;

#11. Write a query to display all the information of the employees who does not work in those departments where some employees works whose manager id within the range 100 and 200.
select * from employees where manager_id not between 100 and 200;

#12. Write a query to display all the information for those employees whose salary is same as who earn the second highest salary.
select * from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));

#13. Write a query to display the employee name( first name and last name ) and hiredate for all employees in the same department as Neena. Exclude Neena.
select concat(first_name," ",last_name) "name", hire_date from employees where department_id = (select department_id from employees where concat(first_name,last_name) like '%Neena%') and not concat(first_name,last_name) like '%Neena%';

#14. Write a query to display the employee number and name( first name and last name ) for all employees who work in a department with any employee whose name contains a T.
select employee_id, concat(first_name," ",last_name) "name" from employees where department_id in (select department_id from employees where concat(first_name,last_name) like '%T%');

#15. Write a query to display the employee number, name( first name and last name ), and salary for all employees who earn more than the average salary and who work in a department with any employee with a J in their name.
select employee_id, concat(first_name," ",last_name) "name", salary from employees where salary > (select avg(salary) from employees) and concat(first_name, last_name) like '%j%';

#16. Display the employee name( first name and last name ), employee id, and job title for all employees whose department location is Toronto.
select concat(e.first_name," ",e.last_name), e.employee_id, j.job_title, l.city from employees e inner join jobs j on (e.job_id = j.job_id) inner join departments d on (e.department_id = d.department_id) inner join locations l on (d.location_id = l.location_id) where l.city = 'Toronto';

#17. Write a query to display the employee number, name( first name and last name ) and job title for all employees whose salary is more than any average salary of any department.
select e.employee_id, concat(e.first_name," ",e.last_name) "name", j.job_title from employees e inner join jobs j on (e.job_id = j.job_id) where salary > (select avg(salary) from employees);

#18.Write a query to display the employee name( first name and last name ) and department for all employees for any existence of those employees whose salary is more than 3700.