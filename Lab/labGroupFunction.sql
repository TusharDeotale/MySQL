use cdac1;
select max(salary) "maximum", min(salary) "minimum", sum(salary) "sum", avg(salary) "salary" from employees;
desc employees;
select job_id, max(salary), min(salary), avg(salary) from employees group by job_id;
select salary, count(employee_id) from employees group by salary;
select count(manager_id) "Number of Managers" from employees;
select (max(salary) - min(salary)) "Difference" from employees;
select job_id, min(salary) from employees group by job_id having min(salary)>10000;
/*select department_id, last_name, hire_date from employees group by department_id;*/
/*select job_id, count(employee_id), last_name from employees group by job_id having avg(salary)*/
select employee_id, last_name from employees where last_name like '%u%';
select avg(salary),count(employee_id) from employees where department_id=9 group by department_id;
select department_id from employees;
select last_name,employee_id from employees where department_id in(select department_id from employees where last_name like '%u%'); /*inner function sub query*/
select last_name, hire_date, department_id from employees where department_id in(select distinct department_id from employees );
select employee_id, last_name, salary from employees where salary > (select avg(salary) from employees) order by salary asc;