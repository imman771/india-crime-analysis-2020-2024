
-- ============================================
-- PROJECT: INDIA CRIME ANALYSIS (2020-2024)
-- Tools: Python, MySQL and Power BI
-- ============================================

-- 1. Create database
CREATE DATABASE IF NOT EXISTS india_crime_analysis;

-- Select database
USE india_crime_analysis;

-- 2. Create crime data table
CREATE TABLE IF NOT EXISTS crime_data (
    State_UT VARCHAR(100) NOT NULL,
    Year INT NOT NULL,
    Reported_Crime_Count BIGINT,
    `Rank` INT,
    PRIMARY KEY (State_UT, Year)
);

-- 3. Display table structure
DESCRIBE crime_data;

-- 4. Display all records
SELECT * FROM crime_data;


-- ============================================
-- 5. YEAR-WISE CRIME ANALYSIS
-- ============================================

SELECT
    Year,
    SUM(Reported_Crime_Count) AS Total_Reported_Crimes
FROM crime_data
GROUP BY Year
ORDER BY Year;


-- ============================================
-- 6. STATE-WISE CRIME ANALYSIS
-- ============================================

SELECT
    State_UT,
    SUM(Reported_Crime_Count) AS Total_Reported_Crimes
FROM crime_data
GROUP BY State_UT
ORDER BY Total_Reported_Crimes DESC;


-- ============================================
-- 7. TAMIL NADU CRIME ANALYSIS
-- ============================================

SELECT
    State_UT,
    Year,
    Reported_Crime_Count
FROM crime_data
WHERE State_UT = 'Tamil Nadu'
ORDER BY Year;


-- ============================================
-- 8. TOP 10 STATES/UTs
-- ============================================

SELECT
    State_UT,
    SUM(Reported_Crime_Count) AS Total_Reported_Crimes
FROM crime_data
GROUP BY State_UT
ORDER BY Total_Reported_Crimes DESC
LIMIT 10;


-- ============================================
-- 9. DATA VALIDATION
-- ============================================

SELECT COUNT(*) AS Total_Records
FROM crime_data;

SELECT COUNT(*) AS Missing_State_Records
FROM crime_data
WHERE State_UT IS NULL OR State_UT = '';

SELECT COUNT(*) AS Duplicate_State_Year_Records
FROM (
    SELECT State_UT, Year
    FROM crime_data
    GROUP BY State_UT, Year
    HAVING COUNT(*) > 1
) AS duplicates;
