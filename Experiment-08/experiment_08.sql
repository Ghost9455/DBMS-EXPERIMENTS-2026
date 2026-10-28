-- EXPERIMENT 8: TRANSACTIONS
CREATE DATABASE IF NOT EXISTS Experiment8;
USE Experiment8;

DROP TABLE IF EXISTS Transaction_Log;
DROP TABLE IF EXISTS Bank_Account;

CREATE TABLE Bank_Account (
    Account_ID INT PRIMARY KEY,
    Account_Holder VARCHAR(50),
    Balance DECIMAL(12,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Transaction_Log (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    From_Account INT,
    To_Account INT,
    Amount DECIMAL(12,2),
    Log_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO Bank_Account VALUES
(101,'Aarav Sharma',50000),
(102,'Riya Verma',30000),
(103,'Karan Mehta',20000);

-- 1. Display initial balances
SELECT * FROM Bank_Account;

-- 2. COMMIT: Transfer money from account 101 to 102
START TRANSACTION;

UPDATE Bank_Account
SET Balance = Balance - 5000
WHERE Account_ID = 101;

UPDATE Bank_Account
SET Balance = Balance + 5000
WHERE Account_ID = 102;

INSERT INTO Transaction_Log (From_Account, To_Account, Amount)
VALUES (101,102,5000);

COMMIT;

SELECT * FROM Bank_Account;
SELECT * FROM Transaction_Log;

-- 3. ROLLBACK: Undo an incomplete transfer
START TRANSACTION;

UPDATE Bank_Account
SET Balance = Balance - 7000
WHERE Account_ID = 101;

UPDATE Bank_Account
SET Balance = Balance + 7000
WHERE Account_ID = 999;

ROLLBACK;

SELECT * FROM Bank_Account;

-- 4. SAVEPOINT
START TRANSACTION;

UPDATE Bank_Account
SET Balance = Balance - 3000
WHERE Account_ID = 101;

SAVEPOINT after_debit;

UPDATE Bank_Account
SET Balance = Balance + 3000
WHERE Account_ID = 103;

SAVEPOINT after_credit;

UPDATE Bank_Account
SET Balance = Balance - 1000
WHERE Account_ID = 102;

ROLLBACK TO SAVEPOINT after_credit;

COMMIT;

SELECT * FROM Bank_Account;

-- 5. Check transaction isolation level
SELECT @@transaction_isolation AS Current_Isolation_Level;

-- Run each SET statement individually if your SQL editor
-- does not allow multiple statements together.
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT @@transaction_isolation;

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT @@transaction_isolation;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT @@transaction_isolation;

SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT @@transaction_isolation;
