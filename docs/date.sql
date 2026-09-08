USE employer_database;

#Q6. Find employees who joined in the last 30 days.
#-- Approach 1: Shorthand interval subtraction
SELECT * 
FROM employees
WHERE hire_date >= CURDATE() - INTERVAL 30 DAY;

#-- Approach 2: Explicit DATE_SUB()
SELECT * FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT *
FROM employees 
where CURDATE() - hire_date < 30 ;

#Q7. Find employees who have completed more than 5 years in the company.
SELECT * FROM employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 5;

#Q8. Display employee name, joining year, joining month name, and total years of experience.
SELECT
    employee_name,
    YEAR(hire_date) AS joining_year,
    MONTHNAME(hire_date) AS month_name,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS total_years_experience
FROM employees;

#Q9. Display bonus details along with the day name on which the bonus was awarded.

SELECT
    *,
    DAYNAME(bonus_date) AS bonus_day
FROM bonuses;

#Q10. Display all projects along with their start date in the format: 01-Jan-2025
SELECT
    *,
    DATE_FORMAT(start_date, '%d-%b-%Y') AS start_format_date
FROM projects;




