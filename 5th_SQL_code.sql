-- 5. research question: Does the level of GDP affect changes in wages and food prices? If GDP rises significantly in one year, will this be reflected in a more significant increase in food prices or wages in the same or the following year? 
WITH YearlyData AS (
    SELECT 
        a.`year`,
        a.category_code,
        ROUND(((a.GDP - b.GDP) / b.GDP) * 100, 2) AS GDP_diff_pct,
        ROUND(a.avg_price, 2) AS avg_price,
        ROUND(b.avg_price, 2) AS prev_avg_price,
        ROUND(((a.avg_salary - b.avg_salary) / b.avg_salary) * 100, 2) AS payroll_diff_pct
    FROM 
         t_lukas_vavrcik_project_SQL_primary_final a
    LEFT JOIN 
         t_lukas_vavrcik_project_SQL_primary_final b
        ON a.`year` = b.`year` + 1
        AND a.category_code = b.category_code
),
Flags AS (
    SELECT 
        yd.`year`,
        yd.category_code,
        CASE WHEN ABS(yd.GDP_diff_pct) > 3 THEN 1 ELSE 0 END AS flag_GDP_change,
        CASE WHEN ABS(ROUND((yd.avg_price - yd.prev_avg_price) / yd.prev_avg_price * 100, 2)) > 5 THEN 1 ELSE 0 END AS flag_price_5_pct,
        CASE WHEN ABS(yd.payroll_diff_pct) > 5 THEN 1 ELSE 0 END AS flag_salary_5_pct
    FROM 
        YearlyData yd
)
SELECT 
    f.`year`,
    f.category_code,
    f.flag_GDP_change,
    CASE WHEN f.flag_GDP_change = 1 AND f.flag_price_5_pct = 1 THEN 1 ELSE 0 END AS impact_price_1Y,
    CASE WHEN f.flag_GDP_change = 1 AND f2.flag_price_5_pct = 1 THEN 1 ELSE 0 END AS impact_price_2Y,
    CASE WHEN f.flag_GDP_change = 1 AND f.flag_salary_5_pct = 1 THEN 1 ELSE 0 END AS impact_salary_1Y,
    CASE WHEN f.flag_GDP_change = 1 AND f2.flag_salary_5_pct = 1 THEN 1 ELSE 0 END AS impact_salary_2Y
FROM 
    Flags f
JOIN 
    Flags f2 ON f.`year` = f2.`year` + 1
    AND f.category_code = f2.category_code
GROUP BY 
    f.`year`, f.category_code
ORDER BY 
    f.`year`, f.category_code;