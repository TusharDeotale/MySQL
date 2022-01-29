use cdac1;

#1.Write a query to display the first day of the month (in datetime format) three months before the current month.
select date_format(date_add(last_day(date_sub(sysdate(), interval 4 month)),interval 1 day),'%D-%M-%Y');

#2.Write a query to display the last day of the month (in datetime format) three months before the current month.
select date_format(last_day(date_sub(sysdate(),interval 3 month)),'%D-%M-%Y');

#3.Write a query to get the distinct Mondays from hire_date in employees tables.
select hire_date, dayname(hire_date) from employees where dayname(hire_date)='Monday';

#4.Write a query to get the first day of the current year.
select date_format(concat(year(curdate()),'-01-01'), '%W, %D - %M - %Y');
/*OR*/ select concat(dayname(concat(year(curdate()), '-01-01')),' ', concat(year(curdate()), '-01-01')) "First day of year";

#5.Write a query to get the last day of the current year.
select last_day(sysdate());

#6. Write a query to calculate the age in year.
select round(datediff(curdate(), '1997-04-23')/365,0);
select DATE_FORMAT(FROM_DAYS(DATEDIFF(CURRENT_DATE,'1997-04-23')),'%y year %c month %e day(s)');
select DATEDIFF(CURRENT_DATE,'1997-04-23');
select FROM_DAYS(DATEDIFF(CURRENT_DATE,'1997-04-23'));

#7.Write a query to get the current date in the following format. 
#Sample date : 2014-09-04
#Output : September 4, 2014
select date_format(sysdate(),'%M %d, %Y');

#8.Write a query to get the current date in Thursday September 2014 format.
select date_format(sysdate(),'%W %M %Y');

#9. Write a query to extract the year from the current date.
select extract(year from sysdate());

#10.Write a query to get the DATE value from a given day (number in N). 
#Sample days: 730677
#Output : 2000-07-11
select to_days(sysdate());
select from_days(to_days(sysdate()));

#11. Write a query to get the firstname, lastname who joined in the month of June.
select first_name,last_name, hire_date from employees where extract(month from hire_date) = 6;
select first_name,last_name, hire_date from employees where monthname(hire_date) = 'june';

#12. Write a query to get the years in which more than 10 employees joined.
select year(hire_date), count(employee_id) from employees group by year(hire_date) having count(employee_id)>=10;