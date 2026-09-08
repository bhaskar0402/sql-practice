USE employer_database;

#Q11. Categorize employees based on salary.

SELECT * , 
    case WHEN salary >= 100000 then "high salary" 
    WHEN salary BETWEEN 60000 AND 100000 then "mid salary"
    ELSE "low salary" 
    END as employee_status
from employees ;

#Q12. Categorize employees based on experience.
SELECT * , 
    CASE 
    WHEN TIMESTAMPDIFF(year , hire_date , curdate()) <=2 then "junior"
    WHEN TIMESTAMPDIFF(year , hire_date , curdate()) BETWEEN 2 and 5 then "mid"
    ELSE "senior"
    END as position
FROM employees ;    

#Q13. Find the total number of Active employees using CASE.
-- Approach 1: Simple COUNT with WHERE
SELECT COUNT(*) AS total_employees
FROM employees
WHERE employment_status = 'Active';

-- Approach 2: CASE inside SUM()
SELECT SUM(
    case WHEN employment_status = 'Active' THEN 1
    ELSE 0 
    END
) as sum
from employees ;

#Q14. Display project status with business-friendly labels.
SELECT * , 
    CASE
     WHEN status = "ongoing" then "In Progress" 
     WHEN status = "completed" THEN "Successfully Delivered"
     WHEN status = "On Hold" THEN "Awaiting Approval"
     END as business_friendly 
FROM projects ;

#Q15. Display employee names along with a custom message.
SELECT
    employee_name,
    salary,
    employment_status,
    CASE
        WHEN employment_status = 'Active' AND salary > 100000 THEN 'Star Employee'
        WHEN employment_status = 'Active' THEN 'Active Employee'
        ELSE 'Needs Attention'
    END AS employee_label
FROM employees;