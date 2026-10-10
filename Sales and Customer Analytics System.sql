USE Product_Management;

-- The total number of products--

SELECT COUNT(*) AS TotalProducts
FROM Product;

-- The average, minimum, and maximum product price --

SELECT AVG(Price) AS AveragePrice,
       MIN(Price) AS MinimumPrice,
       MAX(Price) AS MaximumPrice
FROM Product;

-- The total number of categories --

SELECT COUNT(*) AS TotalCategories
FROM Category;

-- The total number of sellers --

SELECT COUNT(*) AS TotalSellers
FROM Seller;

-- The total available stock --

SELECT SUM(Stock) AS TotalStock
FROM Inventory;

-- The total sales amount --

SELECT SUM(TotalAmount) AS TotalSales
FROM Orders;

-- The total number of orders --

SELECT COUNT(*) AS TotalOrders
FROM Orders;

-- The average, minimum, and maximum order amount --

SELECT AVG(TotalAmount) AS AverageAmount,
       MIN(TotalAmount) AS MinimumAmount,
       MAX(TotalAmount) AS MaximumAmount
FROM Orders;

-- Total payment received --

SELECT SUM(PaymentAmount) AS TotalPayment
FROM Payment;

-- Count of payments by payment method --

SELECT PaymentMode,
       COUNT(*) AS TotalPayments
FROM Payment
GROUP BY PaymentMode;

-- The total payment amount for each payment status --

SELECT PaymentStatus,
       SUM(PaymentAmount) AS TotalAmount
FROM Payment
GROUP BY PaymentStatus;

-- The total quantity sold for each product --

SELECT ProductID,
       SUM(Quantity) AS TotalQuantitySold
FROM Order_Details
GROUP BY ProductID;

-- Best-selling products --

SELECT ProductID,
       SUM(Quantity) AS TotalQuantitySold
FROM Order_Details
GROUP BY ProductID
ORDER BY TotalQuantitySold DESC;

-- Sales value for each product --

SELECT ProductID,
       SUM(Quantity * UnitPrice) AS TotalSales
FROM Order_Details
GROUP BY ProductID;

-- Products priced above the average price--

SELECT *
FROM Product
WHERE Price > (
    SELECT AVG(Price)
    FROM Product
);

-- Count products in each category --

SELECT CategoryID,
       COUNT(*) AS TotalProducts
FROM Product
GROUP BY CategoryID;

-- Calculate category-wise sales --

SELECT Product.CategoryID,
       SUM(Order_Details.Quantity *
           Order_Details.UnitPrice) AS CategorySales
FROM Product
INNER JOIN Order_Details
ON Product.ProductID = Order_Details.ProductID
GROUP BY Product.CategoryID;

-- Category names with their total sales--

SELECT Category.CategoryName,
       SUM(Order_Details.Quantity *
           Order_Details.UnitPrice) AS TotalSales
FROM Category
INNER JOIN Product
ON Category.CategoryID = Product.CategoryID
INNER JOIN Order_Details
ON Product.ProductID = Order_Details.ProductID
GROUP BY Category.CategoryID, Category.CategoryName;