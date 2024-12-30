-- 3. research question: Which food category is becoming more expensive at the slowest rate (lowest percentage increase year-on-year)?
WITH PriceIncrease AS (
    SELECT 
        a.year,
        a.category_code,
        a.category_name,
        ROUND(((a.avg_price - b.avg_price) / b.avg_price) * 100, 2) AS yoy_percent_change
    FROM 
        t_lukas_vavrcik_project_SQL_primary_final a
    JOIN 
        t_lukas_vavrcik_project_SQL_primary_final b
        ON a.category_code = b.category_code 
        AND a.year = b.year + 1
)

SELECT 
    category_code,
    category_name,
    ROUND(AVG(yoy_percent_change), 2) AS avg_yoy_percent_change
FROM 
    PriceIncrease
GROUP BY 
    category_code, category_name
ORDER BY 
    avg_yoy_percent_change ASC
LIMIT 1;