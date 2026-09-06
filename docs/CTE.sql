USE employer_database;

#Q1. Using a CTE, find departments having more than 5 employees.

WITH emp as ( 
SELECT department , COUNT(*) as total_emp
FROM employees 
GROUP BY department
)
SELECT * 
FROM emp 
WHERE total_emp > 5;


SELECT department
FROM employees
GROUP BY department 
HAVING COUNT(*) > 5 ; 

#Q2. Using Multiple CTEs, find departments whose average salary is greater than the company average salary.

WITH emp1 as ( 
SELECT AVG(salary) as avg_salary
FROM employees
),
emp2 as (
select department , avg(salary) as dep_salary
from employees
group by department
)
select department 
from emp1 , emp2
where dep_salary > avg_salary ;


WITH emp as (

SELECT * ,
avg(salary) over() as avg_salary,
avg(salary) over( PARTITION BY department) as dep_salary
FROM employees
)

SELECT DISTINCT department 
FROM emp 
WHERE dep_salary > avg_salary ;

#Q3. Using a CTE, find employees who have received more than one bonus.

SELECT * 
FROM bonuses;

SELECT employee_id
FROM bonuses 
GROUP BY employee_id 
HAVING COUNT(*)>1;

WITH temp as ( 
SELECT employee_id , COUNT(*) as no_bonus
FROM bonuses
GROUP by employee_id    
)
SELECT *
FROM temp
WHERE no_bonus > 1;

#Q4. Using a CTE, find the top 2 highest-paid employees from each department.
WITH emp as ( 
SELECT * , 
RANK() OVER( PARTITION BY department ORDER BY salary DESC ) as ranking
FROM employees
WHERE department is NOT NULL 
)

SELECT *
FROM emp 
WHERE ranking <3 ; 

#Q5. Using Multiple CTEs, find employees whose salary is greater than the average salary of their department, 
# and display their department rank.

WITH emp as (
SELECT * , 
RANK() OVER( PARTITION BY department ORDER BY salary ) as ranking ,
avg(salary) OVER ( PARTITION BY department ) as avg_salary
FROM employees
)

SELECT *
FROM emp 
WHERE salary > avg_salary ;






