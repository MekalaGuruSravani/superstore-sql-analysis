Superstore SQL Data Analysis
Task 3 – SQL for Data Analysis


Project Overview
This project demonstrates core SQL techniques used in real-world data analysis using the Superstore dataset. The database used for this analysis is superstore_db, and the primary table explored is superstore.
The objective of this task was not just to write queries, but to understand how raw transactional data can be explored, summarized, structured, and optimized using SQL. The queries in this project move from basic data retrieval to joins, subqueries, views, and indexing, simulating how a data analyst would interact with business data in practice.


Dataset
Database: superstore_db
Primary Table: superstore
The dataset contains transactional sales records including:
Order details
Customer information
Region and category
Sales values


What Was Done and Why
1. Data Exploration Using SELECT
SELECT * FROM superstore
LIMIT 10;

I started by previewing the first few records from the dataset. This step is important in any analysis because it helps understand the structure of the data, available columns, and data types before applying filters or aggregations.
This gives a quick sense of what kind of information is available for analysis.


2. Filtering Data Using WHERE
SELECT * 
FROM superstore 
WHERE region = 'West';

After understanding the dataset, I filtered the records by region. In business scenarios, teams often want to focus on specific markets. Filtering by region allows us to isolate and analyze performance for a particular geographical segment.
This is useful for regional sales comparison or performance tracking.


3. Sorting Data Using ORDER BY
SELECT * 
FROM superstore 
ORDER BY sales DESC 
LIMIT 5;

Here, I sorted the data in descending order of sales to identify the highest-value transactions.
This type of query is commonly used to:
Identify top-performing orders
Detect unusually high transactions
Understand revenue distribution


4. Aggregation Using GROUP BY + SUM
SELECT region, SUM(sales) AS total_sales
FROM superstore
GROUP BY region;

Once individual records were explored, I moved toward summarizing data.
Grouping by region and calculating total sales helps answer business-level questions such as:
Which region generates the most revenue?
How does revenue distribution compare across regions?
Aggregation transforms transactional data into strategic insights.


5. Average Sales by Category
SELECT category, AVG(sales) AS avg_sales
FROM superstore
GROUP BY category;

Instead of total revenue, this query calculates the average sales per category.
This is useful for:
Understanding product performance
Comparing categories on average order value
Identifying pricing or demand differences across product types
Working with Multiple Tables
To demonstrate relational database concepts, I created a second table from the existing dataset.


6. Creating a Customers Table
CREATE TABLE customers AS
SELECT DISTINCT customer_id, customer_name, segment, region
FROM superstore;

In real systems, customer data is usually stored separately from transactional data.
This step simulates normalization by separating customer information into its own table. It allows us to practice joins and better understand relational structures.
Understanding Joins


7. INNER JOIN
SELECT s.order_id, s.sales, c.customer_name, c.region
FROM superstore s
INNER JOIN customers c
ON s.customer_id = c.customer_id;

An INNER JOIN returns records that exist in both tables.
This is the most common type of join and is used when combining transaction data with customer details. It ensures we only see matching records.


8. LEFT JOIN
SELECT s.order_id, c.customer_name
FROM superstore s
LEFT JOIN customers c
ON s.customer_id = c.customer_id;

A LEFT JOIN keeps all records from the left table (superstore), even if no match exists in the customers table.
This is useful for:
Identifying missing customer records
Checking data consistency


9. RIGHT JOIN
SELECT s.order_id, c.customer_name
FROM superstore s
RIGHT JOIN customers c
ON s.customer_id = c.customer_id;

A RIGHT JOIN ensures all customer records are included, even if they have no associated orders.
This helps answer questions like:
Are there customers without transactions?
Is the data complete?
Subqueries for Advanced Filtering


10. Sales Above Average
SELECT *
FROM superstore
WHERE sales > (
    SELECT AVG(sales) FROM superstore
);

This query identifies transactions where sales are above the overall average.
Subqueries are powerful when comparisons depend on computed metrics. In business terms, this can highlight:
High-value transactions
Potential premium customers
Outlier performance
Creating a View


11. Region Sales Summary View
CREATE OR REPLACE VIEW region_sales_summary AS
SELECT region, SUM(sales) AS total_sales
FROM superstore
GROUP BY region;

A view stores a query as a virtual table.
Instead of rewriting aggregation logic every time, this view allows quick access to summarized regional sales data.
Views are especially useful for:
Reporting dashboards
Business intelligence tools
Simplifying complex queries
Index Optimization


12. Creating Indexes
CREATE INDEX idx_region ON superstore(region);
CREATE INDEX idx_customer_id ON superstore(customer_id);

Indexes improve query performance.
Since filtering and joins frequently use region and customer_id, adding indexes speeds up search and join operations, especially when working with large datasets.
In production environments, indexing is critical for maintaining performance as data grows.
What This Project Demonstrates
This project reflects a typical analytical workflow:
Explore the data
Filter and sort meaningful subsets
Summarize performance metrics
Structure data relationally
Perform joins for deeper insights
Use subqueries for advanced logic
Create reusable views
Optimize performance with indexing
It moves from raw data inspection to structured and optimized querying, which mirrors how data analysts and BI professionals work with operational databases.


Tools Used
MySQL
SQL (Data Definition and Data Manipulation commands)


Conclusion
This task reinforces fundamental SQL concepts used in data analysis and business reporting. Each step builds on the previous one, transitioning from basic querying to relational operations and performance tuning.
The result is not just a collection of queries, but a structured approach to understanding and analyzing sales data in a relational database environment.
