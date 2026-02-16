-- =====================================================
-- TASK 3: SQL FOR DATA ANALYSIS
-- Dataset: Superstore
-- Database: superstore_db
-- =====================================================

USE superstore_db;

-- =====================================================
-- 1. SELECT
-- =====================================================
SELECT * FROM superstore
LIMIT 10;


-- =====================================================
-- 2. WHERE
-- =====================================================
SELECT * 
FROM superstore 
WHERE region = 'West';


-- =====================================================
-- 3. ORDER BY
-- =====================================================
SELECT * 
FROM superstore 
ORDER BY sales DESC 
LIMIT 5;


-- =====================================================
-- 4. GROUP BY + SUM (Aggregate Function)
-- =====================================================
SELECT region, SUM(sales) AS total_sales
FROM superstore
GROUP BY region;


-- =====================================================
-- 5. GROUP BY + AVG (Aggregate Function)
-- =====================================================
SELECT category, AVG(sales) AS avg_sales
FROM superstore
GROUP BY category;


-- =====================================================
-- 6. CREATE SECOND TABLE FOR JOINS
-- =====================================================
DROP TABLE IF EXISTS customers;

CREATE TABLE customers AS
SELECT DISTINCT customer_id, customer_name, segment, region
FROM superstore;


-- =====================================================
-- 7. INNER JOIN
-- =====================================================
SELECT s.order_id, s.sales, c.customer_name, c.region
FROM superstore s
INNER JOIN customers c
ON s.customer_id = c.customer_id;


-- =====================================================
-- 8. LEFT JOIN
-- =====================================================
SELECT s.order_id, c.customer_name
FROM superstore s
LEFT JOIN customers c
ON s.customer_id = c.customer_id;


-- =====================================================
-- 9. RIGHT JOIN
-- =====================================================
SELECT s.order_id, c.customer_name
FROM superstore s
RIGHT JOIN customers c
ON s.customer_id = c.customer_id;


-- =====================================================
-- 10. SUBQUERY
-- Example: Customers whose sales are above average
-- =====================================================
SELECT *
FROM superstore
WHERE sales > (
    SELECT AVG(sales) FROM superstore
);


-- =====================================================
-- 11. CREATE VIEW
-- =====================================================
CREATE OR REPLACE VIEW region_sales_summary AS
SELECT region, SUM(sales) AS total_sales
FROM superstore
GROUP BY region;

-- View usage
SELECT * FROM region_sales_summary;


-- =====================================================
-- 12. INDEX OPTIMIZATION
-- =====================================================
CREATE INDEX idx_region ON superstore(region);
CREATE INDEX idx_customer_id ON superstore(customer_id);
