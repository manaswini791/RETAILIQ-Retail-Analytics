
-- =====================================================
-- RETAILIQ - RETAIL BUSINESS INTELLIGENCE & ANALYTICS
-- SQL ANALYSIS
-- Database: RETAILIQ.db
-- Table: orders
-- =====================================================


-- STEP 1: VERIFY TOTAL RECORDS

SELECT COUNT(*) AS total_records
FROM orders;


-- STEP 2: DISPLAY FIRST 10 RECORDS

SELECT *
FROM orders
LIMIT 10;


-- STEP 3: OVERALL SALES AND PROFIT

SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM orders;


-- STEP 4: CATEGORY-WISE PERFORMANCE

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;


-- STEP 5: REGIONAL PERFORMANCE

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;


-- STEP 6: CUSTOMER SEGMENT PERFORMANCE

SELECT
    Segment,
    COUNT(DISTINCT "Customer ID") AS Total_Customers,
    COUNT(DISTINCT "Order ID") AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- STEP 7: TOP 10 CUSTOMERS BY SALES

SELECT
    "Customer ID",
    "Customer Name",
    COUNT(DISTINCT "Order ID") AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY "Customer ID", "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 10;
