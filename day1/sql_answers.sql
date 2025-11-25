--1. Select all
SELECT * 
FROM employees;

--2. Select specific columns
SELECT name, salary
FROM employees;

--3. Filter department
SELECT name
FROM employees
WHERE department = 'Finance';

--4. Filter salary > 5000
SELECT name
FROM employees
WHERE salary > 5000;

--5. Filter + Order by salary DESC
SELECT name
FROM employees
WHERE department = 'Finance'
ORDER BY salary DESC;

--6. Salary >= 5000 + Order by name ASC
SELECT name, department, salary
FROM employees
WHERE salary >= 5000
ORDER BY name ASC;

--7. Names starting with M
SELECT name, salary
FROM employees 
WHERE name LIKE 'M%'
ORDER BY salary ASC;

--8. Marketing/Sales + salary > 4500
SELECT name, department, salary
FROM employees 
WHERE (department = 'Marketing' OR department = 'Sales') 
  AND salary > 4500
ORDER BY salary DESC;

--9. IN + BETWEEN
SELECT name, department
FROM employees 
WHERE department IN ('Finance', 'Marketing') 
  AND salary BETWEEN 4800 AND 5500
ORDER BY department ASC, salary DESC;

--10. Aggregations by department and join
SELECT departments.department_name,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary
FROM employees
JOIN departments ON employees.department_id = departments.id 
GROUP BY departments.department_name
ORDER BY average_salary DESC;

--11. Aggregations with HAVING
SELECT departments.department_name,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary
FROM employees
JOIN departments ON employees.department_id = departments.id 
GROUP BY departments.department_name
HAVING AVG(salary) > 5000
ORDER BY average_salary DESC;

--12. LEFT JOIN all employees
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments 
       ON employees.department_id = departments.id
ORDER BY employees.name ASC;

--13. LEFT JOIN unmatched rows
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments 
       ON employees.department_id = departments.id
WHERE departments.department_name IS NULL;

--14. Subquery: salary above average
SELECT name, salary
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);