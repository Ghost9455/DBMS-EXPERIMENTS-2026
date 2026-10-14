# DBMS-EXPERIMENTS-2026

## DBMS Lab Practicals with MySQL Solutions

This repository contains SQL source code for Database Management
Systems (DBMS) laboratory experiments using MySQL.

The repository is organized experiment-wise for easy navigation,
execution, and reference.

---

## 📚 Experiments

### Experiment 1: E-Commerce ER Diagram
- Design an ER model for an Indian e-commerce platform.
- Identify entities, attributes, primary keys, and relationships.
- Represent weak entities, composite and multivalued attributes,
  product specialization, and participation constraints.

**File:** `Experiment-01/experiment_01.sql`

### Experiment 2: ER Diagram to Relational Schema
- Implement the e-commerce relational schema using MySQL.
- Create tables with primary keys and foreign keys.
- Apply NOT NULL, UNIQUE, ON DELETE CASCADE, and SET NULL constraints.
- Insert sample data and demonstrate referential integrity violations.

**File:** `Experiment-02/experiment_02.sql`

### Experiment 3: Employee–Department–Project Database
- Create Department, Employee, Project, and Employee_Project tables.
- Insert sample data for 30 employees, 5 departments, and 8 projects.
- Practice selection, projection, aggregate functions, GROUP BY,
  HAVING, CASE expressions, and ORDER BY.

**File:** `Experiment-03/experiment_03.sql`

### Experiment 4: SQL Joins and Subqueries
- Practice INNER JOIN, LEFT JOIN, SELF JOIN, and multi-table joins.
- Use correlated subqueries and EXISTS.
- Simulate INTERSECT and EXCEPT operations.
- Analyze query execution plans using EXPLAIN.

**File:** `Experiment-04/experiment_04.sql`

### Experiment 5: Views and Recursive CTE
- Create views for department salary summaries and employee hierarchies.
- Test view updatability.
- Use a recursive CTE to display reporting chains.

**File:** `Experiment-05/experiment_05.sql`

**Status:** Pending

### Experiment 6: Stored Procedures and Triggers
- Create a stored procedure for transferring employees between departments.
- Implement validation and error handling.
- Create triggers for salary validation and audit logging.

**File:** `Experiment-06/experiment_06.sql`

**Status:** Pending

### Experiment 7: Database Normalization
- Identify functional dependencies in a denormalized Sales table.
- Normalize the schema from UNF to 3NF and BCNF.
- Verify lossless joins and dependency preservation.

**File:** `Experiment-07/experiment_07.sql`

**Status:** Pending

---

## 🛠️ Requirements

- MySQL Server 8.0 or a compatible version
- MySQL Workbench or another MySQL client
- Basic knowledge of SQL and relational databases

Some features may depend on the MySQL version.

---

## ▶️ How to Run the SQL Files

1. Install and start MySQL Server.
2. Clone or download this repository.
3. Open the required `.sql` file in MySQL Workbench or your preferred SQL client.
4. Execute the script.
5. Review the query results and any output messages.

### Important Notes

- Run each experiment in the appropriate order when it depends on
  tables or databases created by an earlier experiment.
- Experiment 4 uses the EmployeeManagement database created in
  Experiment 3.
- Review commented test statements before executing them.
- Some statements may modify or delete data.

---

## 📁 Repository Structure

```text
DBMS-EXPERIMENTS-2026/
├── README.md
├── Experiment-01/
│   └── experiment_01.sql
├── Experiment-02/
│   └── experiment_02.sql
├── Experiment-03/
│   └── experiment_03.sql
├── Experiment-04/
│   └── experiment_04.sql
├── Experiment-05/
│   └── experiment_05.sql
├── Experiment-06/
│   └── experiment_06.sql
└── Experiment-07/
    └── experiment_07.sql
