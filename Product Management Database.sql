CREATE DATABASE ECommerce;

USE ECommerce;

CREATE TABLE Category
(
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Product
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT,
    CategoryID INT,
    FOREIGN KEY (CategoryID)
    REFERENCES Category(CategoryID)
);

INSERT INTO Category VALUES
(101,'Electronics'),
(102,'Furniture'),
(103,'Clothing');

INSERT INTO Product VALUES
(1,'Laptop',55000,15,101),
(2,'Smartphone',25000,30,101),
(3,'Office Chair',6500,20,102),
(4,'Dining Table',18000,8,102),
(5,'T-Shirt',700,50,103);

SELECT * FROM Category;

SELECT * FROM Product;

UPDATE Product
SET Price = 57000,
    Stock = 12
WHERE ProductID = 1;

SELECT * FROM Product;

DELETE FROM Product
WHERE ProductID = 5;

SELECT * FROM Product;

SELECT CategoryID, ProductName, Price, Stock
FROM Product
ORDER BY CategoryID;

