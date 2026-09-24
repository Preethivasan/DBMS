USE Product_Management;


-- Display all categories --

SELECT * FROM Category;

-- Display category names --

SELECT CategoryName
FROM Category;

-- Find a particular category --

SELECT * FROM Category
WHERE CategoryID = 1;

-- Search category by name --

SELECT * FROM Category
WHERE CategoryName = 'Electronics';

-- Sort categories --

SELECT * FROM Category
ORDER BY CategoryName ASC;

-- Display unique category names --

SELECT DISTINCT CategoryName
FROM Category;

-- Display all products --

SELECT * FROM Product;

-- Find products above a particular price --

SELECT * FROM Product
WHERE Price > 1000;

-- Find products within a price range --

SELECT * FROM Product
WHERE Price BETWEEN 500 AND 2000;

-- Find products by category --

SELECT * FROM Product
WHERE CategoryID = 1;

-- Sort products by price --

SELECT * FROM Product
ORDER BY Price DESC;

-- Find average product price --

SELECT AVG(Price) AS Average_Price
FROM Product;

-- Display all sellers --

SELECT * FROM Seller;

-- Find a particular seller --

SELECT * FROM Seller
WHERE SellerID = 1;

-- Search seller by name --

SELECT * FROM Seller
WHERE SellerName = 'ABC Traders';

-- Sort sellers by name --

SELECT * FROM Seller
ORDER BY SellerName ASC;

-- Display all inventory --

SELECT * FROM Inventory;

-- Find inventory for a product --

SELECT * FROM Inventory
WHERE ProductID = 1;

-- Find low-stock products --

SELECT * FROM Inventory
WHERE Stock < 10;

-- Find out-of-stock products --

SELECT * FROM Inventory
WHERE Stock = 0;

-- Sort inventory by stock --

SELECT * FROM Inventory
ORDER BY Stock DESC;

-- Calculate total stock --

SELECT SUM(Stock) AS Total_Stock
FROM Inventory;

-- Display all orders --

SELECT * FROM Orders;

-- Find pending orders --

SELECT * FROM Orders
WHERE OrderStatus = 'Pending';

-- Find delivered orders --

SELECT * FROM Orders
WHERE OrderStatus = 'Delivered';

-- Find high-value orders --

SELECT * FROM Orders
WHERE TotalAmount > 2000;

-- Sort orders by amount --

SELECT * FROM Orders
ORDER BY TotalAmount DESC;

-- Calculate total sales --

SELECT SUM(TotalAmount) AS Total_Sales
FROM Orders;

-- Count orders by status --
SELECT OrderStatus, COUNT(*) AS Number_of_Orders
FROM Orders
GROUP BY OrderStatus;

-- Display all order details --

SELECT * FROM Order_Details;

-- Find details of an order --

SELECT * FROM Order_Details
WHERE OrderID = 101;

-- Find details of a product --

SELECT * FROM Order_Details
WHERE ProductID = 1;

-- Find orders with quantity greater than 2 --

SELECT * FROM Order_Details
WHERE Quantity > 2;

-- Sort by quantity --

SELECT * FROM Order_Details
ORDER BY Quantity DESC;

-- Calculate total quantity ordered --

SELECT SUM(Quantity) AS Total_Quantity
FROM Order_Details;

-- Display all payments --

SELECT * FROM Payment;

-- Find successful payments --

SELECT * FROM Payment
WHERE PaymentStatus = 'Success';

-- Find pending payments --

SELECT * FROM Payment
WHERE PaymentStatus = 'Pending';

-- Find payments above ₹1000 --

SELECT * FROM Payment
WHERE PaymentAmount > 1000;

-- Sort payments by amount --

SELECT * FROM Payment
ORDER BY PaymentAmount DESC;

-- Calculate total payment amount --

SELECT SUM(PaymentAmount) AS Total_Payment
FROM Payment;

-- Display all reviews --

SELECT * FROM Review;
-- Find reviews for a product --

SELECT * FROM Review
WHERE ProductID = 1;

-- Find a customer's review --

SELECT * FROM Review
WHERE CustomerName = 'Arun';

-- Search reviews containing "good" --

SELECT * FROM Review
WHERE Review_text LIKE '%good%';

-- Sort reviews by date --

SELECT * FROM Review
ORDER BY Review_date DESC;

-- Find unique products with reviews --

SELECT DISTINCT ProductID
FROM Review;

-- Count total reviews --

SELECT COUNT(*) AS Total_Reviews
FROM Review;

-- Display all ratings --

SELECT * FROM Rating;

-- Find highly rated reviews --

SELECT * FROM Rating
WHERE Rating >= 4;

-- Find low-rated reviews --

SELECT * FROM Rating
WHERE Rating <= 2;

-- Find average rating --

SELECT AVG(Rating) AS Average_Rating
FROM Rating;

-- Find highest rating --

SELECT MAX(Rating) AS Highest_Rating
FROM Rating;

-- Count ratings by rating value --

SELECT Rating, COUNT(*) AS Number_of_Ratings
FROM Rating
GROUP BY Rating;

