-------------------------------------------------
--⭐ PART 2 — AGGREGATIONS + GROUP BY
--------------------------------------------------
--10. Group by department with count + avg + min + max
SELECT departments.department_name,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary
FROM employees
JOIN departments ON employees.department_id = departments.id
GROUP BY departments.department_name
ORDER BY average_salary DESC;

--11. Group by + HAVING aggregate filter
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

--------------------------------------------------
⭐ PART 3 — JOINs
--------------------------------------------------
--12. INNER JOIN (employees → departments)
SELECT employees.name, departments.department_name
FROM employees
JOIN departments ON employees.department_id = departments.id;

--13. INNER JOIN + sorting
SELECT employees.name, departments.department_name
FROM employees
JOIN departments ON employees.department_id = departments.id
ORDER BY departments.department_name ASC, employees.name ASC;

--14. LEFT JOIN (keep all employees)
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.id;

--15. LEFT JOIN — find employees with no department
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.id
WHERE departments.department_name IS NULL;

--------------------------------------------------
⭐ PART 4 — SUBQUERIES
--------------------------------------------------
--16. Employees earning above average salary
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--------------------------------------------------
⭐ PART 5 — MULTI-TABLE JOIN
--------------------------------------------------
--17. Employees with department + role
SELECT employees.name,
       departments.department_name,
       roles.role_name
FROM employees
JOIN departments ON employees.department_id = departments.id
JOIN roles ON employees.role_id = roles.id;

🎉 Your SQL summary is complete!

--This includes:
--Day 1 SQL warm-up
--All JOINs
--All aggregations
--HAVING queries
--Subqueries
--Multi-table JOIN
--LEFT JOIN NULL filtering