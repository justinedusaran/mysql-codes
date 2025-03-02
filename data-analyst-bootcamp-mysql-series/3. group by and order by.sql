-- Group By

SELECT *
FROM employee_demographics;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

-- Order By
SELECT *
FROM employee_demographics
ORDER BY first_name
;

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC
;