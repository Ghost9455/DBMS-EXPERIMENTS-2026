# Experiment 04 — Joins, Subqueries and EXPLAIN

## Aim
Write and execute SQL queries using INNER JOIN, LEFT JOIN, self join, three-way join, correlated subqueries, EXISTS, simulated set operations using EXISTS and NOT EXISTS, and compare query execution plans using EXPLAIN.

## Concepts Covered
- INNER JOIN
- LEFT JOIN
- Self join
- Three-way join
- Correlated subqueries
- EXISTS and NOT EXISTS
- EXCEPT-like filtering using NOT EXISTS
- EXPLAIN query execution plans
- Comparing query plan attributes such as type, possible_keys, key, rows, and Extra

## SQL File
`experiment_04.sql`

## How to Run
1. Run Experiment 03 first to create and populate the required tables.
2. Open `experiment_04.sql` in MySQL Workbench.
3. Execute the queries.
4. Review the result grids.
5. Compare the EXPLAIN output for the different queries.

## Expected Output
The queries display joined employee, department, and project information, employees earning above their department's average salary, EXISTS and NOT EXISTS results, and query execution plans.

## Requirements
- MySQL 8.0+.
- Requires the Employee, Department, and Project tables populated by Experiment 03.
