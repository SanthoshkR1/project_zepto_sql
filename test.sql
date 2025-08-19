CREATE  DATABASE test3;
USE test3;
CREATE TABLE zepto3 (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp DECIMAL(10,2),
  discountPercent DECIMAL(5,2),
  availableQuantity INT,
  discountedSellingPrice DECIMAL(8,2),
  weightInGms INT,
  outOfStock varchar(10),
  quantity INT
);

INSERT INTO zepto3 
(category, name, mrp, discountPercent, availableQuantity, discountedSellingPrice, weightInGms, outOfStock, quantity) 
VALUES
('Beverages', 'Coca Cola 1.25L', 75.00, 10.00, 200, 67.50, 1250, 'No', 1),
('Snacks', 'Lays Chips 52g', 20.00, 5.00, 500, 19.00, 52, 'No', 2),
('Dairy', 'Amul Butter 500g', 275.00, 15.00, 150, 233.75, 500, 'No', 1),
('Fruits', 'Banana (1 Dozen)', 60.00, 0.00, 100, 60.00, 1200, 'No', 1),
('Personal Care', 'Dove Soap 100g', 45.00, 20.00, 300, 36.00, 100, 'No', 3),
('Staples', 'Fortune Basmati Rice 5Kg', 550.00, 12.00, 80, 484.00, 5000, 'No', 1),
('Bakery', 'Britannia Bread 400g', 35.00, 0.00, 250, 35.00, 400, 'No', 1),
('Beverages', 'Tata Tea Premium 1Kg', 520.00, 10.00, 120, 468.00, 1000, 'No', 1),
('Snacks', 'Parle-G 800g Family Pack', 80.00, 5.00, 200, 76.00, 800, 'No', 1),
('Household', 'Harpic Toilet Cleaner 500ml', 98.00, 8.00, 90, 90.16, 500, 'No', 2);

SELECT  *   FROM zepto3;
