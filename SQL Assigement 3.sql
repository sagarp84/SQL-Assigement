use hr_db;
select * from employees
select * from departments

---1-Write a query that displays the employee's last names only from the string's 2-5th
position with the first letter capitalized and all other letters lowercase, Give each column an
appropriate label. ----
SELECT CONCAT(Upper(SUBSTRING(last_name, 2, 1)), Lower(SUBSTRING(last_name, 3, 4))) AS "Employee Last Name"
FROM employees
ORDER BY last_name;

---2-Write a query that displays the employee's first name and last name along with a " in
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
month on which the employee has joined.---

SELECT CONCAT(first_name, '-', last_name) AS full_name,
       MONTH(hire_date) AS join_month
FROM employees;

----3-Write a query to display the employee's last name and if half of the salary is greater than
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
1500 each. Provide each column an appropriate label. ---

SELECT last_name AS "Employee Last Name",
    CASE WHEN salary / 2 > 10000 THEN ROUND(salary * 1.10 + 1500, 2)
        ELSE ROUND(salary * 1.115 + 1500, 2)
    END AS "Updated Salary"
FROM employees;

---.4- Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
department id, salary and the manager name all in Upper case, if the Manager name
consists of 'z' replace it with '$!'----


SELECT CONCAT(SUBSTRING(employees_id, 1, 2), '00E') AS Employee_ID,
    Department_id_ AS Department_ID,
    salary AS Salary,
    REPLACE(UPPER(mgr_name), 'Z', '$') AS Manager_Name
FROM employees;

---5-Write a query that displays the employee's last names with the first letter capitalized and
all other letters lowercase, and the length of the names, for all employees whose name
starts with J, A, or M. Give each column an appropriate label. Sort the results by the
employees' last names '----
SELECT  CONCAT(UPPER(SUBSTRING(last_name, 1,1)), LOWER(SUBSTRING(last_name, 2,len(last_name)-1))) AS "Employee Last Name"
FROM employees
 WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;
---6-Create a query to display the last name and salary for all employees. Format the salary to
be 15 characters long, left-padded with $. Label the column SALARY----

SELECT last_name, 
Right('$'+replicate('0',15-len(cast(salary as varchar))),15)  AS SALARY
FROM employees;
----7-Display the employee's name if it is a palindrome----
select first_name from employees
where first_name=reverse(first_name)




---8-Display First names of all employees with initcaps.---
SELECT upper(first_name) AS "First Name"
FROM employees;

----9- From LOCATIONS table, extract the word between first and second space from the
STREET ADDRESS column. -----
 select * from locations;
 SELECT CHARINDEX(CHARINDEX(street_addrees, ' ', 2), ' ', -1) AS Word
FROM locations;
 SELECT CHARINDEX(' ',street_address)
 substring(street_address,CHARINDEX(' ',street_address)+1,len(street_address)- CHARINDEX(' ',street_address))

 -----10-Extract first letter from First Name column and append it with the Last Name. Also add
"@systechusa.com" at the end. Name the column as e-mail address. All characters should
be in lower case. Display this along with their First Name.---

SELECT CONCAT(LOWER(LEFT(first_name, 1)), last_name, '@systechusa.com') AS 'e-mail address',First_name
FROM employees;
 ---11-Display the names and job titles of all employees with the same job as Trenna. --
select * from jobs
SELECT CONCAT(first_name, '-', last_name) AS Names,j. job_title
FROM employees E
join employees s
on e.job_id= j.job_id
AND S.job_n = 'Roma';

---12-Display the names and department name of all employees working in the same city as trenna---
select * from locations

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
JOIN departments  ON employees.department_id = departments.department_id 
WHERE employees.department_id IN (
    SELECT departments.department_id
    FROM departments
    JOIN locations
	on departments.location_id=locations.location_id
	where locations.city ='Tokyo')


 ---13-Display the name of the employee whose salary is the lowe---
 select CONCAT(first_name,' ',last_name)as employees_name ,salary from employees
where salary=(select min(salary) from employees);

----14--Display the names of all employees except the lowest paid.---
 select CONCAT(first_name,' ',last_name)as employees_name ,salary from employees
where salary>(select min(salary) from employees);

















