-- =====================================================
-- EXPERIMENT 2: E-COMMERCE RELATIONAL SCHEMA
-- Aim: Implement relational schema using MySQL
-- =====================================================

CREATE DATABASE IF NOT EXISTS EcommerceDB;
USE EcommerceDB;

-- 1. CUSTOMER TABLE
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone_No VARCHAR(15) UNIQUE
);

-- 2. SELLER TABLE
CREATE TABLE Seller (
    Seller_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone_No VARCHAR(15) UNIQUE,
    GST_No VARCHAR(20) UNIQUE
);

-- 3. CATEGORY TABLE
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(200)
);

-- 4. ADDRESS TABLE
CREATE TABLE Address (
    Address_ID INT PRIMARY KEY,
    House_No VARCHAR(20) NOT NULL,
    Street VARCHAR(100),
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Pincode VARCHAR(10) NOT NULL,
    Customer_ID INT,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
        ON DELETE SET NULL
);

-- 5. PRODUCT TABLE
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Description VARCHAR(200),
    Seller_ID INT,
    Category_ID INT,
    FOREIGN KEY (Seller_ID)
        REFERENCES Seller(Seller_ID)
        ON DELETE SET NULL,
    FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID)
        ON DELETE SET NULL
);

-- 6. ORDERS TABLE
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE NOT NULL,
    Status VARCHAR(30) NOT NULL,
    Customer_ID INT NOT NULL,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE
);

-- 7. ORDER ITEM TABLE
CREATE TABLE Order_Item (
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
        ON DELETE CASCADE
);

-- 8. PAYMENT TABLE
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Method VARCHAR(30) NOT NULL,
    Order_ID INT NOT NULL UNIQUE,
    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
        ON DELETE CASCADE
);

-- 9. DELIVERY TABLE
CREATE TABLE Delivery (
    Delivery_ID INT PRIMARY KEY,
    Delivery_Date DATE,
    Status VARCHAR(30) NOT NULL,
    Courier_Name VARCHAR(100),
    Tracking_No VARCHAR(50) UNIQUE,
    Order_ID INT NOT NULL UNIQUE,
    Address_ID INT,
    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Address_ID)
        REFERENCES Address(Address_ID)
        ON DELETE SET NULL
);

-- =====================================================
-- INSERT SAMPLE DATA
-- =====================================================

INSERT INTO Customer
VALUES
(1, 'Kavya Kushwaha', 'kavya@gmail.com', '9876523214'),
(2, 'Rahul Sharma', 'rahul@gmail.com', '8707654321');

INSERT INTO Seller
VALUES
(101, 'Tech Store', 'tech@gmail.com', '8701432198', 'GST12345'),
(102, 'Fashion Hub', 'fashion@gmail.com', '9651432186', 'GST54321');

INSERT INTO Category
VALUES
(201, 'Electronics', 'Electronic products'),
(202, 'Clothing', 'Clothing products');

INSERT INTO Address
VALUES
(301, '12A', 'MG Road', 'Lucknow', 'Uttar Pradesh', '226001', 1),
(302, '258', 'Park Road', 'Delhi', 'Delhi', '110012', 2);

INSERT INTO Product
VALUES
(401, 'Laptop', 55000.00, 'Gaming Laptop', 101, 201),
(402, 'T-Shirt', 999.00, 'Cotton T-Shirt', 102, 202);

INSERT INTO Orders
VALUES
(501, '2026-08-19', 'Confirmed', 1),
(502, '2026-08-19', 'Pending', 2);

INSERT INTO Order_Item
VALUES
(501, 401, 1),
(502, 402, 2);

INSERT INTO Payment
VALUES
(601, '2026-08-19', 55000.00, 'UPI', 501),
(602, '2026-08-19', 1998.00, 'COD', 502);

INSERT INTO Delivery
VALUES
(701, '2026-08-22', 'Shipped', 'BlueDart', 'TRK001', 501, 301),
(702, '2026-08-23', 'Pending', 'Delhivery', 'TRK002', 502, 302);

-- =====================================================
-- REFERENTIAL INTEGRITY TESTS
-- Run each invalid INSERT separately.
-- These statements should fail due to foreign keys.
-- =====================================================

-- Test 1: Invalid Customer_ID
-- INSERT INTO Orders
-- VALUES (503, '2026-08-19', 'Pending', 999);

-- Test 2: Invalid Product_ID
-- INSERT INTO Order_Item
-- VALUES (501, 999, 1);

-- =====================================================
-- ON DELETE CASCADE TEST
-- Run only when you want to delete Customer 1.
-- Related orders and dependent records may be deleted.
-- =====================================================

-- DELETE FROM Customer WHERE Customer_ID = 1;

-- =====================================================
-- ON DELETE SET NULL TEST
-- Run only when you want to delete Seller 101.
-- The Seller_ID in the related Product becomes NULL.
-- =====================================================

-- DELETE FROM Seller WHERE Seller_ID = 101;

-- END OF EXPERIMENT 2
