CREATE TABLE zepto2 (
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

--data exploration

--count of rows
select count(*) from zepto2;

--sample data
SELECT * FROM zepto2
LIMIT 10;

-- null values
SELECT * FROM zepto2 
WHERE name is NULL 
OR
category is NULL 
OR
mrp is NULL 
OR
discountPercent is NULL 
OR
discountedSellingPrice is NULL
OR
weightInGms is NULL
OR 
availableQuantity is NULL
OR 
outOfStock is NULL
OR 
quantity is NULL;

-- different product categories 
SELECT DISTINCT category 
FROM zepto2
ORDER BY category;

-- products in stock vs out of stock
SELECT outOFStock ,COUNT(sku_id)
FROM zepto2
GROUP BY outOfStock;

-- product names present multiple times
SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto2
GROUP BY name 
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;


-- products with price = 0
SELECT * FROM zepto2 
WHERE mrp = 0 OR discountedSellingPrice = 0;


DELETE FROM zepto2
WHERE mrp = 0;

-- convert paise to rupees
UPDATE zepto2
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;
SELECT mrp ,discountedSellingPrice FROM zepto2;

SELECT mrp, discountedSellingPrice FROM zepto2;

--data analysis
-- Q1 Found top 10 best-value products based on discount percentage 
SELECT  DISTINCT name,mrp,discountPercent
FROM zepto2
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2 Identified high-MRP products that are currently out of stock 
SELECT DISTINCT name,mrp
FROM zepto2
WHERE outOfStock = 'TRUE' and mrp > 300
ORDER BY mrp DESC;

-- Q3 Estimated potential revenue for each product category 
SELECT category,
SUM(discountedSellingPrice + availableQuantity) AS total_revenue
FROM zepto2
GROUP BY category 
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;


SELECT name, mrp FROM zepto2 ORDER BY mrp DESC LIMIT 10;
UPDATE zepto2
SET mrp = mrp / 100;


-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto2
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto2
WHERE weightInGms >= 100
ORDER BY price_per_gram;

UPDATE zepto2
SET mrp = mrp / 100,
    discountedSellingPrice = discountedSellingPrice / 100;


-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto2;

-- Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto2
GROUP BY category
ORDER BY total_weight;
