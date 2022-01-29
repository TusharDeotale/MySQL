#Q1. Create a view to  display the first day of the month (in datetime format) three months before the current month.
use cdac1;
create or replace view vu_first_day as select date_format(date_add(last_day(date_sub(curdate(), interval 4 month)), interval 1 day),'%D-%M-%Y');
desc vu_first_day;
select * from vu_first_day;

#Q2. Create a view  to get the years in which more than 10 employees joined.
create or replace view vu_joined_emp as select year(hire_date), count(employee_id) from employees group by year(hire_date) having count(employee_id)>= 10;
select * from vu_joined_emp;
select * from employees;
show tables;
#Q3. Create a view that displays last name,salary,department,job,phone number of all employees whose department is 6. Apply changes in table with the view.
create or replace view vu_emp_info as select last_name, salary, department_id, job_id, phone_number from employees where department_id = 6;
desc vu_emp_info;
select * from vu_emp_info;
update vu_emp_info set salary = 11000 where job_id = 9;

#Q4. Create a view  to get the maximum salary of an employee working as a Programmer.Also display the view information.
create or replace view vu_mx_sal_prg as select max(e.salary), j.job_title from employees e inner join jobs j on (e.job_id= j.job_id) where j.job_title = 'Programmer';
desc vu_mx_sal_prg;
select * from vu_mx_sal_prg;
use information_schema;
show tables;
desc views;
select * from views;

#Q5. Create a view to display the employee id, employee name (first name and last name ) for all employees who earn more than the average salary.
create or replace view vu_sal_avgmr as select employee_id, concat(first_name," ",last_name) "Eployee Name", salary from employees where salary > (select avg(salary) from employees);
select * from vu_sal_avgmr;

#Q6. Create a view to display the department name, manager name, and city.
create or replace view vu_emp_dtls as select d.department_name, manager.last_name, l.city from employees manager inner join employees worker on (manager.employee_id = worker.manager_id) inner join departments d on (manager.department_id = d.department_id) inner join locations l on (d.location_id = l.location_id) group by manager.last_name;
select * from vu_emp_dtls;

#Q7. Create a table named as CUSTOMER with the fields as ID,FNAME,LNAME,EMAIL,PHONENUMBER,CONTACT.Apply primary key on id and specify AUTOINCREMENT. Apply appropiate constraints.
create table CUSTOMER (ID INT PRIMARY KEY AUTO_INCREMENT, F_NAME VARCHAR(40) NOT NULL, L_NAME VARCHAR(40)NOT NULL, EMAIL VARCHAR(40), PHONE_NUMBER VARCHAR(20) NOT NULL, CONTACT VARCHAR(40) NOT NULL);
desc customer;

#Q8.The following are the tables.Create them with appropiate constraints,autoincrement and index.
#creating table -- COURSES.
create table courses (ID int primary key auto_increment, Name varchar(40), deptId int);
desc courses;
#INSERTING VALUES TO THE TABLE COURSES.
insert into courses values (default, '111', 1),(default, '112', 1),(default, '250', 1),(default, '231', 1),(default, '111', 2),(default, '250', 3),(default, '111', 4);
select * from courses;
#ADDING CONSTRAINT TO DEPTID.
alter table courses add constraint fk_d foreign key(deptId) references dept(ID);

#CREATING TABLE DEPT
create table dept (ID int primary key auto_increment, Name varchar(20) not null);
desc dept;
#INSERTING VALUES TO THE TABLE DEPT
insert into dept values (default, 'CSC'), (default, 'MTH'), (default, 'EGR'), (default, 'CHM');
select * from dept;

#CREATING TABLE ENROLLMENT.
create table Enrollment (ID int primary key auto_increment, count int);
desc enrollment;

#INSERTING VALUES TO THE TABLE ENROLLMENT.
insert into enrollment values (default, 40), (default, 15), (default, 10), (default, 12), (default, 60), (default, 14), (default, 200);
select * from enrollment;
desc employees;


#Q9. Create the tables with the follwing names and columns and appropiate datatypes and constraints.
create table salesman (salesman_id int primary key, name varchar(20), city varchar(20), commission decimal(8,2));
desc salesman;

create table customer2 (customer_id int primary key, cust_name varchar(20), city varchar(20), grade varchar(2), salesman_id int, constraint fk_c foreign key(salesman_id) references salesman (salesman_id));
desc customer2;

create table orders (ord_no int primary key, purch_amt int not null, ord_date date not null, customer_id int, salesman_id int, constraint fk_cc foreign key(customer_id) references customer2(customer_id), constraint fk_s foreign key(salesman_id) references salesman(salesman_id));
desc orders;

#Q10. Apply index on the tables of Q9.
#CREATING INDEX ON TABLE SALESMAN.
show index from salesman;
create index name_idx on salesman(name);
create index city_idx on salesman(city);

#CREATING INDEX ON TABLE CUSTOMER.
show index from customer2;
create index cust_name_idx on customer2(cust_name);
create index city_idx on customer2(city);

#CREATING INDEX ON TABLE ORDERS.
show index from orders;
create index purch_amt_idx on orders(purch_amt);
create index ord_date_idx on orders(ord_date);