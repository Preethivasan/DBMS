USE Product_Management;

-- Creating Order Table -- 

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    OrderStatus VARCHAR(20)
);

-- Creating Order Details Table --

CREATE TABLE Order_Details (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Inserting Values into Order Table --

INSERT INTO Orders
(OrderID, CustomerName, OrderDate, TotalAmount, OrderStatus)
VALUES
(501, "Vinod", '2026-08-01', 2500.00, 'Delivered'),
(502, "Anu", '2026-08-02', 1500.00, 'Pending'),
(503, "Radha", '2026-08-05', 3200.00, 'Shipped'),
(504, "Ajay", '2026-08-07', 1800.00, 'Delivered');

-- Inserting Values into Order Details Table -- 

INSERT INTO Order_Details
(OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 501, 1, 2, 1000.00),
(2, 501, 3, 1, 500.00),
(3, 502, 2, 1, 1500.00),
(4, 503, 1, 2, 1000.00),
(5, 503, 4, 1, 1200.00),
(6, 504, 3, 2, 900.00);

-- Displaying Order Table --

SELECT * FROM Orders;

-- Displaying Order Details Table --

SELECT * FROM Order_Details;

-- Updating OrderStatus --

UPDATE Orders
SET OrderStatus = "Shipped"
Where OrderID = 502;

UPDATE Orders
SET OrderStatus = "Delivered"
Where OrderID = 503;

-- Displaying Custome Order History -- 

SELECT * FROM Orders
ORDER BY CustomerName, OrderDate;

-- Selected Customer Order History --

SELECT * FROM Orders
WHERE CustomerName = "Anu";
ORDER BY OrderDate;

-- Pending Orders --

SELECT * FROM Orders
Where OrderStatus = "Pending";

-- Shipped Orders --

SELECT * FROM Orders
Where OrderStatus = "Shipped";

-- Delivered Orders --

SELECT * FROM Orders
Where OrderStatus = "Delivered"

-- Total Orders Per Customer --

SELECT Count(*) From Orders
Group By CustomerName;

-- Total Amount Spent By Customers -- 

SELECT SUM(TotalAmount) From Orders
Group By CustomerName;


