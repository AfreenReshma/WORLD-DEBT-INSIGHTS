SELECT * FROM projects.world_debt_statistic;
use projects;

SET GLOBAL LOCAL_INFILE=ON;
LOAD DATA LOCAL INFILE "C:\Users\afree\OneDrive\Desktop\projects\world debt statistics dataset.csv" INTO TABLE world_debt_statistic
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


-- SELECT THE DISTINCT COUNTRY NAMES --
SELECT DISTINCT
    (country_name), country_code
FROM
    world_debt_statistic;

SELECT count(country_code) AS No_of_country FROM world_debt_statistic;
    
    
-- CALCULATE THE TOTAL DEBT PER SERIES FOR EACH YEAR--
SELECT 
    series_name,
    SUM(year_2018) AS total_2018,
    SUM(year_2019) AS total_2019,
    SUM(year_2020) AS total_2020,
    SUM(year_2021) AS total_2021,
    SUM(year_2022) AS total_2022
FROM
    world_debt_statistic
GROUP BY series_name;


-- RETRIVE THE COUNTRIES WITH SIGNIFICANT INCREASE BETWEEN 2018 TO 2022 --
SELECT 
    country_name, (year_2022 - year_2018) AS debt_increase
FROM
    world_debt_statistic
WHERE
    (year_2022 - year_2018) > 1000000
ORDER BY debt_increase DESC;

    
    
-- TOTAL DEBT OF ALL THE COUNTRIES FOR THE YEAR 2018, 2019, 2020, 2021, 2022 --
SELECT 
    country_name,
    SUM(year_2018) AS total_2018,
    SUM(year_2019) AS total_2019,
    SUM(year_2020) AS total_2020,
    SUM(year_2021) AS total_2021,
    SUM(year_2022) AS total_2022
FROM
    world_debt_statistic
GROUP BY country_name;



-- HIGHEST AND LOWEST DEBT IN 2021 --
SELECT 
    MAX(year_2022) AS max_year, country_name
FROM
    world_debt_statistic
GROUP BY country_name
LIMIT 5;

SELECT 
    MIN(year_2022) AS min_year, country_name
FROM
    world_debt_statistic
GROUP BY country_name
LIMIT 5;


-- SELECT THE COUNTRIES WHERE DEBT IN 2021 GREATER THAN 2019 --
SELECT 
    SUM(year_2019) AS total_debt, country_name
FROM
    world_debt_statistic
WHERE
    year_2021 > year_2019
GROUP BY country_name;


-- CALCULATE THE DEBT DIFFERENCE YEAR BY YEAR --
SELECT 
	country_name, year_2018, year_2019, year_2020, year_2021, year_2022, 
	year_2022-LAG(year_2022,1)over(order by country_name) as debt_diff
FROM world_debt_statistic;



-- RETRIEVE THE HIGHEST DEBT IN COUNTRIES FOR 2019 --
SELECT 
    MAX(year_2019) AS total_amt, country_name
FROM
    world_debt_statistic
GROUP BY country_name
ORDER BY total_amt DESC;


-- COUNTRIES WITH CONSISTENT DEBT INCREASE --
WITH debt_growth as (
    SELECT country_name, year_2022-year_2018 AS total_growth
	FROM world_debt_statistic
)
SELECT country_name, total_growth
FROM debt_growth
WHERE total_growth>0
ORDER BY total_growth desc;



-- RETRIEVE THE AVG DEBT OF ALL COUNTRIES--
SELECT 
    country_name,
    AVG((year_2018 + year_2019 + year_2020 + year_2021 + year_2022) / 5) AS avg_debt
FROM
    world_debt_statistic
GROUP BY country_name
ORDER BY avg_debt DESC;



-- FIND THE AVG DEBT FOR THE YEAR 2020 --
SELECT 
    AVG(year_2020) AS avg_debt, country_name
FROM
    world_debt_statistic
GROUP BY country_name
ORDER BY avg_debt DESC
LIMIT 10;


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


-- FIND THE TOTAL DEBT IN INDIA 2021 --
SELECT 
    SUM(year_2021) AS total_amt, country_name
FROM
    world_debt_statistic
WHERE
    country_name = 'India';



-- SELECT THE COUNTRIES WHERE DEBT IN 2021 GREATER THAN 2019 --
SELECT 
    SUM(year_2019) AS total_debt, country_name
FROM
    world_debt_statistic
WHERE
    year_2021 > year_2019
GROUP BY country_name;



-- CALCULATE THE PERCENTAGE CHANGE IN DEBT FOR ALL COUNTRIES FROM 2018 TO 2022 --
SELECT 
    country_name,
    ((year_2022 - year_2018) / year_2018) * 100 AS percentage_change
FROM
    world_debt_statistic
ORDER BY percentage_change DESC;


-- RANKING COUNTRIES  BASED ON DEBT FOR THE YEAR 2022--
SELECT country_name, year_2022,
rank() over(order by year_2022 desc) as debt_rank_2022
FROM world_debt_statistic;






