-- ================================================
-- SQL Customer Analysis Project
-- Author: nmujtaba01-debug
-- GitHub: github.com/nmujtaba01-debug
-- Platform: W3Schools Northwind Database
-- Description: Real business analysis using SQL
-- ================================================

-- Q1: Total number of customers
SELECT COUNT(*) AS Total_customers
FROM Customers;

-- Q2: Top 5 countries with most customers
SELECT TOP 5 Country,
COUNT(*) AS Total_customers
FROM Customers
GROUP BY Country
ORDER BY Total_customers DESC;

-- Q3: European countries grouped together
SELECT Country,
COUNT(*) AS Total_customers
FROM Customers
WHERE Country = 'Germany'
OR Country = 'France'
OR Country = 'UK'
OR Country = 'Spain'
OR Country = 'Italy'
GROUP BY Country
ORDER BY Total_customers DESC;

-- Q4: Cities with more than 2 customers
SELECT Country,
COUNT(*) AS Total_customers
FROM Customers
GROUP BY Country
HAVING COUNT(*) > 2
ORDER BY Total_customers DESC;

-- Q5: Customers with names starting A to D
SELECT CustomerName
FROM Customers
WHERE CustomerName LIKE 'A%'
OR CustomerName LIKE 'B%'
OR CustomerName LIKE 'C%'
OR CustomerName LIKE 'D%'
ORDER BY CustomerName ASC;

-- Q6: Customers with more than 3 orders
SELECT Customers.CustomerName,
COUNT(*) AS Total_orders
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName
HAVING COUNT(*) > 3
ORDER BY Total_orders DESC;

-- Q7: Customers who ordered in 1997
SELECT Customers.CustomerName,
Orders.OrderDate
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate LIKE '%1997%'
ORDER BY CustomerName DESC;

-- Q8: Orders placed each year
SELECT '1996' AS Year,
COUNT(*) AS Total_orders
FROM Orders
WHERE OrderDate LIKE '1996%'
UNION
SELECT '1997' AS Year,
COUNT(*) AS Total_orders
FROM Orders
WHERE OrderDate LIKE '1997%'
UNION
SELECT '1998' AS Year,
COUNT(*) AS Total_orders
FROM Orders
WHERE OrderDate LIKE '1998%'
ORDER BY Year ASC;

-- Q9: Shipper with most deliveries
SELECT Shippers.ShipperName,
COUNT(*) AS Total_orders
FROM Shippers
JOIN Orders
ON Shippers.ShipperID = Orders.ShipperID
GROUP BY ShipperName
ORDER BY COUNT(*) DESC;

-- Q10: German customers order count
SELECT Customers.CustomerName,
COUNT(*) AS Total_orders
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.Country = 'Germany'
GROUP BY CustomerName
ORDER BY Total_orders DESC;
