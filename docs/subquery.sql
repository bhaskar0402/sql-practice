USE employer_database;

#Q1. Find employees whose salary is greater than the average salary of the company
SELECT *
FROM employees
WHERE salary > (
SELECT AVG(salary)
FROM employees
);

#Q2. Find employees earning the highest salary in the company
SELECT *
FROM employees
WHERE salary = ( 
SELECT max(salary)
from employees
);

#Q3. Find employees who work in the same department as 'Aarav Sharma'
SELECT *
FROM employees
WHERE department IN ( 
SELECT department 
FROM employees
WHERE employee_name ="aarav sharma"
);

#Q4. Find employees whose salary is greater than all employees in the Support department
SELECT *
FROM employees
WHERE salary > ( 
SELECT MAX(salary)
FROM employees
WHERE department = "support"
);

#Q5. Find employees working in departments where at least one employee is currently on leave
SELECT *
FROM employees
WHERE department in (
SELECT department
FROM employees
WHERE employment_status = "on leave" )
ORDER BY department;

#Q6. Find employees who have received bonuses
SELECT *
FROM employees e 
LEFT JOIN bonuses b
on b.employee_id = e.employee_id 
WHERE bonus_amount is NOT NULL ;

SELECT *
FROM employees
WHERE employee_id IN (
    SELECT DISTINCT employee_id
    FROM bonuses
);

SELECT *
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM bonuses b
    WHERE b.employee_id = e.employee_id
); 

#Q7. Find employees who never received any bonus
SELECT *
FROM employees e 
WHERE NOT EXISTS ( 
SELECT 1 
FROM bonuses b 
WHERE b.employee_id =  e.employee_id
);

#Q8. Find employees whose salary is greater than the average salary of their own department
SELECT *
FROM employees e
WHERE  salary > ( 
SELECT  AVG(salary) 
FROM employees e1
WHERE e.department = e1.department 
);

#Q9. Find employees who are assigned to at least one project
SELECT *
FROM employees e
WHERE EXISTS ( 
SELECT 1 
FROM employee_projects ep
WHERE e.employee_id = ep.employee_id
);

#Q10. Find employees who earn more than their manager
SELECT *
FROM employees e
LEFT JOIN employees m 
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary ; 






