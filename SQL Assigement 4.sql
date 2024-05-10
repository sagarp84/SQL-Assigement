use hr_db
select * from employees
--1-Write a query to display the last name, department number, department name for all employee_---
SELECT E.last_name, E.department_id, D.department_name
FROM employees E
JOIN departments D ON E.department_id = D.department_id;

---2-Create a unique list of all jobs that are in department 4. Include the location of the department in the output.--
SELECT DISTINCT job_id, street_address
	FROM employees, departments,locations
	WHERE employees.department_id = departments.department_id
	AND employees.department_id = 4;

--3-Write a query to display the employee last name,department name,location id and city of
all employees who earn commission---

SELECT e.last_name, d.department_name, l.location_id, l.city
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;

--4-Display the employee last name and department name of all employees who have an 'a'
in their last name -----
SELECT e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.last_name LIKE '%a%'
ORDER BY e.last_name;

--5-Write a query to display the last name,job,department number and department name for
all employees who work in ATLANTA. -

SELECT e.last_name, e.job_id, d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.location_id = (SELECT location_id FROM locations WHERE city = 'ATLANTA');

--6-Display the employee last name and employee number along with their manager's last
name and manager number---
SELECT e.last_name AS Employee,
       e.employee_id AS Emp#,
       m.last_name AS Manager,
       m.employee_id AS Mgr#
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

--7-Display the employee last name and employee number along with their manager's last
name and manager number (including the employees who have no manager).---
SELECT e.last_name AS Employee,
       e.employee_id AS Emp#,
       m.last_name AS Manager,
       m.employee_id AS Mgr#
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

--8-Create a query that displays employees last name,department number,and all the
employees who work in the same department as a given employee.---

SELECT E.last_name, E.department_id, D.department_name
FROM employees E, departments D
WHERE E.department_id = D.department_id;

--9-Create a query that displays the name,job,department name,salary,grade for all
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) --

SELECT e.first_name, e.last_name, d.department_name, e.salary,
       CASE
           WHEN e.salary >= 50000 THEN 'A'
           WHEN e.salary >= 30000 THEN 'B'
           ELSE 'C'
       END AS grade
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

--10--Display the names and hire date for all employees who were hired before their
managers along withe their manager names and hire date. Label the columns as Employee
name, emp_hire_date,manager name,man_hire_date---

SELECT e.first_name AS "Employee name",
       e.hire_date AS "emp_hire_date",
       m.first_name AS "Manager name",
       m.hire_date AS "man_hire_date"
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;












