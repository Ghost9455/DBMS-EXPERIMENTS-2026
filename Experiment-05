-- ==================================================
-- EXPERIMENT 5
-- SQL VIEWS AND RECURSIVE CTE
-- ==================================================

-- USE EXPERIMENT 3 DATABASE
-- Make sure your database name is correct.
-- USE your_database_name;


-- ==================================================
-- 1. DEPARTMENT SALARY SUMMARY VIEW
-- ==================================================

CREATE OR REPLACE VIEW Department_Salary_Summary AS
SELECT
    d.dept_id,
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary
FROM Department d
LEFT JOIN Employee e
    ON d.dept_id = e.dept_id
GROUP BY
    d.dept_id,
    d.dept_name;


-- DISPLAY THE VIEW

SELECT *
FROM Department_Salary_Summary;


-- ==================================================
-- 2. QUERY THE VIEW
-- Find departments with average salary above 75000
-- ==================================================

SELECT
    dept_name,
    average_salary
FROM Department_Salary_Summary
WHERE average_salary > 75000;


-- ==================================================
-- 3. CREATE SIMPLE EMPLOYEE VIEW
-- ==================================================

CREATE OR REPLACE VIEW Employee_Basic AS
SELECT
    emp_id,
    emp_name,
    salary,
    dept_id
FROM Employee;


-- ==================================================
-- 4. UPDATE THROUGH THE VIEW
-- ==================================================

UPDATE Employee_Basic
SET salary = 78000
WHERE emp_id = 101;


-- VERIFY THE UPDATE

SELECT *
FROM Employee
WHERE emp_id = 101;


-- ==================================================
-- 5. TEST NON-UPDATABILITY OF AGGREGATE VIEW
-- ==================================================

UPDATE Department_Salary_Summary
SET average_salary = 80000
WHERE dept_id = 1;

-- EXPECTED RESULT:
-- MySQL rejects the update because the view contains
-- aggregate functions and GROUP BY.


-- ==================================================
-- 6. CREATE EMPLOYEE HIERARCHY
-- ==================================================

-- Add manager_id only if it does not already exist.
-- Check the table structure before executing.

-- ALTER TABLE Employee
-- ADD COLUMN manager_id INT NULL;

-- Add the self-referencing foreign key only once.

-- ALTER TABLE Employee
-- ADD CONSTRAINT fk_employee_manager
-- FOREIGN KEY (manager_id)
-- REFERENCES Employee(emp_id);


-- ==================================================
-- 7. INSERT EMPLOYEE HIERARCHY
-- ==================================================

-- Set top-level managers

UPDATE Employee
SET manager_id = NULL
WHERE emp_id IN (105, 112, 114, 122, 125);


-- IT DEPARTMENT

UPDATE Employee
SET manager_id = 105
WHERE emp_id IN (103, 104);

UPDATE Employee
SET manager_id = 103
WHERE emp_id IN (101, 102);

UPDATE Employee
SET manager_id = 104
WHERE emp_id = 106;


-- FINANCE DEPARTMENT

UPDATE Employee
SET manager_id = 112
WHERE emp_id IN (107, 108);

UPDATE Employee
SET manager_id = 107
WHERE emp_id = 109;

UPDATE Employee
SET manager_id = 108
WHERE emp_id IN (110, 111);


-- MARKETING DEPARTMENT

UPDATE Employee
SET manager_id = 112
WHERE emp_id IN (126, 127, 128);

UPDATE Employee
SET manager_id = 126
WHERE emp_id = 129;

UPDATE Employee
SET manager_id = 128
WHERE emp_id = 130;


-- ==================================================
-- 8. CREATE EMPLOYEE HIERARCHY VIEW
-- ==================================================

CREATE OR REPLACE VIEW Employee_Hierarchy AS
SELECT
    e.emp_id,
    e.emp_name AS employee_name,
    e.manager_id,
    m.emp_name AS manager_name,
    e.salary,
    e.dept_id
FROM Employee e
LEFT JOIN Employee m
    ON e.manager_id = m.emp_id;


-- DISPLAY EMPLOYEE HIERARCHY

SELECT *
FROM Employee_Hierarchy;


-- ==================================================
-- 9. RECURSIVE CTE FOR COMPLETE EMPLOYEE HIERARCHY
-- ==================================================

WITH RECURSIVE EmployeeChain AS (

    -- ANCHOR MEMBER

    SELECT
        emp_id,
        emp_name,
        manager_id,
        0 AS level,
        CAST(emp_name AS CHAR(500)) AS reporting_chain
    FROM Employee
    WHERE manager_id IS NULL

    UNION ALL

    -- RECURSIVE MEMBER

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        ec.level + 1,
        CONCAT(
            ec.reporting_chain,
            ' -> ',
            e.emp_name
        )
    FROM Employee e
    INNER JOIN EmployeeChain ec
        ON e.manager_id = ec.emp_id
)

SELECT
    emp_id,
    emp_name,
    manager_id,
    level,
    reporting_chain
FROM EmployeeChain
ORDER BY reporting_chain;


-- ==================================================
-- 10. RECURSIVE CTE FOR ONE EMPLOYEE
-- ==================================================

WITH RECURSIVE ReportingChain AS (

    SELECT
        emp_id,
        emp_name,
        manager_id,
        0 AS level
    FROM Employee
    WHERE emp_id = 101

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        rc.level + 1
    FROM Employee e
    INNER JOIN ReportingChain rc
        ON e.emp_id = rc.manager_id
)

SELECT
    emp_id,
    emp_name,
    manager_id,
    level
FROM ReportingChain;
