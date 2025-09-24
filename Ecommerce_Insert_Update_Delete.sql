CREATE DATABASE ECommerceDataBase;
USE ECommerceDataBase;
--Creating tables
--Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at DATE
);
--products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    category VARCHAR(50)
);
--Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
--payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

--insert statements with nulls and defaults
-- Insert a new customer with missing email
INSERT INTO Customers (customer_id, name, email, created_at)
VALUES (6, 'Divya Menon', NULL, '2023-09-01');

-- Insert a new product with default category
INSERT INTO Products (product_id, name, price, category)
VALUES (106, 'USB-C Cable', 299.00, NULL);

-- Insert an order with valid references
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity)
VALUES (1009, 6, 106, '2023-09-05', 2);

-- Insert a payment with missing payment method
INSERT INTO Payments (payment_id, order_id, amount, payment_date, payment_method)
VALUES (5009, 1009, 598.00, '2023-09-05', NULL);


--Update statements with WHERE condition
-- Update missing email for Divya
UPDATE Customers
SET email = 'divya@example.com'
WHERE customer_id = 6;

-- Assign default category to USB-C Cable
UPDATE Products
SET category = 'Accessories'
WHERE product_id = 106;

-- Correct quantity for an order
UPDATE Orders
SET quantity = 3
WHERE order_id = 1009;

-- Add payment method for missing entry
UPDATE Payments
SET payment_method = 'UPI'
WHERE payment_id = 5009;

--DELETE statement with WHERE condition
-- Delete a customer who requested account removal
DELETE FROM Orders
WHERE customer_id = 5;
DELETE FROM Customers
WHERE customer_id = 5;

-- Delete an order that was canceled
DELETE FROM Orders
WHERE order_id = 1006;

-- Delete associated payment for canceled order
DELETE FROM Payments
WHERE order_id = 1006;