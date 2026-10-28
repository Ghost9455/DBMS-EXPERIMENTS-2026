# DBMS LAB EXPERIMENTS 1–10

## Introduction

This repository contains documentation for Database Management System (DBMS) laboratory experiments. It covers ER diagrams, relational schemas, SQL queries, joins, views, stored procedures, triggers, normalization, transactions, indexing, and query optimization.

## Software Requirements

* MySQL 8.0+
* MySQL Workbench or another compatible SQL editor
* A computer with a working MySQL database server

---

# EXPERIMENT 1: ER DIAGRAM FOR AN INDIAN E-COMMERCE PLATFORM

## Aim

To design an Entity-Relationship (ER) diagram for an Indian e-commerce platform.

## Concepts Covered

* Entities and attributes
* Primary keys
* Composite and multivalued attributes
* Weak entities
* Product specialization
* Participation constraints
* Relationships and cardinality

## Procedure

1. Identify the entities required for the e-commerce platform.
2. List the attributes of each entity.
3. Mark primary keys and identify composite or multivalued attributes.
4. Identify weak entities and specialization where appropriate.
5. Define relationships, cardinalities, and participation constraints.
6. Draw and review the ER diagram.

## Expected Output

A complete ER diagram showing Customer, Product, Order, OrderItem, Seller, Category, Payment, Delivery, and Address entities with their attributes, keys, relationships, and constraints.

## Result

The ER model for an Indian e-commerce platform is designed.

---

# EXPERIMENT 2: ER MODEL TO RELATIONAL SCHEMA

## Aim

To convert an ER diagram into a relational schema and implement it using MySQL.

## Concepts Covered

* Relational schema
* CREATE TABLE
* Primary and foreign keys
* NOT NULL and UNIQUE constraints
* ON DELETE CASCADE
* ON DELETE SET NULL
* Referential integrity

## Procedure

1. Convert each strong entity into a table.
2. Map relationships and weak entities into suitable tables.
3. Define primary keys and foreign keys.
4. Apply NOT NULL, UNIQUE, and referential actions where required.
5. Insert sample records.
6. Attempt an invalid reference to demonstrate referential integrity.

## Expected Output

Tables are created with the specified constraints. Valid sample data is inserted, while invalid foreign-key references are rejected.

## Result

The ER model is converted into a relational schema, and referential integrity is demonstrated.

---

# EXPERIMENT 3: EMPLOYEE, DEPARTMENT, AND PROJECT QUERIES

## Aim

To create an Employee–Department–Project database and practice basic SQL queries.

## Requirements

Insert at least 30 employees across 5 departments and 8 projects.

## Concepts Covered

* SELECT and projection
* WHERE clause
* Aggregate functions
* GROUP BY and HAVING
* CASE expressions
* ORDER BY

## Procedure

1. Create Employee, Department, and Project tables with appropriate keys.
2. Insert sample data meeting the minimum record requirements.
3. Retrieve selected columns and filter rows.
4. Apply aggregate functions such as COUNT, AVG, SUM, MIN, and MAX.
5. Group results and filter groups using HAVING.
6. Use CASE expressions to classify results.
7. Sort results using ORDER BY.

## Expected Output

SQL queries display employee details, department and project summaries, aggregate values, conditional labels, and sorted records.

## Result

Basic SQL retrieval, filtering, aggregation, grouping, and sorting are demonstrated.

---

# EXPERIMENT 4: JOINS, SUBQUERIES, AND EXECUTION PLANS

## Aim

To perform advanced SQL queries using the Employee schema and compare query execution plans.

## Concepts Covered

* INNER JOIN
* LEFT JOIN
* Self-join
* Three-table join
* Correlated subqueries
* EXISTS
* Simulated INTERSECT and EXCEPT
* EXPLAIN

## Procedure

1. Use the Employee, Department, and Project tables.
2. Retrieve matching rows using INNER JOIN.
3. Display matching and non-matching left-side rows using LEFT JOIN.
4. Use a self-join to compare employees or show reporting relationships.
5. Join three tables in a single query.
6. Write correlated subqueries and EXISTS conditions.
7. Simulate INTERSECT and EXCEPT using MySQL-compatible queries.
8. Use EXPLAIN to inspect query execution plans.

## Expected Output

Queries return the appropriate matching, non-matching, and grouped records. EXPLAIN displays the optimizer's selected execution plan.

## Result

Joins, subqueries, set-operation alternatives, and execution-plan inspection are demonstrated.

---

# EXPERIMENT 5: VIEWS AND RECURSIVE CTE

## Aim

To create SQL views, test view updatability, and use a recursive CTE to display employee reporting chains.

## Concepts Covered

* CREATE VIEW
* Aggregate views
* Employee hierarchy
* View updatability
* Recursive Common Table Expressions (CTEs)

## Procedure

1. Create a department salary summary view.
2. Create an employee hierarchy view showing employees and their managers.
3. Create a basic employee view and test whether an update through the view is allowed.
4. Use a recursive CTE to trace reporting levels from employees without managers.
5. Query the views and recursive results.

## Expected Output

The department summary displays employee counts and salary statistics. The hierarchy view shows employee-manager relationships. The recursive CTE assigns levels to employees in the reporting chain.

## Result

Views, view updatability, and recursive CTEs are demonstrated.

---

# EXPERIMENT 6: STORED PROCEDURE, TRIGGERS, AND AUDIT LOG

## Aim

To create a stored procedure for employee department transfers and triggers for salary validation and audit logging.

## Concepts Covered

* Stored procedures
* Input parameters
* Validation and error handling
* BEFORE INSERT and BEFORE UPDATE triggers
* AFTER UPDATE trigger
* Audit logging

## Procedure

1. Create Department, Project, Employee, and Employee_Audit tables.
2. Create `transfer_employee(emp_id, new_dept_id)` with validation.
3. Reject transfers for invalid employee or department IDs.
4. Prevent invalid salary values using triggers.
5. Record old and new salary values in the audit table after a successful salary update.
6. Test valid and invalid procedure calls and salary changes.

## Expected Output

A valid transfer updates the employee's department. Invalid employee IDs, invalid department IDs, duplicate transfers where prohibited, and non-positive salaries produce validation errors. Successful salary changes create audit records containing old and new salaries.

## Result

Stored procedures, validation triggers, and salary audit logging are demonstrated.

## Note

Exact error messages depend on the SIGNAL messages defined in the SQL script.

---

# EXPERIMENT 7: DATABASE NORMALIZATION

## Aim

To identify functional dependencies and normalize a denormalized Sales table from UNF through 1NF, 2NF, 3NF, and BCNF.

## Concepts Covered

* Unnormalized Form (UNF)
* First Normal Form (1NF)
* Second Normal Form (2NF)
* Third Normal Form (3NF)
* Boyce-Codd Normal Form (BCNF)
* Functional dependencies
* Lossless join
* Dependency preservation

## Procedure

1. Inspect the original denormalized Sales table.
2. Identify repeating groups and functional dependencies.
3. Convert the table to 1NF by storing atomic values.
4. Remove partial dependencies to achieve 2NF.
5. Remove inappropriate transitive dependencies to achieve 3NF.
6. Check the functional dependencies to determine whether BCNF is satisfied.
7. Reconstruct the original data through joins and verify losslessness.

## Expected Output

The data is split into related sale, customer, salesperson, product, and sale-item tables. A lossless reconstruction should preserve the original sample rows.

## Result

Normalization is used to reduce redundancy and improve data consistency.

## Note

BCNF and dependency preservation must be checked against the functional dependencies specified for the actual schema.

---

# EXPERIMENT 8: TRANSACTIONS AND CONCURRENCY CONTROL

## Aim

To implement banking-style transactions and demonstrate transaction control, isolation levels, and concurrency anomalies.

## Concepts Covered

* BEGIN / START TRANSACTION
* COMMIT
* ROLLBACK
* SAVEPOINT
* Transaction isolation levels
* Concurrency anomalies

## Procedure

1. Create a bank account table and insert sample balances.
2. Start a transaction and perform a transfer between accounts.
3. Commit a valid transfer.
4. Perform a partial or invalid transfer and roll back uncommitted changes.
5. Create a savepoint and roll back to it.
6. Set and inspect transaction isolation levels.
7. Use two separate database sessions to demonstrate concurrency behavior.

## Expected Output

Committed changes remain saved. Rolled-back changes are undone. Rolling back to a savepoint undoes only the changes made after that savepoint. Isolation levels are displayed by the database.

## Result

Transaction control and concurrency control are demonstrated.

## Note

Concurrency anomalies require coordinated execution in two separate sessions. Use a test database.

---

# EXPERIMENT 9: RAILWAY BOOKING QUERY PERFORMANCE AND INDEXING

## Aim

To benchmark query performance before and after creating single-column and composite indexes on a railway booking table.

## Requirements

Create a railway booking dataset with at least 5,000 records.

## Concepts Covered

* Dataset generation
* Single-column indexes
* Composite indexes
* EXPLAIN
* EXPLAIN ANALYZE, where supported
* Query execution plans
* Performance comparison

## Procedure

1. Create the Railway_Booking table.
2. Insert at least 5,000 sample records.
3. Run selected queries before indexing.
4. Inspect execution plans using EXPLAIN.
5. Create suitable single-column and composite indexes.
6. Run the same queries again and compare plans and timing.

## Expected Output

The dataset contains at least 5,000 records. EXPLAIN displays the optimizer's execution plan before and after indexing. The optimizer may choose an index when it estimates that the index is beneficial.

## Result

The impact of indexing on query execution plans and performance is analyzed.

## Note

Execution plans and timings depend on MySQL version, statistics, data distribution, and hardware.

---

# EXPERIMENT 10: SQL QUERY OPTIMIZATION

## Aim

To generate a dataset with at least 10,000 rows, analyze five slow queries, and optimize them using indexing and query rewriting.

## Concepts Covered

* Query execution analysis
* EXPLAIN
* Indexing
* Composite indexes
* Query rewriting
* Execution-time comparison
* Aggregation optimization

## Procedure

1. Create a customer-orders table.
2. Generate at least 10,000 sample rows.
3. Select five queries for performance analysis.
4. Inspect their execution plans and execution times.
5. Optimize queries using suitable indexes or equivalent query rewrites.
6. Execute the queries again and compare results and performance.

## Expected Output

The dataset contains at least 10,000 rows. Five queries are analyzed and optimized. The optimized queries should preserve the intended results; performance gains depend on the optimizer and data distribution.

## Result

SQL query optimization using indexes and query rewriting is demonstrated.

## Note

Use EXPLAIN ANALYZE only on a MySQL version that supports it. Actual timing values may vary between environments.

---

# GENERAL CONCLUSION

All ten DBMS laboratory experiments cover database design, relational modeling, SQL querying, joins, views, stored procedures, triggers, normalization, transactions, indexing, and query optimization.

These experiments help develop practical understanding of database creation, integrity constraints, data manipulation, transaction management, and performance analysis.

## General Notes

* Use the appropriate SQL script for each experiment when available.
* Verify outputs by executing queries in the target database.
* Actual query results and execution plans may vary depending on the data and database environment.
* Use a test database when running scripts that create or drop tables.
