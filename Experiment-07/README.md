# Experiment 7: Database Normalization

## Aim

To understand and implement database normalization using UNF, 1NF, 2NF, 3NF, and BCNF.

## Concepts Covered

* Unnormalized Form (UNF)
* First Normal Form (1NF)
* Second Normal Form (2NF)
* Third Normal Form (3NF)
* Boyce-Codd Normal Form (BCNF)
* Functional Dependencies
* Lossless Join
* Dependency Preservation

## Theory

Normalization is the process of organizing data in a database to reduce redundancy and prevent insertion, deletion, and update anomalies.

### 1NF

A table is in First Normal Form when each attribute contains a single atomic value.

### 2NF

A table is in Second Normal Form when it is in 1NF and every non-prime attribute depends on the whole candidate key.

### 3NF

A table is in Third Normal Form when it is in 2NF and has no inappropriate transitive dependencies of non-prime attributes on candidate keys.

### BCNF

A table is in BCNF when every determinant of a non-trivial functional dependency is a superkey.

## Expected Output

The database tables are analyzed and decomposed into appropriate normal forms to reduce redundancy and improve data integrity.

Refer to the Experiment 7 Expected Outputs PDF in the `Expected-Outputs` folder.

## Result

Database normalization concepts and the properties of 1NF, 2NF, 3NF, and BCNF are studied.
