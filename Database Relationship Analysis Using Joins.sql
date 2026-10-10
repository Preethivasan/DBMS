USE Product_Management;

-- Display order details with product IDs and quantities --

SELECT Orders.OrderID,
       Order_Details.ProductID,
       Order_Details.Quantity
FROM Orders
INNER JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID;

-- Display all orders, including orders without order details --

SELECT Orders.OrderID,
       Order_Details.ProductID
FROM Orders
LEFT JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID;

-- Display all order details using RIGHT JOIN --

SELECT Orders.OrderID,
       Order_Details.ProductID,
       Order_Details.Quantity
FROM Orders
RIGHT JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID;

-- Display order details along with payment information --

SELECT Orders.OrderID,
       Orders.TotalAmount,
       Payment.PaymentMode,
       Payment.PaymentAmount
FROM Orders
INNER JOIN Payment
ON Orders.OrderID = Payment.OrderID;

-- Display product names with their category names --

SELECT Product.ProductName,
       Category.CategoryName
FROM Product
INNER JOIN Category
ON Product.CategoryID = Category.CategoryID;

-- Complete order report with product and payment details --

SELECT Orders.OrderID,
       Orders.OrderDate,
       Product.ProductName,
       Order_Details.Quantity,
       Payment.PaymentStatus
FROM Orders
INNER JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID
INNER JOIN Product
ON Order_Details.ProductID = Product.ProductID
LEFT JOIN Payment
ON Orders.OrderID = Payment.OrderID;