use hr_db;
select * from employees
select * from departments

--Write a query to display the last name and hire date of any employee in the same
department as SALES. ----
SELECT last_name, hire_date
FROM employees
WHERE hire_date >= '1994-01-01' AND hire_date < '1995-01-01';

---Create a query to display the employee numbers and last names of all employees who
earn more than the average salary. Sort the results in ascending order of salary. ---

SELECT employee_id, last_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary ASC;

---3. Write a query that displays the employee numbers and last names of all employees who
work in a department with any employee whose last name contains a' u'--

SELECT employee_id, last_name
FROM employees
WHERE department_id IN (
    SELECT DISTINCT department_id
    FROM employees
    WHERE last_name LIKE '%u%'
);

---5. Display the last name and salary of every employee who reports to FILLMORE--

SELECT e.last_name, e.salary
FROM employees e
WHERE e.manager_id = (SELECT last_name FROM employees WHERE last_name = 'Feeney');

--6-Display the department number, last name, and job ID for every employee in the
OPERATIONS department. ---

SELECT e.department_id, e.last_name, e.job_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'IT';


--7-Modify the above query to display the employee numbers, last names, and salaries of all
employees who earn more than the average salary and who work in a department with any
employee with a 'u'in their name. ---

SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
  AND department_id IN (
    SELECT DISTINCT department_id
    FROM employees
    WHERE last_name LIKE '%u%'
  );

  --8-Display the names of all employees whose job title is the same as anyone in the sales dept.--

  SELECT e.first_name, e.last_name
FROM employees e
WHERE e.job_id IN (
    SELECT j.job_id
    FROM jobs j
    WHERE j.job_title = 'Sales Representative'
);

--9-Write a compound query to produce a list of employees showing raise percentages,
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
given a 15% raise, and employees in department 6 are not given a raise. ---

SELECT
    employee_id,
    salary,
    CASE
        WHEN department_id IN (1, 3) THEN salary * 1.05
        WHEN department_id = 2 THEN salary * 1.10
        WHEN department_id IN (4, 5) THEN salary * 1.15
        ELSE salary
    END AS raised_salary
FROM employees;

--10-Write a query to display the top three earners in the EMPLOYEES table. Display their last
names and salaries. ---

SELECT last_name, salary
    FROM employees
    WHERE salary IN(
        SELECT TOP 5 salary
        FROM employees
		GROUP BY salary
        ORDER by salary DESC);

--11- Display the names of all employees with their salary and commission earned. Employees
with a null commission should have O in the commission column---

Select last_name, (salary + IsNull(commission_pct, 0)) as total_salary,commission_pct from employees;

--12-Display the Managers (name) with top three salaries along with their salaries and
department information.---

 SELECT D.department_name AS Department, E.last_name AS Employee, E.Salary AS Salary 
FROM employees E JOIN departments D ON E.department_id = D.department_id
WHERE (SELECT COUNT(DISTINCT(Salary)) FROM Employees 
       WHERE department_id = E.department_id AND Salary > E.Salary) < 3
ORDER by E.department_id, E.Salary DESC;
  

