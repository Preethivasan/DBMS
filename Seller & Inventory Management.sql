USE Product_Management;

-- Creating Table Seller --

CREATE TABLE Seller
(
  SellerID INT PRIMARY KEY,
  SellerName VARCHAR(50),
  Contact VARCHAR(10),
  EMailID VARCHAR(50)
);

-- Creating Table Inventory --

CREATE TABLE Inventory
(
  InventoryID INT PRIMARY KEY,
  SellerID INT,
  ProductID INT,
  Stock INT,
  AvailablityStatus VARCHAR(20),
  
  FOREIGN KEY (SellerID)
  REFERENCES Seller(SellerID),
  
  FOREIGN KEY (ProductID)
  REFERENCES Product(ProductID)
);

-- Inserting Values Into Seller Table --

INSERT INTO Seller VALUES
(302, 'Fresh Mart', '9876543211', 'freshmart@gmail.com'),
(303, 'Super Stores', '9876543212', 'superstores@gmail.com'),
(304, 'Daily Needs', '9876543213', 'dailyneeds@gmail.com');

INSERT INTO Seller VALUES
(301, 'ABC Traders', '9876543210', 'abc@gmail.com');

-- Display Seller Information --

SELECT * FROM Seller;

-- Inserting values into Inventory Table --

INSERT INTO Inventory VALUES
(1, 301, 1, 50, 'Available'),
(2, 302, 1, 0, 'Unavailable'),
(3, 302, 2, 25, 'Available'),
(4, 303, 2, 0, 'Unavailable'),
(5, 304, 3, 100, 'Available');

-- Display Inventory Information --

SELECT * FROM Inventory;

-- Display Information Where Stock Quantity is low --

SELECT InventoryID FROM Inventory
WHERE Stock < 20;

-- Display Information where Stock Quantity is high --

SELECT * FROM Inventory
WHERE Stock < 20;

-- Display Information where Products have no Stock --

SELECT * FROM Inventory
WHERE Stock = 0;

-- Update Product Information in Inventory --

UPDATE Inventory
SET AvailablityStatus = "Unavailable",
Stock = 0
WHERE InventoryID = 3;

-- Update Product Information in Inventory --

UPDATE Inventory
SET AvailablityStatus = "Available",
Stock = 100
WHERE InventoryID = 2;

-- Display Available Products --
 
SELECT * FROM Inventory
Where AvailablityStatus = "Available";

-- Display Unavailable Products --

SELECT * FROM Inventory
WHERE AvailablityStatus = "Unavailable";

-- Display Products Using Seller Information --

SELECT * FROM Inventory
WHERE SellerID = 302;

-- Count of Available Products in Inventory --

SELECT COUNT(*) FROM Inventory
WHERE AvailablityStatus = "Available";

-- Count of Unavailable Products in Inventory --

SELECT COUNT(*) FROM Inventory
WHERE AvailablityStatus = "Unavailable";

-- Display Inventory in Order of Stock -- 
SELECT * FROM Inventory
ORDER BY Stock Desc;
