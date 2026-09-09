use employer_database;

# Example 1
SELECT *,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;

#Example2
SELECT *,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

#Example3
SELECT *,
    LAG(salary)  OVER(ORDER BY employee_id) AS previous_salary,
    LEAD(salary) OVER(ORDER BY employee_id) AS next_salary
FROM employees;

#Q1. Assign a unique row number to each employee based on salary
SELECT * , 
    ROW_NUMBER() OVER( ORDER BY salary ) AS row_num
FROM employees;
#Q2. Rank employees based on salary using RANK()
SELECT * ,
RANK() OVER(order by salary DESC) as ranking
FROM employees;

#Q3. Rank employees based on salary using DENSE_RANK()
SELECT * ,
DENSE_RANK() OVER(order by salary DESC) as ranking
FROM employees;

#Q4. Compare ROW_NUMBER vs RANK vs DENSE_RANK side by side
SELECT * ,
ROW_NUMBER() OVER( ORDER BY salary ) AS row_num,
DENSE_RANK() OVER(order by salary DESC) as dens_rank,
RANK() OVER(order by salary DESC) as ranking 
FROM employees;

#Q5. Find the employee with the 2nd highest salary
SELECT *
FROM employees 
WHERE salary< ( 
SELECT MAX(salary)
FROM employees
)
LIMIT 1 ;

WITH ranked_employees AS (
    SELECT *,
           RANK() OVER(ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE salary_rank = 2;

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT *
FROM (
 SELECT * , 
 RANK() OVER( ORDER BY salary DESC ) as salary_rank
 FROM employees
) as t
WHERE salary_rank = 2 ;

# Q6 Display each employee's rank within their department based on salary

SELECT * ,
RANK() OVER(
PARTITION BY department ORDER BY salary DESC 
) as ranking
FROM employees ; 

#Q7. Find the highest-paid employee from each department
WITH rank_salry_dept as (
SELECT * , 
RANK() OVER( PARTITION BY department ORDER BY salary DESC) as ranking
FROM employees
)

SELECT*
FROM rank_salry_dept
WHERE ranking = 1 ;

SELECT *
FROM ( 
SELECT * , 
RANK() OVER( PARTITION BY department ORDER BY salary DESC) as ranking
FROM employees
) as sal_rank
WHERE ranking = 1 ;

#Q8. Find employees earning more than the previous employee
WITH emp as ( 
SELECT * , 
LAG(salary) OVER( ORDER BY employee_id) as previous_sal
FROM employees
)

SELECT *
FROM emp 
WHERE salary > previous_sal ; 

SELECT *
FROM (
    SELECT *,
        LAG(salary) OVER(ORDER BY employee_id) AS previous_salary
    FROM employees
) t
WHERE salary > previous_salary;

#Q9. Find employees earning less than the next employee
WITH emp as (
SELECT * ,
LEAD(salary) OVER( ORDER BY employee_id ) as next_sal
FROM employees
)

SELECT *
FROM emp
WHERE salary < next_sal ;

#Q10. Display the salary difference between each employee and the previous employee
WITH emp as ( 
SELECT * , 
LEAD(salary) OVER ( ORDER BY employee_id  ) as next_salary
FROM employees
)

SELECT (next_salary - salary) as difference 
FROM emp ;

SELECT *,
    salary - LAG(salary) OVER(ORDER BY employee_id) AS salary_difference
FROM employees;


#Q11. LAG vs LEAD — side-by-side comparison
SELECT *,
    LAG(salary)  OVER(ORDER BY employee_id) AS previous_salary,
    LEAD(salary) OVER(ORDER BY employee_id) AS next_salary
FROM employees;

#Q13. Find departments where multiple employees share the same salary rank

WITH emp as (
SELECT * ,
DENSE_RANK() OVER( PARTITION BY department ORDER BY salary DESC ) as ranking 
FROM employees
WHERE department is NOT NULL
)

SELECT department , COUNT(ranking)
FROM emp
GROUP by department, ranking 
HAVING COUNT(ranking) > 1 ;

#Q14. Display each employee along with the total salary expense of their department

SELECT employee_name, salary , department,
    SUM(salary) OVER(PARTITION BY department) AS total_salary_expense
FROM employees;

#Q15. Display a running total of salaries within each department
SELECT *,
    SUM(salary) OVER(PARTITION BY department ORDER BY employee_id) AS running_total
FROM employees;


#Q16. Find employees earning more than the average salary of their department

WITH EMP AS ( 
SELECT * ,
AVG(salary) OVER( PARTITION BY department ) as avg_salary
FROM employees 
)

SELECT * 
FROM emp
where salary > avg_salary ; 

SELECT * 
FROM ( 
SELECT * , 
avg(salary) OVER( PARTITION BY department) as avg_salary
FROM employees
) as t
WHERE salary > avg_salary ;



