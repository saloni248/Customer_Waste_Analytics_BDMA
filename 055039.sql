-- DATABASE 

CREATE DATABASE ConsumerWasteAnalytics;
USE ConsumerWasteAnalytics;

-- TABLE CREATION -- 
-- Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Region VARCHAR(50),
    PurchaseHistory TEXT,
    AverageSpending DECIMAL(10, 2),
    PreferredCategory VARCHAR(50),
    LoyaltyScore INT
);

-- Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    ReturnRate DECIMAL(5, 2),
    DisposalRate DECIMAL(5, 2),
    Price DECIMAL(10, 2),
    Supplier VARCHAR(100),
    SustainabilityScore DECIMAL(5, 2)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE NOT NULL,
    ReturnDate DATE,
    Quantity INT NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- WasteMetrics Table
CREATE TABLE WasteMetrics (
    MetricID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    ReturnReason TEXT,
    EnvironmentalImpact TEXT,
    CarbonFootprint DECIMAL(10, 2),
    RecyclabilityScore DECIMAL(5, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Recommendations Table
CREATE TABLE Recommendations (
    RecommendationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    SuggestedAction TEXT,
    ActionImpact TEXT,
    ActionDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create the Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(200),
    Region VARCHAR(50),
    ProductSupplied VARCHAR(255), 
    SupplierRating DECIMAL(3, 2) CHECK (SupplierRating BETWEEN 0 AND 5) -- Rating out of 5
);

-- Create the Inventory table
CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    StockLevel INT NOT NULL,
    ReorderThreshold INT NOT NULL,
    StorageLocation VARCHAR(100),
    RestockDate DATE,
    SupplierID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

SHOW TABLES;

-- DUMMY TABLES INSERTION 

INSERT INTO Customers (CustomerID, Name, Age, Region, PurchaseHistory, AverageSpending, PreferredCategory, LoyaltyScore) VALUES
(1, 'Amit Sharma', 32, 'North', 'Laptop, Phone, Headphones', 25000.50, 'Electronics', 85),
(2, 'Priya Verma', 27, 'West', 'Shoes, Handbag', 12000.75, 'Fashion', 70),
(3, 'Rajesh Gupta', 40, 'East', 'Refrigerator, Washing Machine', 45000.00, 'Home Appliances', 90),
(4, 'Neha Mehta', 29, 'South', 'Skincare, Perfume', 8000.30, 'Beauty', 60),
(5, 'Vikram Singh', 35, 'North', 'LED TV, Home Theater', 50000.00, 'Electronics', 95),
(6, 'Anjali Das', 31, 'West', 'Makeup Kit, Hair Dryer', 15000.20, 'Beauty', 78),
(7, 'Suresh Reddy', 38, 'East', 'Treadmill, Dumbbells', 22000.00, 'Fitness', 85),
(8, 'Kavita Iyer', 26, 'South', 'Sarees, Jewelry', 18000.60, 'Fashion', 75),
(9, 'Manoj Nair', 45, 'North', 'Sofa Set, Dining Table', 70000.90, 'Home Decor', 98),
(10, 'Sunita Pillai', 30, 'West', 'Books, Stationery', 6000.40, 'Books', 55),
(11, 'Deepak Kumar', 34, 'East', 'Smartphone, Laptop', 40000.25, 'Electronics', 92),
(12, 'Swati Bhatt', 28, 'South', 'Dress, Heels', 14000.80, 'Fashion', 68),
(13, 'Arjun Malhotra', 41, 'North', 'Car Accessories, Helmets', 20000.50, 'Automobile', 88),
(14, 'Reema Shah', 33, 'West', 'Organic Food, Supplements', 9500.90, 'Health', 72),
(15, 'Rohan Deshmukh', 37, 'East', 'Shoes, Gym Equipment', 26000.60, 'Fitness', 80),
(16, 'Meena Yadav', 25, 'South', 'Lipstick, Foundation', 8500.40, 'Beauty', 62),
(17, 'Tarun Ghosh', 46, 'North', 'Luxury Watches, Sunglasses', 55000.00, 'Fashion', 94),
(18, 'Pooja Saxena', 29, 'West', 'Curtains, Bedsheets', 11000.20, 'Home Decor', 70),
(19, 'Ashok Patil', 36, 'East', 'Fan, Air Cooler', 18000.00, 'Home Appliances', 76),
(20, 'Nidhi Agarwal', 31, 'South', 'Yoga Mat, Dumbbells', 9000.30, 'Fitness', 65),
(21, 'Harish Menon', 43, 'North', 'Power Bank, Smart Watch', 22000.40, 'Electronics', 89),
(22, 'Sonal Kapoor', 27, 'West', 'Bags, Earrings', 13000.00, 'Fashion', 74),
(23, 'Gopal Srinivasan', 39, 'East', 'Grocery Items, Kitchen Tools', 10500.50, 'Groceries', 68),
(24, 'Ritika Sinha', 28, 'South', 'Face Cream, Shampoo', 7500.60, 'Beauty', 58),
(25, 'Sandeep Joshi', 42, 'North', 'Trekking Gear, Travel Accessories', 28000.20, 'Travel', 87),
(26, 'Alok Mishra', 34, 'West', 'Guitar, Headphones', 15000.90, 'Music', 77),
(27, 'Shruti Chatterjee', 30, 'East', 'Formal Shoes, Watches', 19000.00, 'Fashion', 79),
(28, 'Parth Raj', 45, 'South', 'Smart TV, Gaming Console', 60000.00, 'Electronics', 99),
(29, 'Vinay Thakur', 38, 'North', 'Coffee Machine, Blender', 20000.60, 'Home Appliances', 82),
(30, 'Tanya Sehgal', 25, 'West', 'Hoodies, Sneakers', 12000.40, 'Fashion', 67),
(31, 'Ravi Shetty', 37, 'East', 'Bicycles, Helmets', 25000.00, 'Fitness', 84),
(32, 'Pallavi Kulkarni', 29, 'South', 'Makeup Brushes, Compact', 9500.30, 'Beauty', 66),
(33, 'Sameer Khan', 44, 'North', 'Gold Jewelry, Luxury Bags', 85000.50, 'Luxury', 100),
(34, 'Jyoti Bansal', 32, 'West', 'Office Chair, Desk', 19000.20, 'Home Decor', 71),
(35, 'Aniket Banerjee', 41, 'East', 'Printers, Hard Drives', 29000.90, 'Electronics', 85),
(36, 'Komal Joshi', 26, 'South', 'Nail Polish, Perfume', 7000.80, 'Beauty', 57),
(37, 'Karan Arora', 39, 'North', 'Books, Kindle', 11000.40, 'Books', 63),
(38, 'Rhea Das', 28, 'West', 'Body Wash, Essential Oils', 8000.30, 'Beauty', 60),
(39, 'Abhinav Tyagi', 47, 'East', 'Car Tires, Car Perfume', 32000.50, 'Automobile', 90),
(40, 'Smita Rao', 30, 'South', 'Dining Set, Wall Art', 17000.20, 'Home Decor', 73),
(41, 'Mohit Chawla', 36, 'North', 'Gym Bag, Dumbbells', 15000.00, 'Fitness', 75),
(42, 'Sneha Nair', 29, 'West', 'Handmade Crafts, Candles', 9500.70, 'Home Decor', 68),
(43, 'Umesh Patil', 42, 'East', 'Tablet, Power Bank', 21000.30, 'Electronics', 86),
(44, 'Simran Kapoor', 31, 'South', 'Designer Saree, Necklace', 25000.40, 'Fashion', 81),
(45, 'Nitin Saxena', 35, 'North', 'Motorbike Gear, Gloves', 28000.00, 'Automobile', 88),
(46, 'Payal Grover', 27, 'West', 'Sunscreen, Night Cream', 9000.50, 'Beauty', 61),
(47, 'Ashish Mehta', 44, 'East', 'Action Figures, Toys', 13000.60, 'Toys', 69),
(48, 'Ritika Arora', 33, 'South', 'Kurtis, Dupattas', 14000.90, 'Fashion', 72),
(49, 'Yashwant Rao', 38, 'North', 'Camping Gear, Sleeping Bag', 30000.50, 'Travel', 89),
(50, 'Preeti Sinha', 29, 'West', 'Earrings, Makeup Kit', 11000.30, 'Beauty', 64);

SELECT * FROM customers;

INSERT INTO Products (Name, Category, ReturnRate, DisposalRate, Price, Supplier, SustainabilityScore) VALUES
('Amul Butter', 'Dairy', 2.50, 1.20, 50.00, 'Amul India Pvt Ltd', 8.5),
('Tata Salt', 'Groceries', 1.80, 0.90, 25.00, 'Tata Consumer Products', 9.0),
('Parle-G Biscuits', 'Snacks', 3.20, 2.00, 10.00, 'Parle Products Ltd', 8.0),
('Brooke Bond Red Label Tea', 'Beverages', 2.00, 1.50, 150.00, 'Hindustan Unilever Ltd', 7.5),
('Dabur Honey', 'Health', 1.50, 1.00, 250.00, 'Dabur India Ltd', 9.2),
('Patanjali Aloe Vera Gel', 'Personal Care', 4.50, 3.00, 80.00, 'Patanjali Ayurveda', 8.8),
('Godrej No.1 Soap', 'Personal Care', 2.80, 1.50, 35.00, 'Godrej Consumer Products', 8.3),
('Boroline Antiseptic Cream', 'Healthcare', 1.70, 1.00, 40.00, 'GD Pharmaceuticals', 9.5),
('Haldiram’s Kaju Katli', 'Sweets', 5.00, 3.00, 550.00, 'Haldiram Snacks Pvt Ltd', 7.0),
('Himalaya Neem Face Wash', 'Beauty', 3.50, 2.20, 120.00, 'Himalaya Herbals', 8.7),
('Fevicol Adhesive', 'Stationery', 1.20, 0.80, 50.00, 'Pidilite Industries', 9.3),
('Asian Paints Royale', 'Home Decor', 1.00, 0.50, 900.00, 'Asian Paints Ltd', 9.8),
('Lakme Kajal', 'Beauty', 3.80, 2.50, 180.00, 'Hindustan Unilever Ltd', 8.4),
('Raymond Suit Fabric', 'Clothing', 0.90, 0.40, 2500.00, 'Raymond Ltd', 9.7),
('Bajaj LED Bulb', 'Electronics', 1.50, 0.80, 220.00, 'Bajaj Electricals', 9.1),
('Hero Splendor Bike', 'Automobile', 0.50, 0.20, 70000.00, 'Hero MotoCorp', 9.0),
('Royal Enfield Classic 350', 'Automobile', 0.30, 0.10, 195000.00, 'Royal Enfield India', 9.5),
('Samsung Galaxy M14', 'Electronics', 5.50, 4.00, 18000.00, 'Samsung India', 8.0),
('Maruti Swift Car', 'Automobile', 0.40, 0.20, 800000.00, 'Maruti Suzuki India', 9.6),
('Bose SoundLink Speaker', 'Electronics', 0.90, 0.40, 12000.00, 'Bose Corporation India', 9.4),
('Titan Raga Watch', 'Accessories', 1.10, 0.70, 5500.00, 'Titan Company Ltd', 9.2),
('Linc Gel Pen', 'Stationery', 3.00, 1.80, 20.00, 'Linc Pens Ltd', 8.1),
('Santoor Sandalwood Soap', 'Personal Care', 2.30, 1.50, 40.00, 'Wipro Consumer Care', 8.6),
('Britannia Cheese Slices', 'Dairy', 2.20, 1.00, 110.00, 'Britannia Industries', 8.9);

SELECT * FROM products;

INSERT INTO Orders (CustomerID, ProductID, Quantity, OrderDate, TotalPrice, PaymentMethod, OrderStatus) VALUES
(1, 3, 1, '2024-02-01', 124999.00, 'Credit Card', 'Delivered'),
(2, 7, 2, '2024-02-02', 29998.00, 'Debit Card', 'Delivered'),
(3, 15, 1, '2024-02-03', 59999.00, 'UPI', 'Shipped'),
(4, 20, 3, '2024-02-04', 897.00, 'Net Banking', 'Pending'),
(5, 1, 1, '2024-02-05', 79999.00, 'Credit Card', 'Delivered'),
(6, 10, 1, '2024-02-06', 12999.00, 'Debit Card', 'Cancelled'),
(7, 5, 1, '2024-02-07', 44999.00, 'Cash on Delivery', 'Shipped'),
(8, 12, 2, '2024-02-08', 39998.00, 'Credit Card', 'Delivered'),
(11, 6, 2, '2024-02-11', 25998.00, 'Debit Card', 'Delivered'),
(12, 14, 1, '2024-02-12', 7999.00, 'UPI', 'Shipped'),
(13, 21, 1, '2024-02-13', 13999.00, 'Credit Card', 'Pending'),
(14, 19, 3, '2024-02-14', 897.00, 'Net Banking', 'Delivered'),
(15, 8, 1, '2024-02-15', 4999.00, 'Cash on Delivery', 'Delivered'),
(16, 22, 1, '2024-02-16', 6999.00, 'Debit Card', 'Shipped'),
(17, 11, 1, '2024-02-17', 22999.00, 'Credit Card', 'Delivered'),
(18, 2, 1, '2024-02-18', 69999.00, 'Credit Card', 'Delivered'),
(19, 9, 2, '2024-02-19', 17998.00, 'UPI', 'Pending'),
(20, 16, 3, '2024-02-20', 2397.00, 'Cash on Delivery', 'Delivered'),
(21, 4, 1, '2024-02-21', 29999.00, 'Credit Card', 'Cancelled'),
(22, 13, 2, '2024-02-22', 65998.00, 'Debit Card', 'Delivered'),
(23, 24, 1, '2024-02-23', 499.00, 'UPI', 'Shipped'),
(24, 23, 1, '2024-02-24', 499.00, 'Credit Card', 'Delivered'),
(25, 17, 1, '2024-02-25', 3999.00, 'Cash on Delivery', 'Pending'),
(26, 2, 1, '2024-02-26', 69999.00, 'Credit Card', 'Shipped'),
(27, 10, 2, '2024-02-27', 25998.00, 'Debit Card', 'Delivered'),
(28, 5, 1, '2024-02-28', 44999.00, 'Net Banking', 'Delivered'),
(29, 15, 1, '2024-02-29', 59999.00, 'UPI', 'Cancelled'),
(30, 7, 2, '2024-03-01', 29998.00, 'Credit Card', 'Delivered'),
(41, 1, 1, '2024-03-12', 79999.00, 'Credit Card', 'Shipped'),
(42, 23, 1, '2024-03-13', 499.00, 'UPI', 'Cancelled'),
(43, 16, 2, '2024-03-14', 1598.00, 'Net Banking', 'Delivered'),
(44, 18, 3, '2024-03-15', 17997.00, 'Debit Card', 'Delivered'),
(45, 4, 1, '2024-03-16', 29999.00, 'Credit Card', 'Shipped'),
(46, 13, 1, '2024-03-17', 32999.00, 'UPI', 'Delivered'),
(47, 7, 1, '2024-03-18', 14999.00, 'Cash on Delivery', 'Delivered'),
(48, 3, 2, '2024-03-19', 249998.00, 'Credit Card', 'Pending'),
(49, 22, 1, '2024-03-20', 6999.00, 'Debit Card', 'Delivered'),
(50, 9, 1, '2024-03-21', 8999.00, 'Credit Card', 'Delivered');

SELECT * FROM Orders;

INSERT INTO WasteMetrics (ProductID, ReturnReason, EnvironmentalImpact, CarbonFootprint, RecyclabilityScore) VALUES
(1, 'Damaged on Arrival', 'High plastic waste due to packaging', 12.5, 7.8),
(2, 'Defective Product', 'Electronic waste concerns', 18.2, 5.6),
(3, 'Wrong Item Delivered', 'Excess transportation emissions', 10.3, 8.2),
(4, 'Customer Changed Mind', 'Unnecessary resource utilization', 5.6, 9.1),
(5, 'Expired Product', 'Food waste and methane emissions', 20.8, 6.5),
(6, 'Size Mismatch', 'High return rate increases emissions', 8.4, 7.2),
(7, 'Better Price Found Elsewhere', 'Returns increase logistics emissions', 6.7, 9.0),
(8, 'Quality Not as Expected', 'Materials not fully recyclable', 13.1, 6.2),
(9, 'Incomplete Product', 'Extra production needed for replacements', 15.5, 7.3),
(10, 'Packaging Issues', 'Non-biodegradable packaging waste', 9.8, 8.5);

select * from wastemetrics;

INSERT INTO EnvironmentalImpactSummary (ProductID, AverageEnvironmentalImpact, KeyImpactAreas, RecommendationsForImprovement) VALUES
(1, 8.2, 'Plastic waste, transportation emissions', 'Reduce packaging waste, use biodegradable materials'),
(2, 7.5, 'Electronic waste, toxic chemicals', 'Implement e-waste recycling program, improve durability'),
(3, 6.8, 'Transportation, fuel emissions', 'Optimize delivery routes, use electric vehicles'),
(4, 5.3, 'Resource wastage from returns', 'Improve product descriptions to reduce returns'),
(5, 9.1, 'Food waste, methane emissions', 'Enhance storage conditions, introduce composting initiatives'),
(6, 7.0, 'High return rate, emissions', 'Provide better size guides, AR-based fitting solutions'),
(7, 6.5, 'Logistics emissions', 'Encourage local sourcing, reduce return incentives'),
(8, 8.0, 'Material non-recyclability', 'Switch to sustainable materials, improve production methods'),
(9, 7.4, 'Extra production waste', 'Improve quality control, minimize defective rates'),
(10, 8.9, 'Non-biodegradable packaging', 'Use recycled packaging, offer returnable packaging options');

select * from EnvironmentalImpactSummary;

INSERT INTO Suppliers (Name, ContactInfo, Region, ProductSupplied, SupplierRating) VALUES
('GreenTech Supplies', 'contact@greentech.com', 'North America', 'Solar Panels', 4.5),
('EcoPlast Industries', 'support@ecoplast.com', 'Europe', 'Biodegradable Packaging', 4.2),
('Sustainable Metals Ltd.', 'info@susmetals.com', 'Asia', 'Recycled Aluminum', 4.7),
('Organic Textiles Co.', 'hello@organictextiles.com', 'South America', 'Organic Cotton Fabrics', 4.1),
('Renewable Woodworks', 'contact@renewablewood.com', 'North America', 'Sustainable Timber', 4.6),
('E-Waste Solutions', 'support@ewastesolutions.com', 'Europe', 'Recycled Electronic Components', 3.9),
('BioAgro Corp.', 'info@bioagro.com', 'Africa', 'Compostable Agricultural Products', 4.3),
('EcoLighting Ltd.', 'hello@ecolighting.com', 'Asia', 'Energy-Efficient LED Bulbs', 4.8),
('Pure Water Systems', 'support@purewatersys.com', 'Australia', 'Water Filtration Systems', 4.0),
('ZeroWaste Packaging', 'contact@zerowastepack.com', 'North America', 'Recyclable Packaging Materials', 4.5),
('GreenSteel Inc.', 'info@greensteel.com', 'Europe', 'Low-Carbon Steel', 4.4),
('EcoChemicals Ltd.', 'support@ecochemicals.com', 'South America', 'Non-Toxic Cleaning Agents', 3.8),
('Solar Innovators', 'hello@solarinnovators.com', 'Asia', 'Solar Battery Storage', 4.6),
('Green Logistics Co.', 'contact@greenlogistics.com', 'Africa', 'Eco-Friendly Transport Services', 4.2),
('Sustainable Plastics', 'support@susplastics.com', 'Australia', 'Recycled Plastic Components', 3.9),
('Green Energy Solutions', 'info@greenenergy.com', 'North America', 'Wind Turbines', 4.7),
('EcoPackaging Corp.', 'hello@ecopackaging.com', 'Europe', 'Compostable Food Containers', 4.3);

select * from suppliers;

INSERT INTO Recommendations (CustomerID, ProductID, SuggestedAction, ActionImpact, ActionDate) VALUES
(1, 3, 'Offer discounts for bulk purchases', 'Increases sales and reduces packaging waste', '2025-02-01'),
(2, 5, 'Improve product descriptions', 'Reduces return rates and customer dissatisfaction', '2025-02-02'),
(3, 8, 'Introduce a loyalty program', 'Enhances customer retention and engagement', '2025-02-03'),
(4, 2, 'Switch to biodegradable packaging', 'Minimizes environmental impact', '2025-02-04'),
(5, 7, 'Optimize delivery logistics', 'Reduces carbon footprint from transportation', '2025-02-05'),
(6, 10, 'Use AI-powered recommendations', 'Improves personalized marketing and sales', '2025-02-06'),
(7, 4, 'Partner with eco-friendly suppliers', 'Strengthens sustainability efforts', '2025-02-07'),
(8, 6, 'Provide detailed size guides', 'Reduces return rates due to sizing issues', '2025-02-08'),
(9, 1, 'Implement a trade-in program', 'Encourages recycling and reusability', '2025-02-09'),
(10, 9, 'Introduce AR-based try-on features', 'Enhances customer experience and reduces returns', '2025-02-10');

select * from recommendations;

INSERT INTO Inventory (ProductID, StockLevel, ReorderThreshold, StorageLocation, RestockDate, SupplierID) VALUES
(1, 150, 50, 'Warehouse A - Shelf 3', '2025-02-20', 3),
(2, 80, 30, 'Warehouse B - Section 2', '2025-02-18', 5),
(3, 200, 60, 'Warehouse C - Rack 1', '2025-02-22', 8),
(4, 50, 20, 'Warehouse A - Shelf 5', '2025-02-15', 2),
(5, 120, 40, 'Warehouse D - Bay 4', '2025-02-25', 6),
(6, 30, 15, 'Warehouse B - Section 6', '2025-02-12', 10),
(7, 90, 35, 'Warehouse E - Zone 3', '2025-02-19', 4),
(8, 175, 55, 'Warehouse F - Shelf 7', '2025-02-24', 7),
(9, 60, 25, 'Warehouse C - Rack 2', '2025-02-16', 12),
(10, 110, 45, 'Warehouse A - Shelf 8', '2025-02-28', 9),
(11, 200, 75, 'Warehouse D - Bay 1', '2025-02-22', 15),
(12, 140, 50, 'Warehouse G - Zone 2', '2025-02-21', 14),
(13, 95, 30, 'Warehouse H - Section 4', '2025-02-17', 11),
(14, 180, 65, 'Warehouse B - Section 5', '2025-02-23', 13),
(15, 75, 30, 'Warehouse F - Shelf 9', '2025-02-20', 1);

select * from inventory;

-- Retrieve Operations

-- 1. Retrieve all customers from the 'North' region with a loyalty score above 80
SELECT * FROM Customers  
WHERE Region = 'North' AND LoyaltyScore > 80;

-- 2. Get the top 5 most expensive products along with their category and price
SELECT Name, Category, Price  
FROM Products  
ORDER BY Price DESC  
LIMIT 5;

-- 3. Retrieve customers who have purchased electronics and have an average spending above ₹30,000
SELECT * FROM Customers  
WHERE PreferredCategory = 'Electronics' AND AverageSpending > 30000;

-- 4. Retrieve order and inventory details by joining on ProductID.
SELECT 
    o.OrderID, 
    o.ProductID, 
    i.StorageLocation, 
    i.StockLevel AS InventoryStockLevel, 
    o.Quantity AS OrderedQuantity, 
    o.OrderDate
FROM Orders o
JOIN Inventory i ON o.ProductID = i.ProductID;

-- Aggregation Operations

-- 1. Total Sales Revenue Per Month
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month, 
    SUM(TotalPrice) AS TotalRevenue
FROM Orders
GROUP BY Month
ORDER BY Month DESC;

-- 2.  Find the average number of units ordered per product
SELECT 
    ProductID, 
    AVG(Quantity) AS AvgOrderQuantity
FROM Orders
GROUP BY ProductID
ORDER BY AvgOrderQuantity DESC;

-- 3.  Retrieve total inventory stock at each storage location:

SELECT 
    StorageLocation, 
    SUM(StockLevel) AS TotalStock
FROM Inventory
GROUP BY StorageLocation
ORDER BY TotalStock DESC;

-- 4.   Find the top 5 products with the highest total quantity sold:

SELECT 
    o.ProductID, 
    p.Name AS ProductName, 
    SUM(o.Quantity) AS TotalSold
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY o.ProductID, p.Name
ORDER BY TotalSold DESC
LIMIT 5;

-- 5.  Retrieve the total number of orders placed by each customer:

SELECT 
    CustomerID, 
    COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerID
ORDER BY TotalOrders DESC;

-- 6. Monthly Inventory Consumption Rate

SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month, 
    SUM(Quantity) AS TotalQuantityOrdered
FROM Orders
GROUP BY Month
ORDER BY Month DESC;
 
 -- 7. Average Stock Level Per Product Category
 
 SELECT 
    p.Category, 
    AVG(i.StockLevel) AS AvgStockLevel
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY AvgStockLevel DESC;

-- 8. Total Revenue Per Customer

SELECT 
    CustomerID, 
    SUM(TotalPrice) AS TotalSpent
FROM Orders
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

-- Update Operations

-- 1. Update Stock Levels After an Order
UPDATE Inventory i
JOIN Orders o ON i.ProductID = o.ProductID
SET i.StockLevel = i.StockLevel - o.Quantity
WHERE o.OrderDate = CURDATE();
-- to display
SELECT i.ProductID, i.StorageLocation, i.StockLevel 
FROM Inventory i
JOIN Orders o ON i.ProductID = o.ProductID
WHERE o.OrderDate = CURDATE();

-- 2.  Apply a Discount to All Orders Above ₹5000
SET SQL_SAFE_UPDATES = 0;  -- Disable safe update mode

UPDATE Orders
SET TotalPrice = TotalPrice * 0.9
WHERE TotalPrice > 5000;
-- to display
SELECT OrderID, CustomerID, TotalPrice
FROM Orders
WHERE TotalPrice > 5000;

-- 3. Mark Customers as "Premium" Based on Spending

DESC Customers;
ALTER TABLE Customers ADD COLUMN CustomerType VARCHAR(20) DEFAULT 'Regular';

UPDATE Customers c
JOIN (
    SELECT CustomerID, SUM(TotalPrice) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
    HAVING TotalSpent > 50000
) AS HighSpenders ON c.CustomerID = HighSpenders.CustomerID
SET c.CustomerType = 'Premium';
-- to display 
SELECT CustomerID, Name, CustomerType  
FROM Customers  
WHERE CustomerType = 'Premium';

-- 4. Increase Product Price by 5% for Low Stock Item

UPDATE Products
SET Price = Price * 1.05
WHERE ProductID IN (
    SELECT ProductID FROM Inventory WHERE StockLevel < 50
);
-- to display
desc products;
SELECT ProductID, Name, Price  
FROM Products  
WHERE ProductID IN (  
    SELECT ProductID FROM Inventory WHERE StockLevel < 50  
);

-- major changes for operations
ALTER TABLE Recommendations  
DROP FOREIGN KEY recommendations_ibfk_1;  

ALTER TABLE Recommendations  
ADD CONSTRAINT recommendations_ibfk_1  
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  
ON DELETE CASCADE;

-- Delete

-- 1.Delete customers who haven't placed an order in the last 2 years
DELETE FROM Customers  
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID FROM Orders  
    WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
);
 
-- 2. Delete old, unshipped orders that are more than 1 year old 
DELETE FROM Orders  
WHERE OrderStatus = 'Pending'  
AND OrderDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- NORMALIZATION
-- 1.
SELECT InventoryID, StorageLocation
FROM Inventory
WHERE StorageLocation LIKE '%,%';
-- 2.
SELECT InventoryID, StorageLocation
FROM Inventory
WHERE CHAR_LENGTH(StorageLocation) > 50; -- Adjust this threshold if needed
-- 3. 
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Inventory'
AND COLUMN_NAME LIKE 'StorageLocation%';
-- 4. 
SELECT InventoryID, COUNT(*)
FROM Inventory
GROUP BY InventoryID
HAVING COUNT(*) > 1;

-- END