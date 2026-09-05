use employer_database;

#Q1 — Employee Name, Bonus Amount & Bonus Date
SELECT e.employee_name , b.bonus_amount , b.bonus_date
FROM bonuses b
LEFT JOIN employees e
ON b.employee_id = e.employee_id ;

#Q2 — Employee Name, Project Name & Role
SELECT e.employee_name , p.project_name ,ep.role
FROM employee_projects ep
LEFT JOIN employees e
on ep.employee_id = e.employee_id 
LEFT JOIN projects p
on ep.project_id = p.project_id ;

#Q3 — Employees with Bonus Greater than ₹10,000
SELECT e.employee_name , b.bonus_amount 
FROM bonuses b
LEFT JOIN employees e 
ON b.employee_id = e.employee_id 
WHERE b.bonus_amount > 10000 ; 

#Q4 — Employees On Leave with Their Manager Names
SELECT e.employee_name , m.employee_name , e.employment_status
FROM employees e
INNER JOIN employees m 
ON e.manager_id = m.employee_id 
WHERE e.employment_status = "on leave";

#Q5 — Employees Who Never Received a Bonus

SELECT e.employee_name
FROM  employees e
LEFT JOIN bonuses b
ON e.employee_id = b.employee_id 
WHERE bonus_amount is NULL ;

#Q6 — All Managers with Their Direct Reports (Including Managers with No Reports)

SELECT m.employee_name AS manager , e.employee_name as employee
FROM employees m
LEFT JOIN employees e 
ON m.employee_id = e.manager_id 
WHERE m.employee_id IN ( 
SELECT DISTINCT employee_id
FROM employees
WHERE manager_id is NULL
) ; 

# the above solution is only correct when there is no sub manager / junior manager 
# the mean either there are manager or they are emloyee but in real data set this is not happen 

SELECT m.employee_name AS manager , e.employee_name as employee
FROM employees m
LEFT JOIN employees e 
ON m.employee_id = e.manager_id 
WHERE m.employee_id IN ( 
SELECT DISTINCT employee_id
FROM employees
WHERE manager_id is NOT NULL
) ; 

# the above solution is correct when there is  sub manager / junior manager
# but it will not include the manager who has no report 


#Q7 — Employees Working on More Than One Project
SELECT e.employee_name , COUNT(*)
FROM employee_projects ep 
LEFT JOIN employees e 
ON ep.employee_id = e.employee_id 
GROUP by e.employee_id 
HAVING COUNT(*) > 1 ;


#Q8 — Employees Not Assigned to Any Project
SELECT e.employee_name 
FROM employees e 
LEFT JOIN employee_projects ep 
ON e.employee_id = ep.employee_id 
WHERE ep.project_id is NULL ;

#Q9 — Projects with No Employees Assigned
SELECT DISTINCT project_name 
from projects p
left join employee_projects ep
ON p.project_id = ep.project_id
where ep.employee_id is null ;

#Q10 — Clients with Total Number of Orders
SELECT c.client_name,
       COUNT(c.client_id) AS total_number_Orders
FROM clients c
LEFT JOIN orders_data o ON c.client_id = o.client_id
GROUP BY c.client_id;



