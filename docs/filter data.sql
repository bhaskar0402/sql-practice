USE employer_database ; 

#Q1 — Retrieve all employee details
SELECT * 
FROM employees;

#Q2 — Retrieve name, department, and salary only
SELECT employee_name , department , salary
from employees;

#Q3 — Find all unique departments
SELECT DISTINCT department 
from employees
WHERE department is not NULL;

#Q4 — Employees in the IT department
SELECT *
from employees
where department = "IT";

#Q5 — Employees earning more than ₹80,000
SELECT *
from employees
where salary>80000;

#Q7 — Employees in IT or Finance
SELECT *
from employees 
where department = "IT" OR department ="finance";

#Q8 — Employees who are NOT Active
SELECT *
from employees
where employment_status != "active" ;

#Q9 — Employees in IT, HR, or Finance
SELECT *
from employees 
where department = "IT" OR department ="finance" OR department ="hr";

SELECT *
from employees 
where department IN ("IT" , "finance" ,"hr") ;

#Q10 — Employees with salary between ₹50,000 and ₹80,000
SELECT *
FROM employees
where salary >=50000 and salary<=80000 ;

#Q11 — Employees whose name starts with 'A'
SELECT *
from employees 
where employee_name LIKE "A%" ;

#Q12 — Employees with a Gmail address
SELECT *
from employees
where email like "%gmail.com" ;

#Q13 — Active employees whose name starts with 'S'
SELECT *
from employees 
where employment_status = "active" and employee_name LIKE "s%";

#NULL CHECK
#Q14 — Employees with no manager assigned
SELECT *
from employees 
where manager_id is NULL ;

#Q15 — Employees with an email on record
SELECT *
from employees
where email is NOT NULL ;

#Q16 — Sort by salary (lowest to highest)
SELECT *
from employees
WHERE salary is NOT NULL
ORDER BY salary ;

#Q17 — Sort by salary (highest to lowest)
SELECT *
from employees
WHERE salary is NOT NULL
ORDER BY salary DESC;

#Q18 — Sort by department, then salary descending
SELECT *
FROM employees
ORDER BY department DESC , salary DESC ; 


# Limiting Results
#Q19 — Top 5 highest-paid employees
select * 
FROM employees
ORDER BY salary DESC
LIMIT 5 ; 

#🧩 Combined Queries
#Q20 — Top 3 highest-paid IT/Finance employees earning ₹70K–₹1L
SELECT *
FROM employees
WHERE department IN ("it" , "finance")
AND salary BETWEEN 70000 and 100000
ORDER BY salary DESC
LIMIT 3;


