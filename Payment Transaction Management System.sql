USE Product_Management;

-- Creating Payment Table --

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentMode VARCHAR(20),
    PaymentDate DATE,
    PaymentAmount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting Values into Payment Table --

INSERT INTO Payment
VALUES
(1, 501, 'UPI', '2026-08-01', 2500.00, 'Successful'),
(2, 502, 'Card', '2026-08-02', 1800.00, 'Successful'),
(3, 503, 'Cash', '2026-08-03', 1200.00, 'Failed'),
(4, 504, 'UPI', '2026-08-04', 3500.00, 'Successful');

-- Diaplaying Payment Records --

SELECT * FROM Payment;

-- Displaying Successful Transactions --

SELECT * FROM Payment
WHERE PaymentStatus = "Successful";

-- Displaying Failed Transactions --

SELECT * FROM Payment
Where PaymentStatus = "Failed";

-- Diaplaying Payment based on Payment Mode -- 

SELECT * FROM Payment
WHERE PaymentMode = "UPI";

SELECT * FROM Payment
WHERE PaymentMode = "Card";

SELECT * FROM Payment
WHERE PaymentMode = "Cash";

-- Total Transaction for Each Payment Mode --

SELECT PaymentMode, COUNT(*) AS TotalTransactions
FROM Payment
GROUP BY PaymentMode;

-- Total Amount Recieved From Each Transaction Mode --

SELECT PaymentMode, SUM(PaymentAmount) AS TotalAmount
FROM Payment
WHERE PaymentStatus = 'Successful'
GROUP BY PaymentMode;

-- Count successful and failed transactions --

SELECT PaymentStatus, COUNT(*) AS TotalTransactions
FROM Payment
GROUP BY PaymentStatus;

-- Total successful payment amount --

SELECT SUM(PaymentAmount) AS TotalSuccessfulAmount
FROM Payment
WHERE PaymentStatus = 'Successful';

-- Payment Transaction Report by PaymentDate --

SELECT * FROM Payment
ORDER BY PaymentDate;


