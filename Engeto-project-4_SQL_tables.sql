/*
Engeto-project-4_SQL_tables.sql - 4th Engeto project - SQL project
author: Lukáš Vavrčík
email: lukasvavrcik@gmail.com
discord: lukardi.
*/

-- STEP1: Primary table creation - t_{jmeno}_{prijmeni}_project_SQL_primary_final (for wage and food price data for the Czech Republic aggregated to the same comparable period - common years)
CREATE TABLE t_lukas_vavrcik_project_SQL_primary_final AS
WITH AvgSalaries AS (
    SELECT 
        cp.industry_branch_code,
        cib.name AS industry_name,
        cp.payroll_year AS year,
        ROUND(AVG(cp.value), 2) AS avg_salary
    FROM 
        czechia_payroll cp
    JOIN 
        czechia_payroll_industry_branch cib ON cp.industry_branch_code = cib.code
    WHERE 
        cp.value_type_code = '5958'
        AND cp.payroll_year BETWEEN 2006 AND 2018
        AND cp.industry_branch_code IS NOT NULL
    GROUP BY 
        cp.industry_branch_code, cp.payroll_year
),
AvgPrices AS (
    SELECT 
        YEAR(cpr.date_from) AS year,
        ROUND(AVG(cpr.value), 2) AS avg_price,
        cpr.category_code,
        cpc.name AS category_name
    FROM 
        czechia_price cpr 
    JOIN 
        czechia_price_category cpc ON cpr.category_code = cpc.code
    WHERE 
        YEAR(cpr.date_from) BETWEEN 2006 AND 2018
    GROUP BY 
        YEAR(cpr.date_from), cpr.category_code, cpc.name
),
GDPData AS (
    SELECT 
        e.year,
        e.GDP
    FROM 
        economies e
    WHERE 
        e.country = 'Czech Republic' 
        AND e.year BETWEEN 2006 AND 2018
)
SELECT 
    a.year,
    a.industry_branch_code,
    a.industry_name,
    a.avg_salary,
    p.avg_price,
    p.category_code,
    p.category_name,
    g.GDP
FROM 
    AvgSalaries a
JOIN 
    AvgPrices p ON a.year = p.year
LEFT JOIN 
    GDPData g ON a.year = g.year;

-- STEP2: Secondary table creation - t_{jmeno}_{prijmeni}_project_SQL_secondary_final (for additional data about other European countries)
CREATE TABLE t_lukas_vavrcik_project_SQL_secondary_final AS
WITH Europe AS (
    SELECT
        country
    FROM
        countries 
    WHERE
        CAST(independence_date AS INT) <= 2006
        AND continent = 'Europe'
)
SELECT 
    e.country,
    e.year,
    e.GDP,
    e.gini AS GINI,
    e.population
FROM
    economies e
JOIN 
    Europe eu ON e.country = eu.country 
WHERE 
    e.year BETWEEN 2006 AND 2018
ORDER BY 
    e.country, e.year;

-- STEP3: check if tables are created + correct data type
SELECT *
FROM t_lukas_vavrcik_project_SQL_primary_final;

SELECT *
FROM t_lukas_vavrcik_project_SQL_secondary_final;