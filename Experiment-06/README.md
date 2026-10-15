# Experiment 06 — Stored Procedure, Triggers and Audit Log

## Aim
Create a transfer_employee(emp_id, new_dept_id) stored procedure with validation and error handling, implement salary-validation triggers and audit logging, and test edge cases.

## Concepts Covered
- Stored procedures with input parameters
- Employee ID validation
- Department ID validation
- Handling invalid operations using SIGNAL SQLSTATE '45000'
- BEFORE INSERT trigger for salary validation
- BEFORE UPDATE trigger for salary validation
- AFTER UPDATE trigger for salary audit logging
- Recording old salary, new salary, and action timestamp
- Testing valid and invalid operations

## SQL File
`experiment_06.sql`

## How to Run
1. Open `experiment_06.sql` in MySQL Workbench.
2. Execute the script in a test database.
3. Verify the employee transfer operation.
4. Update an employee's salary and inspect Employee_Audit.
5. Uncomment and execute negative test statements one at a time.

## Expected Output
- A valid employee transfer updates the employee's department.
- A salary update creates a record in Employee_Audit.
- Invalid employee IDs and department IDs produce validation errors.
- Transferring an employee to the same department is rejected.
- Non-positive salaries are rejected by the triggers.

## Requirements and Caution
- MySQL 8.0+ recommended.
- The script drops and recreates tables, procedures, and triggers. Use a test database.
- Run negative test cases individually because each is expected to raise an error.
