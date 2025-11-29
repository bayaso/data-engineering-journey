Day 5 – SQL, Python, Azure & ADF Deep Dive Summary 🚀

⭐ 1. SQL Drills

--✔ Joins
SELECT e.name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.id;


-- Aggregation
SELECT d.department_name, COUNT(*) AS number_of_employees
FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY d.department_name
ORDER BY number_of_employees DESC;

--✔ Top N per group (Window Function)

SELECT department_name, name, salary, rank_in_department
FROM (
    SELECT d.department_name, e.name, e.salary,
        DENSE_RANK() OVER(PARTITION BY d.department_name ORDER BY e.salary DESC) AS rank_in_department
    FROM employees e
    JOIN departments d ON e.department_id = d.id
) AS t
WHERE rank_in_department <= 2;

--✔ Debugging window function
-- corrected version
SELECT department_name, name, salary, rn
FROM (
    SELECT d.department_name, e.name, e.salary,
           ROW_NUMBER() OVER(PARTITION BY e.department_id ORDER BY e.salary DESC) AS rn
    FROM employees e
    JOIN departments d ON e.department_id = d.id
) AS t
WHERE rn <= 3;