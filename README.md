---

# **World Debt Statistics Analysis**

---

## **Project Overview**

I have worked on analyzing a World Debt Statistics dataset, which includes global debt information from 2019 to 2022. This project involves extensive querying and visualization using SQL and Power BI to explore patterns in debt across various countries and regions. The main focus was on understanding the global debt distribution, trends over the years, and identifying the countries with the highest or lowest debt burden.

Through this project, I tackled various SQL problems such as debt trend analysis, comparisons between countries, and categorization based on different economic indicators. Data was visualized using Power BI for clearer insights.

---

## **Database Setup & Design**

### **Schema Structure**

The database contains tables with the following fields: 'Country Code', 'Country Name', 'Series Name', 'Year 2019', 'Year 2020', 'Year 2021', and 'Year 2022'.

The dataset was designed to ensure proper indexing for query optimization and performance.

---

### **Constraints**

Referential integrity is maintained using primary keys and proper indexing.

Fields like 'Country Code' and 'Series Name' are unique to avoid duplication.

Consistency is maintained across the dataset by applying default values and appropriate data types.

---

## **Task: Data Cleaning**

The dataset was cleaned through the following steps:

• Removing duplicates: Duplicates were identified based on 'Country Code' and 'Year' values, ensuring that no country has repeated entries for the same year.

• Handling missing values: Missing values for certain years or countries were handled through interpolation or were marked as unavailable to maintain the dataset's integrity.

---

## **Identifying Business Problems**

Null values were addressed as follows:

Country Debt Data: Missing data for specific years were flagged as "No Data Available" for better clarity.

Economic Series: Null values in certain economic indicators were marked as placeholders, ensuring no disruption in overall analysis.
where we have used basic to advance queries for analyzing the data.

```sql
-- YEAR WITH THE HIGHEST TOTAL GLOBAL DEBT--

SELECT 
    '2018' AS year, SUM(year_2018) AS total_debt
FROM
    world_debt_statistic 
UNION ALL 
SELECT 
    '2019', SUM(year_2019)
FROM
    world_debt_statistic 
UNION ALL
SELECT 
    '2020', SUM(year_2020)
FROM
    world_debt_statistic 
UNION ALL 
SELECT 
    '2021', SUM(year_2021)
FROM
    world_debt_statistic 
UNION ALL 
SELECT 
    '2022', SUM(year_2022)
FROM
    world_debt_statistic
ORDER BY total_debt DESC
LIMIT 1;

---

-- COUNTRIES WITH CONSISTENT DEBT INCREASE --

WITH debt_growth as (
    SELECT country_name, year_2022-year_2018 AS total_growth
	FROM world_debt_statistic
)
SELECT country_name, total_growth
FROM debt_growth
WHERE total_growth>0
ORDER BY total_growth desc;
```

## **Identifying Global Debt Problems**

Key global debt issues identified:

High Debt Burden: Certain countries exhibit an unsustainable debt burden, which has been increasing over the years.

Regional Debt Discrepancies: Significant differences in debt across regions, with some regions showing more pronounced increases in recent years.

Impact of Global Events: The dataset reflects global economic challenges (like the pandemic) and their impact on debt trends.

---

## **Objectives**

The main objective of this project is to demonstrate SQL proficiency while addressing global economic challenges. This project covers various operations, including:

Country Debt Trend Analysis

Comparative Debt Analysis

Economic Indicator Analysis

Debt Categorization by Region

---

## **Learning Outcomes**

Through this project, I was able to:

Design and implement a structured database schema for global debt statistics.

Clean and preprocess a real-world dataset for financial analysis.

Use advanced SQL techniques such as joins, window functions, and aggregation.

Visualize trends and comparisons using Power BI for better business understanding.

Perform data-driven analysis to identify global trends in debt and economic health.

---

## **Conclusion**

This advanced SQL project demonstrates my ability to tackle complex financial data and derive valuable insights into global debt patterns. By leveraging SQL queries and Power BI visualizations, I was able to provide meaningful interpretations that can drive policy decisions for debt management and economic recovery.

By completing this project, I have deepened my understanding of global economic data analysis and enhanced my skills in both SQL and Power BI for large-scale data visualization and interpretation.


---
