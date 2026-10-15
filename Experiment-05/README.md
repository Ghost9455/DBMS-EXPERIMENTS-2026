# Experiment 05 — Views and Recursive CTE

## Aim
Create SQL views for department salary summaries and employee hierarchy, test view updatability, and implement a recursive CTE to display reporting chains.

## Concepts Covered
- Creating SQL views
- Department salary summary
- Aggregate functions in views
- Employee hierarchy using a self join
- Updating data through a simple updatable view
- Recursive CTE using WITH RECURSIVE
- Displaying employee reporting levels

## SQL File
`experiment_05.sql`

## How to Run
1. Open `experiment_05.sql` in MySQL Workbench.
2. Run the script in a test database.
3. Review the output of each view.
4. Check the updated salary in Employee_Basic_View.
5. Review the Reporting_Chain output.

## Expected Output
- Department_Salary_Summary displays employee counts and salary statistics for each department.
- Employee_Hierarchy displays employee and manager names.
- Employee_Basic_View displays basic employee information, including the updated salary for employee 1.
- Reporting_Chain displays employees according to their reporting levels.

## Requirements and Caution
- MySQL 8.0+ is required for recursive CTE support.
- The script drops and recreates tables and views with matching names. Do not run it in a database containing data you need to preserve.
