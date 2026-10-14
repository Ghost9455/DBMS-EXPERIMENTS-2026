-- =====================================================
-- EXPERIMENT 1: E-COMMERCE ER DIAGRAM
-- Database: EcommerceDB
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

-- 7. ORDER_ITEM TABLE
CREATE TABLE Order_Item (
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(5,2) DEFAULT 0,
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
    Payment_Date DATE,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Method VARCHAR(30),
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

-- END OF EXPERIMENT 1
