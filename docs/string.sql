use employer_database;

# Q1. Display employee name in uppercase along with the length of the employee name.

SELECT
    UPPER(employee_name) AS employee_name,
    LENGTH(employee_name) AS employee_length
FROM employees;

# Q2. Display employee details in the format: Raj Sharma (raj.sharma@company.com) - Mumbai
SELECT
    CONCAT(employee_name, ' (', email, ') ', '- ', city) AS employee_name_format
FROM employees;

# Q3. Extract the username from employee email addresses.
SELECT
    SUBSTRING_INDEX(email, '@', 1) AS userName,
    email
FROM employees;

#Q4. Find employees whose email domain is gmail.com.
-- Approach 1: Pattern matching
SELECT * FROM employees
WHERE email LIKE '%gmail.com';

-- Approach 2: Exact domain extraction
SELECT * FROM employees
WHERE SUBSTRING_INDEX(email, '@', -1) = 'gmail.com';

#Q5. Display employee initials. e.g., Raj Sharma → RS, Priya Mehta → PM
SELECT
    CONCAT(
        LEFT(TRIM(employee_name), 1),
        LEFT(SUBSTRING_INDEX(TRIM(employee_name), ' ', -1), 1)
    ) AS employee_initials
FROM employees;




