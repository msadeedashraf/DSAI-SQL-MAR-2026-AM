# DP-080 T-SQL Case Study Questions
_Author: Microsoft Learn-based T-SQL Learning Support_  
_Based on: https://learn.microsoft.com/en-us/training/paths/get-started-querying-with-transact-sql/_

This document contains 5 real-world, case-study-based questions that help students apply concepts learned in the DP-080 course. These questions test and reinforce understanding of SELECT queries, filtering, joins, grouping, sorting, and aggregations using realistic business data scenarios.





---

## 🗃️ Tables Used

### `Customers`
| customer_id | first_name | last_name | country     | email                |
|-------------|------------|-----------|-------------|----------------------|
| 1           | Alice      | Smith     | USA         | alice@contoso.com    |
| 2           | Bob        | Lee       | Canada      | bob@contoso.com      |
| 3           | Carla      | Gonzalez  | Mexico      | carla@contoso.com    |
| 4           | Daniel     | Brown     | USA         | daniel@contoso.com   |

---

### `Orders`
| order_id | customer_id | order_date | total_amount |
|----------|-------------|------------|--------------|
| 1001     | 1           | 2023-01-15 | 250.00       |
| 1002     | 2           | 2023-02-10 | 480.00       |
| 1003     | 1           | 2023-03-22 | 130.00       |
| 1004     | 3           | 2023-01-20 | 90.00        |
| 1005     | 4           | 2023-02-28 | 320.00       |

---

### `Products`
| product_id | product_name     | category    | unit_price |
|------------|------------------|-------------|------------|
| 501        | Wireless Mouse   | Electronics | 25.00      |
| 502        | HDMI Cable       | Electronics | 10.00      |
| 503        | Coffee Mug       | Kitchen     | 12.00      |
| 504        | Desk Lamp        | Office      | 45.00      |

---

### `OrderDetails`
| order_id | product_id | quantity |
|----------|------------|----------|
| 1001     | 501        | 2        |
| 1001     | 503        | 4        |
| 1002     | 504        | 5        |
| 1003     | 502        | 3        |
| 1004     | 503        | 2        |
| 1005     | 501        | 1        |
| 1005     | 504        | 3        |

---


```
CREATE DATABASE AssignmentDB;
GO

USE AssignmentDB;
GO

-- Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    country NVARCHAR(50),
    email NVARCHAR(100)
);

-- Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(100),
    category NVARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- OrderDetails
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Customers (customer_id, first_name, last_name, country, email)
VALUES
(1, 'Alice', 'Smith', 'USA', 'alice@contoso.com'),
(2, 'Bob', 'Lee', 'Canada', 'bob@contoso.com'),
(3, 'Carla', 'Gonzalez', 'Mexico', 'carla@contoso.com'),
(4, 'Daniel', 'Brown', 'USA', 'daniel@contoso.com');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
(1001, 1, '2023-01-15', 250.00),
(1002, 2, '2023-02-10', 480.00),
(1003, 1, '2023-03-22', 130.00),
(1004, 3, '2023-01-20', 90.00),
(1005, 4, '2023-02-28', 320.00);


INSERT INTO Products (product_id, product_name, category, unit_price)
VALUES
(501, 'Wireless Mouse', 'Electronics', 25.00),
(502, 'HDMI Cable', 'Electronics', 10.00),
(503, 'Coffee Mug', 'Kitchen', 12.00),
(504, 'Desk Lamp', 'Office', 45.00);

INSERT INTO OrderDetails (order_id, product_id, quantity)
VALUES
(1001, 501, 2),
(1001, 503, 4),
(1002, 504, 5),
(1003, 502, 3),
(1004, 503, 2),
(1005, 501, 1),
(1005, 504, 3);


```

## 🧠 Case Study Questions

### ✅ Case Study 1: Top-Spending Customer
**Scenario:**  
As a business analyst, you’re tasked with identifying the customer who has spent the most across all orders.

**Question:**  
Write a T-SQL query to find the full name and total amount spent by each customer. Display the top spender first.

**Concepts Tested:**  
- `JOIN`
- `GROUP BY`
- `ORDER BY`
- Aggregates (`SUM`)

---

### ✅ Case Study 2: Product Sales by Category
**Scenario:**  
The marketing department wants to know the total quantity of items sold, grouped by product category.

**Question:**  
Write a query that joins the `OrderDetails` and `Products` tables and returns the category name and total quantity sold per category.

**Concepts Tested:**  
- `JOIN`
- `GROUP BY`
- Aggregates (`SUM`)

---

### ✅ Case Study 3: Filter Orders from the USA
**Scenario:**  
You want to analyze order behavior specifically for customers from the USA.

**Question:**  
Write a T-SQL query that retrieves all orders (with total amounts) placed by customers located in the USA. Include the customer’s full name and order date.

**Concepts Tested:**  
- `JOIN`
- `WHERE`
- Filtering by `country`

---

### ✅ Case Study 4: Product Popularity
**Scenario:**  
Management is evaluating product popularity.

**Question:**  
Write a T-SQL query that lists the product names and total units sold for each product, sorted from most to least popular.

**Concepts Tested:**  
- `JOIN`
- `GROUP BY`
- `ORDER BY`

---

### ✅ Case Study 5: Orders in a Date Range
**Scenario:**  
You are reviewing the sales made between February 1 and March 31, 2023.

**Question:**  
Write a T-SQL query to return all orders placed within that date range. Include customer name, order date, and total amount.

**Concepts Tested:**  
- `WHERE`
- Date filtering using `BETWEEN`
- `JOIN`

---

## ✅ Bonus: Build Your Own
Encourage students to expand the case studies by:
- Adding a `Payments` table with payment types and amounts
- Using `CASE` statements to categorize orders by amount
- Exploring `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN` implications

---

