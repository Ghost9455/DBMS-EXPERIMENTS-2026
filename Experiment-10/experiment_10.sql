-- EXPERIMENT 10: SQL QUERY OPTIMIZATION
CREATE DATABASE IF NOT EXISTS Experiment10;
USE Experiment10;

DROP TABLE IF EXISTS Customer_Order;

CREATE TABLE Customer_Order (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Customer_Name VARCHAR(60),
    City VARCHAR(50),
    Product_Category VARCHAR(40),
    Product_Name VARCHAR(80),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Order_Date DATE,
    Payment_Mode VARCHAR(20),
    Order_Status VARCHAR(20),
    Total_Amount DECIMAL(12,2)
) ENGINE=InnoDB;

SET SESSION cte_max_recursion_depth = 11000;

INSERT INTO Customer_Order
(Order_ID, Customer_ID, Customer_Name, City, Product_Category,
 Product_Name, Quantity, Unit_Price, Order_Date, Payment_Mode,
 Order_Status, Total_Amount)
WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 10000
)
SELECT
    n,
    1000 + MOD(n,1000),
    CONCAT('Customer_', 1000 + MOD(n,1000)),
    CASE MOD(n,5)
        WHEN 0 THEN 'Delhi'
        WHEN 1 THEN 'Lucknow'
        WHEN 2 THEN 'Kanpur'
        WHEN 3 THEN 'Noida'
        ELSE 'Jaipur'
    END,
    CASE MOD(n,4)
        WHEN 0 THEN 'Electronics'
        WHEN 1 THEN 'Grocery'
        WHEN 2 THEN 'Clothing'
        ELSE 'Books'
    END,
    CONCAT('Product_', MOD(n,100)),
    1 + MOD(n,5),
    200 + MOD(n,50) * 25,
    DATE_ADD('2026-01-01', INTERVAL MOD(n,300) DAY),
    CASE MOD(n,3)
        WHEN 0 THEN 'UPI'
        WHEN 1 THEN 'CARD'
        ELSE 'CASH'
    END,
    CASE MOD(n,4)
        WHEN 0 THEN 'DELIVERED'
        WHEN 1 THEN 'PENDING'
        WHEN 2 THEN 'SHIPPED'
        ELSE 'CANCELLED'
    END,
    (1 + MOD(n,5)) * (200 + MOD(n,50) * 25)
FROM seq;

-- 1. Verify dataset
SELECT COUNT(*) AS Total_Rows,
       MIN(Order_Date) AS First_Order,
       MAX(Order_Date) AS Last_Order
FROM Customer_Order;

-- 2. Query 1: City filter BEFORE index
EXPLAIN ANALYZE
SELECT *
FROM Customer_Order
WHERE City = 'Lucknow';

CREATE INDEX idx_city
ON Customer_Order(City);

-- Query 1 AFTER index
EXPLAIN ANALYZE
SELECT *
FROM Customer_Order
WHERE City = 'Lucknow';

-- 3. Query 2: Customer and date filter BEFORE index
EXPLAIN ANALYZE
SELECT *
FROM Customer_Order
WHERE Customer_ID = 1250
AND Order_Date BETWEEN '2026-02-01' AND '2026-06-30';

CREATE INDEX idx_customer_date
ON Customer_Order(Customer_ID, Order_Date);

-- Query 2 AFTER index
EXPLAIN ANALYZE
SELECT *
FROM Customer_Order
WHERE Customer_ID = 1250
AND Order_Date BETWEEN '2026-02-01' AND '2026-06-30';

-- 4. Query 3: Function on date column
EXPLAIN ANALYZE
SELECT COUNT(*) AS Total_Orders
FROM Customer_Order
WHERE YEAR(Order_Date) = 2026;

-- Optimized date range query
EXPLAIN ANALYZE
SELECT COUNT(*) AS Total_Orders
FROM Customer_Order
WHERE Order_Date >= '2026-01-01'
AND Order_Date < '2027-01-01';

-- 5. Query 4: Category and status BEFORE index
EXPLAIN ANALYZE
SELECT *
FROM Customer_Order
WHERE Product_Category = 'Electronics'
AND Order_Status = 'DELIVERED';

CREATE INDEX idx_category_status
ON Customer_Order(Product_Category, Order_Status);

-- Query 4 AFTER index
EXPLAIN ANALYZE
SELECT *
FROM Customer_Order
WHERE Product_Category = 'Electronics'
AND Order_Status = 'DELIVERED';

-- 6. Query 5: City-wise sales aggregation
EXPLAIN ANALYZE
SELECT City, SUM(Total_Amount) AS Total_Sales
FROM Customer_Order
GROUP BY City
ORDER BY Total_Sales DESC;

CREATE INDEX idx_city_total
ON Customer_Order(City, Total_Amount);

-- Query 5 AFTER index
EXPLAIN ANALYZE
SELECT City, SUM(Total_Amount) AS Total_Sales
FROM Customer_Order
GROUP BY City
ORDER BY Total_Sales DESC;

-- 7. Display created indexes
SHOW INDEX FROM Customer_Order;
