--  4. research question: Is there any year in which the annual increase in food prices was significantly higher than wage growth (greater than 10%)?
WITH AvgPrice AS (
    SELECT 
        `year`,
        category_code,
        ROUND(AVG(avg_price), 2) AS avg_price
    FROM 
         t_lukas_vavrcik_project_SQL_primary_final
    GROUP BY 
        `year`, category_code
),
AvgPriceDiff AS (
    SELECT
        a.`year`,
        a.category_code,
        ROUND((a.avg_price - b.avg_price) / b.avg_price * 100, 2) AS price_diff_pct
    FROM 
        AvgPrice a
    JOIN 
        AvgPrice b 
        ON a.`year` = b.`year` + 1
        AND a.category_code = b.category_code
),
AvgSalaryDiff AS (
    SELECT
        a.`year`,
        ROUND(((a.avg_salary - b.avg_salary) / b.avg_salary) * 100, 2) AS payroll_diff_pct
    FROM 
         t_lukas_vavrcik_project_SQL_primary_final a
    JOIN 
         t_lukas_vavrcik_project_SQL_primary_final b
        ON a.`year` = b.`year` + 1
        AND a.industry_branch_code = b.industry_branch_code
    GROUP BY 
        a.`year`
)
SELECT 
    p.`year`,
    p.category_code,
    p.price_diff_pct,
    s.payroll_diff_pct,
    CASE WHEN (p.price_diff_pct - s.payroll_diff_pct) > 10 THEN 1 ELSE 0 END AS flag_10_pct
FROM 
    AvgPriceDiff p
JOIN 
    AvgSalaryDiff s ON p.`year` = s.`year`
WHERE 
    (p.price_diff_pct - s.payroll_diff_pct) > 10
ORDER BY 
    p.`year`, p.category_code;