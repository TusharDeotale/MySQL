use cdac1;
/*1.Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.*/
select * from countries;
select * from locations;
select * from departments;
select * from employees;
select * from jobs;
select l.location_id, l.street_address, l.city, l.state_province, c.country_name 
from locations l inner join countries c on (l.country_id = c.country_id);

/*2. Write a query to find the name (first_name, last name), department ID and name of all the employees.*/
select concat(e.first_name," ", e.last_name) "NAME", e.department_id, d.department_name 
from employees e inner join departments d on(e.department_id = d.department_id);

/*3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.*/
select concat(e.first_name," ",e.last_name) "NAME", j.job_title, d.department_id, l.city 
from employees e inner join departments d on(e.department_id = d.department_id)
inner join jobs j on (e.job_id = j.job_id)  
inner join locations l on (d.location_id = l.location_id) where l.city = 'London';

/*4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name). */
select worker.employee_id, worker.last_name "Worker", worker.manager_id, manager.last_name "Manger" 
from employees worker inner join employees manager on (worker.manager_id = manager.employee_id);

/*5.Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.*/
select concat(first_name," ", last_name) "Name", hire_date from employees 
where hire_date > (select hire_date from employees where concat(first_name, last_name) like '%Greenberg%');

/*6.Write a query to get the department name and number of employees in the department.*/
select d.department_name, count(e.employee_id), d.department_id 
from employees e inner join departments d on (e.department_id = d.department_id) group by d.department_id;

/*7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 9.*/
select e.employee_id, j.job_title, datediff(curdate(), hire_date), e.department_id
from employees e inner join jobs j on (e.job_id = j.job_id) where department_id = 9;

/*8.Write a query to display the department ID and name and first name of manager.*/
select d.department_id, d.department_name, manager.first_name "manager" 
from employees manager inner join employees worker on (manager.employee_id = worker.manager_id) 
inner join departments d on (d.department_id = manager.department_id) group by d.department_id;

/*9.Write a query to display the department name, manager name, and city.*/
select d.department_name, concat(manager.first_name," ",manager.last_name) "Manager Name", l.city 
from employees manager inner join employees worker on (manager.employee_id = worker.manager_id)
inner join departments d on (d.department_id = manager.department_id)
inner join locations l on (l.location_id = d.location_id) group by concat(manager.first_name," ",manager.last_name);

/*10.Write a query to display the job title and average salary of employees.*/
select j.job_id, j.job_title, avg(e.salary) from employees e inner join jobs j on (e.job_id = j.job_id) group by j.job_id;

/*11.Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.*/
select j.job_title, concat(e.first_name," ",e.last_name) "Name", (e.salary - j.min_salary) 
from employees e inner join jobs j on (e.job_id = j.job_id);

/*12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.*/
select e.employee_id, concat(e.first_name," ", e.last_name) "Name", d.department_id, d.department_name, j.job_id, j.job_title, e.salary
from employees e inner join departments d on (e.department_id = d.department_id) 
right outer join jobs j on (e.job_id = j.job_id) where e.salary >= 10000 order by e.employee_id asc;


/*13.Write a query to display department name, name (first_name, last_name), hire date, salary of the manager 
for all managers whose experience is more than 15 years.*/
select d.department_name, concat(manager.first_name," ",manager.last_name) "name", manager.hire_date, manager.salary, year(curdate()) - year(manager.hire_date)
from employees manager inner join employees worker on (manager.employee_id = worker.manager_id)
inner join departments d on (manager.department_id = d.department_id) group by concat(manager.first_name," ",manager.last_name) 
having (year(curdate()) - year(manager.hire_date)) > 15;
