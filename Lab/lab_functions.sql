use cdac1;
select * from employees;
#1. Write a query to get the job_id and related employee's id.
select job_id, employee_id from employees;

#2. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.
select phone_number, replace(phone_number,substr(phone_number, 1,3),999) from employees;

#3. Write a query to get the details of the employees where the length of the first name greater than or equal to 8.
select first_name from employees where length(first_name) >= 8;

#4. Write a query to display leading zeros before maximum and minimum salary.
select lpad(max(salary),10,'0'), lpad(min(salary),10,'0') from employees;

#5. Write a query to append '@example.com' to email field.
select email, concat(substring_index(email,'@',1), '@example.com') from employees;

#6. Write a query to get the employee id, first name and hire month.
select employee_id, first_name, extract(month from hire_date)"hire_month" from employees;

#7.Write a query to get the employee id, email id (discard the last three characters).
select employee_id, email, substring_index(email,'.',2) from employees;

#8. Write a query to find all employees where first names are in upper case.
select upper(first_name) from employees;

#9.Write a query to extract the last 4 character of phone numbers.
select phone_number, substr(phone_number,-4,4) from employees;

#10. Write a query to get the last word of the street address.
show tables;
select * from locations;
select street_address, substring_index(street_address,' ',-1) from locations;