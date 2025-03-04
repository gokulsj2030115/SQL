CREATE DATABASE Practise;
USE Practise;


-- SET OPERATORS --

SELECT * FROM Customers_2024
SELECT * FROM Customers_2025


-- COMBINE THE  DATA FROM CUSTOMERS 2024 & 2025 --


	SELECT customer_id, name, city FROM Customers_2024

	UNION

	SELECT customer_id, name, city FROM Customers_2025;


-- COMBINE THE  DATA FROM CUSTOMERS 2024 & 2025 (INCLUSING DUPLICATES) --

	SELECT customer_id, name, city FROM Customers_2024

	UNION ALL

	SELECT customer_id, name, city FROM Customers_2025;


-- CUSTOMERS WHO ARE NOT SAME IN BOTH YEARS --

	SELECT customer_id, name, city FROM Customers_2024

	EXCEPT

	SELECT customer_id, name, city FROM Customers_2025;



	SELECT customer_id, name, city FROM Customers_2025

	EXCEPT

	SELECT customer_id, name, city FROM Customers_2024;


-- SAME CUSTOMERS IN BOTH 2024, 2025 --

	SELECT customer_id, name, city FROM Customers_2025

	INTERSECT

	SELECT customer_id, name, city FROM Customers_2024;



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    total_amount DECIMAL(10,2)
);

CREATE TABLE OrdersArchive (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders (order_id, customer_name, order_date, total_amount) VALUES
(1, 'Alice', '2024-03-01', 100.50),
(2, 'Bob', '2024-03-02', 200.75),
(3, 'Charlie', '2024-03-03', 150.00),
(4, 'David', '2024-03-04', 300.25),
(5, 'Emma', '2024-03-05', 250.00),
(6, 'Frank', '2024-03-06', 400.50),
(7, 'Grace', '2024-03-07', 175.25),
(8, 'Henry', '2024-03-08', 500.00),
(9, 'Ivy', '2024-03-09', 220.75),
(10, 'Jack', '2024-03-10', 310.60);

INSERT INTO OrdersArchive (order_id, customer_name, order_date, total_amount) VALUES
(6, 'Frank', '2024-03-06', 400.50),
(7, 'Grace', '2024-03-07', 175.25),
(8, 'Henry', '2024-03-08', 500.00),
(9, 'Ivy', '2024-03-09', 220.75),
(10, 'Jack', '2024-03-10', 310.60),
(11, 'Kate', '2024-03-11', 450.00),
(12, 'Leo', '2024-03-12', 280.40),
(13, 'Mia', '2024-03-13', 330.20),
(14, 'Nina', '2024-03-14', 390.75),
(15, 'Oscar', '2024-03-15', 275.50);



-- COMBINE ALL ORDERS & Orderss Archive --
-- Combine withoout duplicate --

SELECT  * FROM [dbo].[Orders] 

UNION

SELECT * FROM [dbo].[OrdersArchive];

