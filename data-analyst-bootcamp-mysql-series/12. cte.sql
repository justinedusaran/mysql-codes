-- CTEs

WITH cte_example (Gender, AVG_sal, MAX_sal, MIN_sal, COUNT_sal) AS
(
SELECT gender, AVG(salary) AS avg_sal, 
MAX(salary) AS max_sal, 
MIN(salary) AS min_sal, 
COUNT(salary) AS count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM cte_example
;

SELECT AVG(avg_sal)
FROM (
SELECT gender, AVG(salary) AS avg_sal, 
MAX(salary) AS max_sal, 
MIN(salary) AS min_sal, 
COUNT(salary) AS count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) AS example_subquery
;

WITH cte_example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
cte_example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM cte_example
JOIN cte_example2
	ON cte_example.employee_id = cte_example2.employee_id
;