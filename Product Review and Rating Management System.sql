USE Product_Management;

-- Creating Review Table --

CREATE TABLE Review (
    Reviewid INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    ProductID INT,
    Review_text VARCHAR(500),
    Review_date DATE,
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Creating Rating Table --

CREATE TABLE Rating (
    Rating_id INT PRIMARY KEY,
    Reviewid INT,
    Rating INT,
    FOREIGN KEY (Reviewid) REFERENCES Review(Reviewid)
);

-- Inserting Data into Review Table --

-- Insert Reviews --

INSERT INTO Review
VALUES
(1, 'Arun', 1, 'Good product', '2026-09-20'),
(2, 'Priya', 1, 'Very useful product', '2026-09-21'),
(3, 'Karthik', 3, 'Average product', '2026-09-22'),
(4, 'Divya', 2, 'Good quality', '2026-09-23'),
(5, 'Rahul', 4, 'Excellent product', '2026-09-23'),
(6, 'Anitha', 2, 'Worth the price', '2026-09-24'),
(7, 'Vijay', 4, 'Poor quality', '2026-09-24'),
(8, 'Meena', 4, 'Not satisfied', '2026-09-24'),
(9, 'Suresh', 3, 'Amazing product', '2026-09-24'),
(10, 'Lakshmi', 3, 'Very good product', '2026-09-24');

-- Inserting Data into Rating Table -- 

INSERT INTO Rating
VALUES
(101, 1, 5),
(102, 2, 4),
(103, 3, 3),
(104, 4, 4),
(105, 5, 5),
(106, 6, 5),
(107, 7, 2),
(108, 8, 1),
(109, 9, 5),
(110, 10, 4);

-- Display Review Table --

SELECT * FROM Review;

-- Display Rating Table --

SELECT * FROM Rating;

-- Retrieve Product Review Details --

SELECT * FROM Review
WHERE ProductID = 1;

SELECT * FROM Review
WHERE ProductID = 3;

-- Reviews by a Particular Customer -- 

SELECT * FROM Review
WHERE CustomerName = 'Arun';

-- Reviews Containing "good" --

SELECT * FROM Review
WHERE Review_text LIKE '%good%';

-- Reviews Containing "poor" --

SELECT * FROM Review
WHERE Review_text LIKE '%poor%';

-- Reviews in Date Order --

SELECT * FROM Review
ORDER BY Review_date DESC;

-- Ratings Greater Than 3 -- 

SELECT * FROM Rating
WHERE Rating > 3; 

-- Highly Rated Reviews --

SELECT * FROM Rating
WHERE Rating >= 4;

-- average rating --

SELECT AVG(Rating) AS Average_Rating
FROM Rating;

-- Highest Rating --

SELECT MAX(Rating) AS Highest_Rating
FROM Rating;

-- Lowest Rating --

SELECT MIN(Rating) AS Lowest_Rating
FROM Rating;

-- total of all ratings --

SELECT SUM(Rating) AS Total_Rating
FROM Rating;

-- Count ratings for each rating value --

SELECT Rating, COUNT(*) AS Number_of_Ratings
FROM Rating
GROUP BY Rating;

-- average rating for each review -- 

SELECT Reviewid, AVG(Rating) AS Average_Rating
FROM Rating
GROUP BY Reviewid;

-- Ratings above the overall average -- 

SELECT *
FROM Rating
WHERE Rating > (
    SELECT AVG(Rating)
    FROM Rating
);

-- Find ratings above the overall average

SELECT *
FROM Rating
WHERE Rating > (
    SELECT AVG(Rating)
    FROM Rating
);
