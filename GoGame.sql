CREATE DATABASE GoGameDB

CREATE TABLE Staff (
	StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(100) NOT NULL,
	StaffGender CHAR(6) CHECK (StaffGender IN ('Male', 'Female')) NOT NULL,
	StaffDOB DATE NOT NULL,
	StaffSalary INT NOT NULL,
	StaffPhoneNumber VARCHAR(15) NOT NULL,
	StaffAddress VARCHAR(255) NOT NULL
)

CREATE TABLE Customer(
  CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
  CustomerName VARCHAR(255) NOT NULL,
  CustomerGender VARCHAR(6) CHECK (CustomerGender IN ('Male', 'Female')) NOT NULL,
  CustomerDOB DATE NOT NULL,
  CustomerPhoneNumber VARCHAR (15) NOT NULL,
)


CREATE TABLE Supplier(
	SupplierID CHAR(5) PRIMARY KEY CHECK (SupplierID LIKE 'SU[0-9][0-9][0-9]'),
	SupplierName VARCHAR(255) NOT NULL,
	SupplierAddress VARCHAR(255) NOT NULL,
	SupplierPhoneNumber VARCHAR(15) NOT NULL
)

CREATE TABLE Game(
	GameID CHAR(5) PRIMARY KEY CHECK (GameID LIKE 'GA[0-9][0-9][0-9]'),
	GameTypeID CHAR(5) FOREIGN KEY REFERENCES GameType(GameTypeID),
	GameName VARCHAR(100) NOT NULL,
	GamePrice INT NOT NULL,
	ReleaseDate DATE NOT NULL
)

CREATE TABLE GameType(
	GameTypeID CHAR(5) PRIMARY KEY CHECK (GameTypeID LIKE 'GT[0-9][0-9][0-9]'),
	GameTypeName VARCHAR(100) NOT NULL
)

CREATE TABLE Purchase(
	PurchaseID CHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) NOT NULL,
	SupplierID CHAR(5) FOREIGN KEY REFERENCES Supplier(SupplierID) NOT NULL,
	PurchaseDate DATE NOT NULL
)

CREATE TABLE PurchaseDetail(
	GameID CHAR(5) FOREIGN KEY REFERENCES Game(GameID) NOT NULL,
	PurchaseID CHAR(5) FOREIGN KEY REFERENCES Purchase(PurchaseID) NOT NULL,
	PurchaseQty INT NOT NULL
)

CREATE TABLE Sales(
	SalesID CHAR(5) PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) NOT NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) NOT NULL,
	TransactionDate DATE NOT NULL
)

CREATE TABLE SalesDetail(
	SalesID CHAR(5) FOREIGN KEY REFERENCES Sales(SalesID) NOT NULL,
	GameID CHAR(5) FOREIGN KEY REFERENCES Game(GameID) NOT NULL,
	GameQty INT NOT NULL
)

-- Insert Data into Staff Table --
INSERT INTO Staff VALUES
	('ST001', 'John Smith', 'Male', '1995-12-04', '7000000', '081263846932', 'Jalan Maple No. 05'),
	('ST002', 'Daniel Harris', 'Male', '1996-10-14', '4500000', '081288776332', 'Jalan Mawar No. 15'),
	('ST003', 'Megan White', 'Female', '1999-01-26', '5500000', '081647284901', 'Jalan Panjang No. 09'),
	('ST004', 'Karen Brown', 'Female', '1994-04-04', '6000000', '088234516281', 'Jalan Poppy No. 11'),
	('ST005', 'Laura Garcia', 'Female', '1995-11-09', '4000000', '089366448192', 'Jalan Walnut No. 07'),
	('ST006', 'James Anderson', 'Male', '1995-12-15', '4000000', '088874623411', 'Jalan Poppy No. 05'),
	('ST007', 'Linda Kim', 'Female', '1999-09-04', '6000000', '089976381231', 'Jalan Daisy No. 08'),
	('ST008', 'David Lee', 'Male', '1993-08-09', '8000000', '081937788123', 'Jalan Willow No. 04'),
	('ST009', 'Jessica Martinez', 'Female', '1995-02-02', '6000000', '081883716900', 'Jalan Cedar No. 02'),
	('ST010', 'Robert Wilson', 'Male', '1999-12-01', '4500000', '088366491023', 'Jalan Cedar No. 11'),
	('ST011', 'Michael Johnson', 'Male', '2000-12-22', '4000000', '083789174212', 'Jalan Pine No. 05'),
	('ST012', 'Emily Davis', 'Female', '2001-01-09', '4500000', '081798012341', 'Jalan Oak No. 04'),
	('ST013', 'Sarah Brown', 'Female', '1998-05-02', '5000000', '081545362812', 'Jalan Birch No. 08'),
	('ST014', 'Lucy Adams', 'Female', '2001-08-29', '3500000', '081990347581', 'Jalan Poppy No. 23'),
	('ST015', 'Mary Robinson', 'Female', '1999-10-30', '4000000', '088298109001', 'Jalan Walnut No. 05')

-- to Select Data From Staff Table --
SELECT * FROM Staff

-- Insert data into Customer Table --
INSERT INTO Customer VALUES
	('CU001', 'Chloe Thompson', 'Female', '2003-12-12', '081678201111'),
	('CU002', 'Benjamin Taylor', 'Male', '2002-03-14', '081778990011'),
	('CU003', 'Olivia Green', 'Female', '2000-05-29', '081162739111'),
	('CU004', 'Abigal Scott', 'Female', '1999-08-08','088213189113'),
	('CU005', 'William King', 'Male', '1995-01-09', '088833767812'),
	('CU006', 'Alexander Young', 'Male', '1998-11-15', '088288901233'),
	('CU007', 'Mia Allen', 'Female', '2004-05-05', '088199002313'),
	('CU008', 'Joshua Perez', 'Male', '1999-07-07', '081777888899'),
	('CU009', 'Isabella Hill', 'Female', '2001-01-01',  '081990029376'),
	('CU010', 'Ethan Baker', 'Male', '1999-06-03',  '088139123098'),
	('CU011', 'Joseph Nelson', 'Male', '2005-12-12',  '089933213455'),
	('CU012', 'Zoe Roberts', 'Female', '2006-03-09',  '081123451321'),
	('CU013', 'Victoria Morris', 'Female', '2006-09-02',  '081667944433'),
	('CU014', 'Charlotte Adams', 'Female', '2005-08-14',  '081090904451'),
	('CU015', 'Amelia Campbell', 'Female', '2004-08-03', '088899334121')

-- To Select all data from Customer Table --
SELECT * FROM Customer

-- Insert Data into Supplier Table --
INSERT INTO Supplier VALUES 
	('SU001', 'Game Haven Ltd.', 'Jalan Merdeka No.45', '082112345678'),
	('SU002', 'Epic Playgrounds', 'Jalan Sudirman No.89', '082223456789'),
	('SU003', 'Play Dreams', 'Jalan gajah Mada No.45', '083134567890'),
	('SU004', 'Arcade Masters', 'Jalan Diponegoro No.7', '082744567890'),
	('SU005', 'Gaming Emporium', 'Jalan Mataram No.23', '082456789012'),
	('SU006', 'Next Level Games', 'Jalan Slamet No.45', '082767890123'),
	('SU007', 'Joystick Junction', 'Jalan Pemuda No.34', '086178901234'),
	('SU008', 'Gamer`s Paradise', 'Jalan Kertanegara No.56', '083618902345'),
	('SU009', 'Level Up Enterprises', 'Jalan Ahmad No.78', '084190126543'),
	('SU010', 'Ultimate Gamers', 'Jalan Sisingamangaraja No.99', '081101237654'),
	('SU011', 'Victory Games', 'Jalan Dipati No.45', '085187654332'),
	('SU012', 'Infinite Play', 'Jalan Hasanuddin No.22', '083498765432'),
	('SU013', 'Game Galaxy', 'Jalan Veteran No.28', '085109877890'),
	('SU014', 'Pro Gamer Supply', 'Jalan Imam Bonjol No.19', '085610982098'),
	('SU015', 'Techno Playhouse', 'Jalan Raya Diponegoro No.35', '089009801212')

-- Select Data from Supplier Table --
SELECT * FROM Supplier

-- Insert data into GameType Table --
INSERT INTO GameType VALUES
	('GT001', 'RPG'),
	('GT002', 'Sandbox'),
	('GT003', 'TPS'),
	('GT004', 'Adventure'),
	('GT005', 'Sport'),
	('GT006', 'MOBA'),
	('GT007', 'Horror'),
	('GT008', 'Fighting'),
	('GT009', 'Simulation'),
	('GT010', 'FPS')

-- Select data from GameType Table
SELECT * FROM GameType

-- Insert Data into Game Table --
INSERT INTO Game VALUES
	('GA001', 'GT002', 'Minecraft', '500000', '2011-11-18'),
	('GA002', 'GT010', 'Counter Strike', '200000', '2023-09-27'),
	('GA003', 'GT007', 'Phasmophobia', '90000', '2020-09-04'),
	('GA004', 'GT001', 'Baldur`s Gate III', '900000', '2023-08-03'),
	('GA005', 'GT004', 'Hogwards Legacy', '800000', '2023-02-10'),
	('GA006', 'GT003', 'The Last of Us Part II', '640000', '2020-06-19'),
	('GA007', 'GT003', 'Resident Evil 3 (Remake)', '650000', '2020-04-03'),
	('GA008', 'GT007', 'Little Nightmares II', '480000', '2021-02-11'),
	('GA009', 'GT006', 'League of Legends', '50000', '2009-10-27'),
	('GA010', 'GT006', 'Dota 2', '20000', '2013-07-09'),
	('GA011', 'GT008', 'Street Fighter V', '300000', '2016-02-16'),
	('GA012', 'GT009', 'The Sims 4', '300000', '2014-09-02'),
	('GA013', 'GT005', 'FIFA 21', '600000', '2020-10-09'),
	('GA014', 'GT010', 'Rainbow Six Siege', '229000', '2015-12-01'),
	('GA015', 'GT010', 'Overwatch', '576000', '2016-05-24')

-- Insert data into Purchase Table --
INSERT INTO Purchase VALUES
	('PU001', 'ST008', 'SU013', '2023-01-01'),
	('PU002', 'ST003', 'SU011', '2023-01-04'),
	('PU003', 'ST014', 'SU014', '2023-03-12'),
	('PU004', 'ST002', 'SU001', '2023-04-04'),
	('PU005', 'ST005', 'SU005', '2023-05-23'),
	('PU006', 'ST001', 'SU006', '2023-06-19'),
	('PU007', 'ST009', 'SU002', '2023-06-20'),
	('PU008', 'ST010', 'SU009', '2023-08-11'),
	('PU009', 'ST004', 'SU010', '2023-10-29'),
	('PU010', 'ST007', 'SU008', '2023-11-11')

-- Select data from Purchase Table
SELECT * FROM Purchase

-- Insert data into PurchaseDetail Table
INSERT INTO PurchaseDetail VALUES
	('GA001', 'PU001', '10'),
	('GA003', 'PU001', '15'),
	('GA006', 'PU002', '20'),
	('GA010', 'PU003', '15'),
	('GA014', 'PU004', '35'),
	('GA002', 'PU005', '40'),
	('GA007', 'PU006', '15'),
	('GA008', 'PU007', '10'),
	('GA011', 'PU008', '15'),
	('GA015', 'PU009', '25'),
	('GA009', 'PU010', '30')

-- select all data from PurchaseDetail
SELECT * FROM PurchaseDetail

-- Insert data into Sales Table
INSERT INTO Sales VALUES
	('SA001', 'ST001', 'CU001', '2024-01-01'),
	('SA002', 'ST001', 'CU009', '2024-01-05'),
	('SA003', 'ST002', 'CU010', '2024-01-07'),
	('SA004', 'ST005', 'CU011', '2024-01-09'),
	('SA005', 'ST007', 'CU014', '2024-02-11'),
	('SA006', 'ST009', 'CU015', '2024-03-21'),
	('SA007', 'ST010', 'CU007', '2024-03-24'),
	('SA008', 'ST015', 'CU009', '2024-04-15'),
	('SA009', 'ST003', 'CU002', '2024-05-01'),
	('SA010', 'ST002', 'CU003', '2024-05-05')

-- Select all data from Sales --
SELECT * FROM Sales

-- Insert data into SalesDetail
INSERT INTO SalesDetail VALUES
	('SA001', 'GA001', '1'),
	('SA002', 'GA014', '2'),
	('SA003', 'GA001', '1'),
	('SA004', 'GA010', '3'),
	('SA005', 'GA009', '1'),
	('SA006', 'GA008', '1'),
	('SA007', 'GA015', '1'),
	('SA008', 'GA003', '4'),
	('SA009', 'GA002', '1'),
	('SA010', 'GA007', '1')

-- Select all data from SalesDetail
SELECT * FROM SalesDetail

-- Display StaffID, StaffName, CustomerID, and CustomerName
-- for each staff whose gender equals to Male,
-- and customer handled gender equals to Female.

SELECT Sales.StaffID, StaffName, Sales.CustomerID, CustomerName
FROM Sales
JOIN Staff ON Sales.StaffID = Staff.StaffID
JOIN Customer ON Sales.CustomerID = Customer.CustomerID
WHERE StaffGender = 'Male' AND CustomerGender = 'Female'

-- Display PurchaseID, SupplierID, SupplierName, 
-- StaffFirstName (obtained from the first word of StaffName), 
-- StaffDOB for every transaction that is handled by Staff 
-- whose salary is above the staff average salary and 
-- Staff year of birth is greater than 2000.

SELECT 
	Purchaseid, 
	Purchase.SupplierID, 
	SupplierName,
	SUBSTRING(StaffName, 1, CHARINDEX(' ', StaffName) -1) AS StaffFirstName
FROM Staff, Purchase, Supplier, (
	SELECT
		AVG(StaffSalary) [avg]
	FROM Staff
) [average]
WHERE Purchase.StaffID = Staff.StaffID
AND Purchase.SupplierID = Supplier.SupplierID
AND Staff.StaffSalary > [average].avg

-- Display PurchaseID, PurchaseDate, 
-- Total Game Type (obtained from the total of GameType) 
-- for every purchase that occurs in 2023

SELECT
	Purchase.PurchaseID,
	PurchaseDate,
	COUNT (GameType.GameTypeID) [Total Game Type]
FROM Purchase
JOIN PurchaseDetail ON Purchase.PurchaseID = PurchaseDetail.PurchaseID
JOIN Game ON PurchaseDetail.GameID = Game.GameID
JOIN GameType ON Game.GameTypeID = GameType.GameTypeID
WHERE YEAR(PurchaseDate) = '2023'
GROUP BY Purchase.PurchaseID, Purchase.PurchaseDate

-- Display SalesID, SalesDate, 
-- CustomerName (obtained from CustomerName in lowercase format) 
-- for every transaction that serves customer whose age is below 24

SELECT
	DISTINCT(SalesID),
	TransactionDate [SalesDate],
	LOWER(CustomerName) [CustomerName]
FROM Sales, Customer,
	(SELECT
		YEAR(GETDATE())-YEAR(CustomerDOB) [age]
	FROM Customer
) [customerData]
WHERE Customer.CustomerID = Sales.CustomerID
AND [customerData].[age] < 24

-- Create a view named 'QuarterlySalesReport' 
-- to display GameName, TotalSales (obtained from sum of Quantity * GamePrice 
-- and added with 'Rp.' in front of TotalSales), 
-- and AverageSales (obtained from average of Quantity * Gameprice 
-- and added with 'Rp.' in front of AverageSales) 
-- for every transaction that occurs in the first quarter 
-- and GamePrice is higher than 200000.

CREATE VIEW QuarterlySalesReport
AS
SELECT
	GameName,
	'Rp. ' + CAST(SUM(SalesDetail.GameQty*Game.GamePrice) AS VARCHAR) [TotalSales],
	'Rp. ' + CAST(AVG(SalesDetail.GameQty*Game.GamePrice) AS VARCHAR) [AverageSales]
FROM SalesDetail
JOIN Sales ON SalesDetail.SalesID = Sales.SalesID
JOIN Game ON SalesDetail.GameID = Game.GameID
WHERE DATENAME(QUARTER, TransactionDate) = 1
AND GamePrice > 200000
GROUP BY GameName