use hr_db
select * from employees

---1 Display the maximum, minimum and average salary and commission earned. ---
select max(salary) as MAX_Salary,
       min(salary) as MIN_Salary,
	   avg(salary) as AVG_Salary,
	   max(commission_pct) as MAX_Commission,
	   min(commission_pct) as MIN_Commission,
	   Avg(commission_pct) as AVG_Commission
	   from employees;

---2Display the department number, total salary payout and total commission payout for each department. ---
select department_id,sum(salary) as Total_salary_payout,sum(commission_pct)as Total_commission_payout from employees
group by department_id;

---3 Display the department number and number of employees in each department. ---
	 select department_id as deparment_number,count(employee_id) as Employees from employees
	 group by department_id;

----4Display the department number and total salary of employees in each department. ---
 select department_id as deparment_numbe,sum(salary)as Total_salary from employees
 group by department_id;

 ----5Display the employee's name who doesn't earn a commission. Order the result set without using the column name ---
select CONCAT(first_name,' ',last_name)as employees_name from employees
where commission_pct is null
order by 1;

----6 Display the employees name, department id and commission. If an Employee doesn't
earn the commission, then display as 'No commission'. Name the columns appropriately----select CONCAT(first_name,' ',last_name)as employees_name,department_id,ISNULL(null,'No Commission') as commission from employees;---7Display the employee's name, salary and commission multiplied by 2. If an Employee
doesn't earn the commission, then display as 'No commission. Name the columns
appropriately-----select CONCAT(first_name,' ',last_name)as employees_name,salary,(commission_pct*2),ISNULL(null,'No Commission') as commission from employees;----8Display the employee's name, department id who have the first name same as another employee in the same department----
select employees.first_name,employees.last_name,departments.department_id
from employees
inner join departments
on employees.department_id=departments.department_id;

----9-Display the sum of salaries of the employees working under each Manager----
select manager_id,sum(salary) as Total_salary from employees
group by manager_id;

----10-Select the Managers name, the count of employees working under and the department ID of the manager.----
select manager_id,count(employee_id) as employee_working,department_id from employees
group by manager_id,department_id;
----11 Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a! ----
select CONCAT(first_name,' ',last_name)as employees_name,salary,department_id,manager_id as manager_name from employees
where SUBSTRING(last_name,2,1)='a'
order by manager_name;

---12Display the average of sum of the salaries and group the result with the department id.Order the result with the department id. ---
SELECT department_id,avg(sum_salary) As average_salary
from(
     select department_id,sum(salary) As sum_salary
	 from employees
	 group by department_id
	 ) summed_salaries
	 group by department_id
	 order by department_id;

---13-Select the maximum salary of each department along with the department id---
SELECT department_id,max(salary) As max_salary
from employees
group by department_id;

----14- Display the commission, if not null display 10% of salary, if null display a default value 1---
select commission_pct,isnull(null,1) as commission,(salary*0.1)as adjust_commission from employees;










