use employer_database;

SELECT *
from employees;

#Aggregate Functions + GROUP BY + HAVING
#Q1: Find the total number of employees in the company.
SELECT count(*)
from employees;

#Q2: Find how many employees have a manager assigned.
SELECT COUNT(*)
from employees
where manager_id is NOT NULL;

SELECT COUNT(manager_id) FROM employees;

#Q4: Find the total salary expense of the company.
SELECT sum(salary) as total_expense
FROM employees;

#Q5: Find the average salary of employees.
SELECT AVG(salary) as avg_salary
FROM employees;

#Q6: Find the highest and lowest salary in the company.
SELECT MAX(salary) as highest , MIN(salary) AS lowest
FROM employees;

#Q7: Find the total number of employees in each department.
SELECT department , count(*) as totat_employees
FROM employees
GROUP BY department ;

#Q8: Find the average salary of employees in each city.
SELECT city ,avg(salary) AS avg_salary
FROM employees
GROUP by city;

#Q9: Find the total number of Active employees in each department.
SELECT department ,count(*) as active_employees
FROM employees
WHERE employment_status = "active"
GROUP by department ;

#Q10: Find the total salary expense of employees working in Mumbai for each department.
SELECT department, sum(salary) as total_expense
from employees
where city = "mumbai"
GROUP BY department;

#Q11: Find departments having more than 5 employees.
SELECT department , count(*) as total_employee
from employees
GROUP by department
HAVING COUNT(*) > 5;

#Q12: Find cities whose average salary is greater than ₹70,000.
SELECT city , avg(salary)
FROM employees
group by city
having avg(salary) > 70000;

#Q13: Find departments whose average salary lies between ₹60,000 and ₹80,000.
SELECT department , AVG(salary)
from employees
group by department 
having AVG(salary) BETWEEN 60000 and 80000 ;

#Q14: Find departments having at least 4 employees who are currently Active.
SELECT department , count(*)
from employees 
WHERE employment_status = "active"
GROUP by department 
HAVING count(*) >=4 ; 

#Q15: Find Duplicate Records By Email
SELECT email , count(*) 
From employees
GROUP by email
HAVING COUNT(*) > 1 ; 







