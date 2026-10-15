# 📚 DBMS-EXPERIMENTS-2026

### Database Management Systems Laboratory Practicals using MySQL

Welcome to **DBMS-EXPERIMENTS-2026**! This repository contains SQL source code, database queries, practical implementations, and experiments completed as part of the Database Management Systems (DBMS) laboratory coursework.

The repository demonstrates practical applications of relational database concepts using MySQL, including database design, SQL queries, integrity constraints, views, recursive queries, stored procedures, and triggers.

---

## 🎯 Objectives

- Understand relational database design and implementation.
- Convert Entity-Relationship (ER) diagrams into relational schemas.
- Implement primary keys, foreign keys, and integrity constraints.
- Practice SQL queries and database operations.
- Create and manipulate database views.
- Implement recursive Common Table Expressions (CTEs).
- Develop stored procedures with validation and error handling.
- Implement triggers for data validation and audit logging.

---

## 🛠️ Technologies Used

- **Database:** MySQL
- **Query Language:** SQL
- **IDE:** MySQL Workbench
- **Version Control:** Git and GitHub

---

## 📂 Repository Structure

```text
DBMS-EXPERIMENTS-2026/
│
├── Experiment-01/
│   └── experiment_01.sql
│
├── Experiment-02/
│   └── experiment_02.sql
│
├── Experiment-03/
│   └── experiment_03.sql
│
├── Experiment-04/
│   └── experiment_04.sql
│
├── Experiment-05/
│   └── experiment_05.sql
│
├── Experiment-06/
│   └── experiment_06.sql
│
└── README.md
```

---

## 🧪 Experiments

### Experiment 1: ER Diagram for an E-Commerce Platform

**File:** `Experiment-01/experiment_01.sql`

**Objective:** Design an Entity-Relationship (ER) model for an Indian e-commerce platform.

**Concepts Covered:**
- Entities and attributes
- Primary keys and composite keys
- Relationships and cardinality
- Weak entities
- Composite and multivalued attributes
- Specialization and participation constraints

### Experiment 2: ER-to-Relational Schema Conversion

**File:** `Experiment-02/experiment_02.sql`

**Objective:** Convert the e-commerce ER diagram into a relational database schema and implement it using MySQL.

**Concepts Covered:**
- CREATE TABLE statements
- Primary and foreign keys
- NOT NULL and UNIQUE constraints
- Referential integrity
- ON DELETE CASCADE
- ON DELETE SET NULL
- Sample data insertion

### Experiment 3: Database Design and SQL Operations

**File:** `Experiment-03/experiment_03.sql`

**Objective:** Implement the database schema and SQL operations specified in the third laboratory experiment.

**Note:** Refer to the source file for the exact operations and queries implemented.

### Experiment 4: SQL Queries and Database Operations

**File:** `Experiment-04/experiment_04.sql`

**Objective:** Implement the SQL queries and database operations specified in the fourth laboratory experiment.

**Note:** Refer to the source file for the exact operations and queries implemented.

### Experiment 5: SQL Views and Recursive CTE

**File:** `Experiment-05/experiment_05.sql`

**Objective:** Create and manipulate SQL views for department salary summaries and employee hierarchies, test view updatability, and implement recursive CTEs to display employee reporting chains.

**Concepts Covered:**
- Department salary summary views
- Aggregate functions: COUNT, SUM, AVG, MAX, and MIN
- Querying views using conditions
- Updating data through a simple view
- Testing the non-updatability of aggregate views
- Employee-manager relationships
- Employee hierarchy views
- Recursive CTEs
- Employee reporting chains

### Experiment 6: Stored Procedures and Triggers

**File:** `Experiment-06/experiment_06.sql`

**Objective:** Create a stored procedure for employee department transfers with validation and error handling, and implement triggers for salary validation and audit logging.

**Concepts Covered:**
- Stored procedures
- Employee and department validation
- Department transfer operations
- Transaction handling
- Exception handling
- BEFORE INSERT triggers
- BEFORE UPDATE triggers
- AFTER UPDATE triggers
- Salary validation
- Audit tables and salary change logging
- Testing normal and edge-case inputs

---

## ⚙️ How to Run the SQL Files

Follow these steps to execute the experiments locally.

### Prerequisites

Install the following software:

1. MySQL Server
2. MySQL Workbench or another MySQL-compatible SQL client
3. Git (optional, for cloning the repository)

### Execution Steps

1. Clone or download this repository.
2. Open MySQL Workbench.
3. Connect to your MySQL server.
4. Open the SQL file for the experiment you want to execute.
5. Create or select the required database.
6. Ensure that all prerequisite tables and data exist.
7. Execute the SQL statements in the correct order.
8. Review the result grids and messages to verify the output.

### Important Notes

- Some experiments depend on tables created in earlier experiments.
- Experiments 5 and 6 use the `Employee` and `Department` tables from Experiment 3.
- Database names, table structures, column names, and sample IDs must match the SQL files.
- Run scripts in a test database before executing statements that modify or delete existing records.
- Some statements, such as stored procedure and trigger definitions, require appropriate delimiter handling in MySQL clients.
- Expected outputs depend on the data present in your database.

---

## 📖 Learning Outcomes

By completing these experiments, the learner gains practical experience in:

- Relational database modeling
- Schema creation and modification
- SQL data manipulation
- Referential integrity enforcement
- Database views and aggregation
- Recursive queries and hierarchical relationships
- Stored procedure development
- Trigger-based validation
- Transaction management
- Database auditing

---

## 👨‍💻 Author

**DBMS Laboratory Practicals — 2026**

This repository is maintained for educational purposes and practical learning.

---

## ⭐ Support

If you find this repository useful for learning DBMS and MySQL, consider giving it a star!

---
