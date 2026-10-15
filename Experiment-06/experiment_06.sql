-- ==================================================
-- EXPERIMENT 6
-- STORED PROCEDURES AND TRIGGERS
-- ==================================================

-- USE EXPERIMENT 3 DATABASE
-- Make sure your database name is correct.
-- USE your_database_name;


-- ==================================================
-- 1. STORED PROCEDURE: TRANSFER EMPLOYEE
-- ==================================================

DROP PROCEDURE IF EXISTS transfer_employee;

DELIMITER //

CREATE PROCEDURE transfer_employee(
    IN p_emp_id INT,
    IN p_new_dept_id INT
)
BEGIN
    DECLARE v_employee_count INT DEFAULT 0;
    DECLARE v_department_count INT DEFAULT 0;
    DECLARE v_current_dept INT DEFAULT 0;

    -- ERROR HANDLER

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- CHECK WHETHER EMPLOYEE EXISTS

    SELECT COUNT(*)
    INTO v_employee_count
    FROM Employee
    WHERE emp_id = p_emp_id;

    IF v_employee_count = 0 THEN

        ROLLBACK;

        SELECT
            'Error: Employee does not exist.'
            AS message;

    ELSE

        -- CHECK WHETHER DEPARTMENT EXISTS

        SELECT COUNT(*)
        INTO v_department_count
        FROM Department
        WHERE dept_id = p_new_dept_id;

        IF v_department_count = 0 THEN

            ROLLBACK;

            SELECT
                'Error: Department does not exist.'
                AS message;

        ELSE

            -- GET CURRENT DEPARTMENT

            SELECT dept_id
            INTO v_current_dept
            FROM Employee
            WHERE emp_id = p_emp_id;

            -- CHECK WHETHER EMPLOYEE IS ALREADY
            -- IN THE REQUESTED DEPARTMENT

            IF v_current_dept = p_new_dept_id THEN

                ROLLBACK;

                SELECT
                    'Error: Employee is already in this department.'
                    AS message;

            ELSE

                -- TRANSFER EMPLOYEE

                UPDATE Employee
                SET dept_id = p_new_dept_id
                WHERE emp_id = p_emp_id;

                COMMIT;

                SELECT
                    'Employee transferred successfully.'
                    AS message;

            END IF;

        END IF;

    END IF;

END //

DELIMITER ;


-- ==================================================
-- 2. TEST THE STORED PROCEDURE
-- ==================================================

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM Employee e
JOIN Department d
    ON e.dept_id = d.dept_id
WHERE e.emp_id = 101;


-- TRANSFER EMPLOYEE 101 TO DEPARTMENT 3

CALL transfer_employee(101, 3);


-- VERIFY THE RESULT

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM Employee e
JOIN Department d
    ON e.dept_id = d.dept_id
WHERE e.emp_id = 101;


-- ==================================================
-- 3. EDGE CASE: EMPLOYEE DOES NOT EXIST
-- ==================================================

CALL transfer_employee(999, 3);


-- ==================================================
-- 4. EDGE CASE: DEPARTMENT DOES NOT EXIST
-- ==================================================

CALL transfer_employee(101, 99);


-- ==================================================
-- 5. EDGE CASE: SAME DEPARTMENT
-- ==================================================

-- Run this after employee 101 has been transferred
-- to department 3.

CALL transfer_employee(101, 3);


-- ==================================================
-- 6. SALARY VALIDATION TRIGGER FOR INSERT
-- ==================================================

DROP TRIGGER IF EXISTS validate_employee_salary;

DELIMITER //

CREATE TRIGGER validate_employee_salary
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN

    IF NEW.salary IS NULL OR NEW.salary < 15000 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Salary cannot be NULL and must be at least 15000';

    END IF;

END //

DELIMITER ;


-- ==================================================
-- 7. TEST INVALID SALARY INSERT
-- ==================================================

INSERT INTO Employee
    (emp_id, emp_name, gender, salary, hire_date, dept_id)
VALUES
    (131, 'Test Employee', 'M', 10000, '2026-09-25', 1);

-- EXPECTED:
-- MySQL rejects the INSERT because salary is below 15000.


-- ==================================================
-- 8. TEST VALID SALARY INSERT
-- ==================================================

INSERT INTO Employee
    (emp_id, emp_name, gender, salary, hire_date, dept_id)
VALUES
    (131, 'Test Employee', 'M', 30000, '2026-09-25', 1);


-- VERIFY THE EMPLOYEE

SELECT
    emp_id,
    emp_name,
    salary
FROM Employee
WHERE emp_id = 131;


-- ==================================================
-- 9. SALARY VALIDATION TRIGGER FOR UPDATE
-- ==================================================

DROP TRIGGER IF EXISTS validate_employee_salary_update;

DELIMITER //

CREATE TRIGGER validate_employee_salary_update
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN

    IF NEW.salary IS NULL OR NEW.salary < 15000 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Salary must be at least 15000';

    END IF;

END //

DELIMITER ;


-- ==================================================
-- 10. TEST INVALID SALARY UPDATE
-- ==================================================

UPDATE Employee
SET salary = 5000
WHERE emp_id = 131;

-- EXPECTED:
-- MySQL rejects the update because salary is below 15000.


-- ==================================================
-- 11. CREATE AUDIT TABLE
-- ==================================================

CREATE TABLE IF NOT EXISTS Salary_Audit (

    audit_id INT AUTO_INCREMENT PRIMARY KEY,

    emp_id INT,

    old_salary DECIMAL(10,2),

    new_salary DECIMAL(10,2),

    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    action VARCHAR(30)

);


-- ==================================================
-- 12. AUDIT LOGGING TRIGGER
-- ==================================================

DROP TRIGGER IF EXISTS salary_audit_trigger;

DELIMITER //

CREATE TRIGGER salary_audit_trigger
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN

    IF NOT (OLD.salary <=> NEW.salary) THEN

        INSERT INTO Salary_Audit
        (
            emp_id,
            old_salary,
            new_salary,
            action
        )

        VALUES
        (
            NEW.emp_id,
            OLD.salary,
            NEW.salary,
            'SALARY UPDATED'
        );

    END IF;

END //

DELIMITER ;


-- ==================================================
-- 13. TEST AUDIT TRIGGER
-- ==================================================

UPDATE Employee
SET salary = 35000
WHERE emp_id = 131;


-- DISPLAY AUDIT RECORDS

SELECT *
FROM Salary_Audit;


-- ==================================================
-- 14. TEST MULTIPLE SALARY CHANGES
-- ==================================================

UPDATE Employee
SET salary = 40000
WHERE emp_id = 131;

UPDATE Employee
SET salary = 45000
WHERE emp_id = 131;


-- VERIFY AUDIT LOG

SELECT
    audit_id,
    emp_id,
    old_salary,
    new_salary,
    action
FROM Salary_Audit
WHERE emp_id = 131;


-- ==================================================
-- 15. TEST EDGE CASE: SALARY UNCHANGED
-- ==================================================

UPDATE Employee
SET salary = 45000
WHERE emp_id = 131;

-- EXPECTED:
-- No new audit record should be created.


-- ==================================================
-- 16. CHECK ALL TRIGGERS
-- ==================================================

SHOW TRIGGERS;


-- ==================================================
-- 17. CHECK STORED PROCEDURE
-- ==================================================

SHOW PROCEDURE STATUS
WHERE Db = DATABASE();
