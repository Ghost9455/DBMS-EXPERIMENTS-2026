# 📚 DBMS-EXPERIMENTS-2026

### Database Management Systems Laboratory Practicals Using MySQL

Welcome to **DBMS-EXPERIMENTS-2026**!

This repository contains SQL source code and practical implementations for Database Management Systems (DBMS) laboratory experiments using MySQL.

The repository covers essential DBMS concepts, including database design, ER diagrams, relational schemas, SQL operations, aggregate functions, views, recursive Common Table Expressions (CTEs), stored procedures, triggers, transaction management, and database constraints.

The purpose of this repository is to organize DBMS practical solutions in a structured format for learning, practice, and academic reference.

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

# 🧪 Experiments

## Experiment 01: ER Diagram Design for an E-Commerce Platform

### Aim
To design an Entity-Relationship (ER) diagram for an Indian e-commerce platform, identifying entities, attributes, keys, relationships, cardinalities, weak entities, specialization, and participation constraints.

### Topics Covered
- Entity-Relationship modeling
- Entities and attributes
- Primary keys
- Composite attributes
- Multivalued attributes
- Weak entities
- Relationships and cardinalities
- Participation constraints
- Specialization of entities
- Disjoint specialization

### Main Entities
- Customer
- Product
- Order
- Order Item
- Seller
- Category
- Payment
- Delivery
- Address

### Learning Outcome
Understand how to represent an e-commerce system using an ER diagram and identify relationships and constraints between entities.

**Source Code:** `Experiment-01/experiment_01.sql`

---

## Experiment 02: Relational Schema and Table Creation

### Aim
To convert an ER diagram for an e-commerce platform into a relational schema and implement it using MySQL CREATE TABLE statements.

### Topics Covered
- Relational schema design
- CREATE DATABASE
- CREATE TABLE
- Primary keys
- Foreign keys
- NOT NULL constraints
- UNIQUE constraints
- ON DELETE CASCADE
- ON DELETE SET NULL
- Inserting sample data
- Referential integrity
- Testing constraint violations

### Main Tables
- Customer
- Seller
- Category
- Address
- Product
- Orders
- Order Item
- Payment
- Delivery

### Learning Outcome
Understand how an ER model is converted into relational tables and how constraints maintain data consistency and referential integrity.

**Source Code:** `Experiment-02/experiment_02.sql`

---

## Experiment 03: Database Creation and SQL Operations

### Aim
To establish the database structure and perform the SQL operations defined in the experiment source file.

### Topics Covered
Refer to the SQL source file for the exact operations and concepts implemented in this experiment.

### Learning Outcome
Practice database creation, table operations, and SQL queries as implemented in the experiment.

**Source Code:** `Experiment-03/experiment_03.sql`

---

## Experiment 04: SQL Queries and Database Operations

### Aim
To execute the SQL operations and queries defined in the experiment source file.

### Topics Covered
Refer to the SQL source file for the exact queries and database concepts implemented in this experiment.

### Learning Outcome
Develop practical experience in executing SQL statements and working with relational database tables.

**Source Code:** `Experiment-04/experiment_04.sql`

---

## Experiment 05: SQL Views and Recursive CTE

### Aim
To create and manipulate SQL views for department salary summaries and employee hierarchies, test the updatability of views, and implement recursive Common Table Expressions to display employee reporting chains.

### Topics Covered

#### 1. Department Salary Summary View
- CREATE VIEW
- LEFT JOIN
- GROUP BY
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

#### 2. Querying Views
- Retrieving department salary summaries
- Filtering departments by average salary
- Using WHERE conditions with views

#### 3. View Updatability
- Updating data through an updatable view
- Testing non-updatable views
- Understanding restrictions on view updates

#### 4. Employee Hierarchy
- Employee-manager relationships
- Self-referencing foreign keys
- LEFT JOIN
- Creating an employee hierarchy view

#### 5. Recursive Common Table Expressions
- WITH RECURSIVE
- Anchor member
- Recursive member
- UNION ALL
- Reporting levels
- Employee reporting chains
- Recursive queries for a single employee

### Learning Outcome
Understand how views simplify complex queries and how recursive CTEs represent hierarchical relationships in a database.

### Database Dependency
This experiment uses the database created in Experiment 03.

**Source Code:** `Experiment-05/experiment_05.sql`

---

## Experiment 06: Stored Procedures and Database Triggers

### Aim
To create a stored procedure for transferring employees between departments with validation and error handling, and implement database triggers for salary validation and audit logging.

### Topics Covered

#### 1. Stored Procedure
- CREATE PROCEDURE
- Input parameters
- DECLARE variables
- SELECT INTO
- IF...THEN...ELSE
- Employee existence validation
- Department existence validation
- Checking the employee's current department

#### 2. Transaction Management
- START TRANSACTION
- COMMIT
- ROLLBACK
- Transaction error handling
- SQL exception handlers

#### 3. Salary Validation Triggers
- BEFORE INSERT trigger
- BEFORE UPDATE trigger
- Validating employee salaries
- Rejecting salaries below ₹15,000
- Handling invalid inputs

#### 4. Salary Audit Logging
- Creating an audit table
- AFTER UPDATE trigger
- OLD and NEW values
- Recording previous and updated salaries
- Recording timestamps
- Tracking salary changes

#### 5. Testing and Edge Cases
- Successful employee transfers
- Employee does not exist
- Department does not exist
- Employee already belongs to the requested department
- Valid salary insertion
- Invalid salary insertion
- Invalid salary updates
- Multiple salary changes
- Unchanged salary values

### Learning Outcome
Understand how stored procedures automate database operations, how transactions maintain consistency, and how triggers enforce validation rules and record changes.

### Database Dependency
This experiment uses the database created in Experiment 03.

**Source Code:** `Experiment-06/experiment_06.sql`

---

# 🛠️ Technologies Used

- **Database:** MySQL
- **Query Language:** SQL
- **Database Concepts:** Relational Database Management Systems
- **Database Design:** Entity-Relationship Modeling
- **Advanced SQL:** Views and Recursive CTEs
- **Procedural SQL:** Stored Procedures
- **Automation:** Database Triggers
- **Data Integrity:** Primary Keys, Foreign Keys, and Constraints
- **Version Control:** Git and GitHub

---

# ⚙️ How to Run the Experiments

Follow these steps to execute the SQL files.

### Step 1: Install MySQL
Install MySQL Server and a compatible SQL client, such as MySQL Workbench.

### Step 2: Clone the Repository

Open a terminal and run:

```bash
git clone https://github.com/Ghost9455/DBMS-EXPERIMENTS-2026.git
```

### Step 3: Open the Project

Navigate to the repository directory:

```bash
cd DBMS-EXPERIMENTS-2026
```

### Step 4: Open the SQL File

Open the required experiment folder and load its `.sql` file into MySQL Workbench.

### Step 5: Check Database Dependencies

Before executing an experiment, check whether it depends on a database or tables created by an earlier experiment.

Experiments 05 and 06 use the database created in Experiment 03.

Execute the required setup scripts first.

### Step 6: Execute the Queries

Run the SQL statements in the appropriate order.

Review the query results and error messages to verify the behavior of the statements.

### Step 7: Verify the Results

Use SELECT statements to inspect tables, views, and audit records where applicable.

---

# 📋 Important Notes

- Execute the SQL scripts in the correct order when dependencies exist.
- Check the database name before running a script.
- Ensure that the required tables and columns exist.
- Some experiments modify or delete records.
- Use a test database when experimenting with UPDATE and DELETE statements.
- Back up important data before running scripts that modify database records.
- Stored procedures and triggers may require delimiter changes in MySQL clients.
- The actual implementation of each experiment is defined by its SQL source file.

---

# 🎯 Learning Outcomes

After completing these practicals, students should be able to:

- Design ER diagrams for real-world applications.
- Convert ER diagrams into relational schemas.
- Create and manage relational database tables.
- Define primary keys and foreign keys.
- Apply database constraints.
- Maintain referential integrity.
- Insert and manipulate database records.
- Write and execute SQL queries.
- Create and query SQL views.
- Use aggregate functions.
- Understand view updatability.
- Represent employee hierarchies using recursive CTEs.
- Develop stored procedures with input parameters.
- Implement transaction management.
- Handle errors in stored procedures.
- Create triggers for data validation.
- Maintain audit logs for database changes.
- Organize database practicals using GitHub.

---

# 📁 Repository Organization

Each experiment is organized separately to make the source code easy to find, read, execute, and maintain.

The repository is intended for academic learning, DBMS laboratory practice, and reference.

---

# 👨‍💻 Author

**Surya Dev Singh**

**Project:** DBMS-EXPERIMENTS-2026

**Subject:** Database Management Systems Laboratory

---

# ⭐ Support

If you find this repository useful for learning DBMS and MySQL, consider giving it a star on GitHub.

Thank you for visiting **DBMS-EXPERIMENTS-2026**!
