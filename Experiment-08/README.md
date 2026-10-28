# Experiment 8: Transactions and Concurrency Control

## Aim

To understand database transactions, transaction control statements, and concurrency control.

## Concepts Covered

* Transactions
* COMMIT
* ROLLBACK
* SAVEPOINT
* Transaction Isolation Levels
* Concurrency Anomalies

## Theory

A transaction is a logical unit of database operations that must be completed successfully or rolled back to maintain data consistency.

### COMMIT

COMMIT permanently saves the changes made by a transaction.

### ROLLBACK

ROLLBACK cancels uncommitted changes made by a transaction.

### SAVEPOINT

SAVEPOINT creates a point within a transaction to which operations can be rolled back.

### Isolation Levels

Isolation levels control how transactions interact when executed concurrently.

## Expected Output

Transaction operations demonstrate saving changes, undoing changes, and controlling concurrent access to data.

Some concurrency demonstrations may require two separate database sessions.

Refer to the Experiment 8 Expected Outputs PDF in the `Expected-Outputs` folder.

## Result

Transaction control statements and concurrency control concepts are studied.
