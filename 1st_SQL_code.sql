-- 1. research question: Have wages in all sectors been rising over the years, or have they been falling in some?

WITH YearlyDifference AS (
    SELECT 
    	a.industry_branch_code,
    	a.`year`,
        a.avg_salary AS current_salary,
        b.avg_salary AS previous_salary,
        (a.avg_salary - b.avg_salary) AS yearly_difference
    FROM t_lukas_vavrcik_project_SQL_primary_final a
    JOIN t_lukas_vavrcik_project_SQL_primary_final b 
        ON a.industry_branch_code = b.industry_branch_code 
        AND a.`year` = b.`year` + 1   
),
YearlyTrends AS (
    SELECT 
    	industry_branch_code,
        SUM(CASE WHEN yearly_difference > 0 THEN 1 ELSE 0 END) AS years_increasing,
        SUM(CASE WHEN yearly_difference < 0 THEN 1 ELSE 0 END) AS years_decreasing
    FROM YearlyDifference
    GROUP BY industry_branch_code
)
SELECT
	tms.industry_branch_code,
    tms.industry_name,
    yt.years_increasing, 
    yt.years_decreasing,
    CASE WHEN years_increasing > years_decreasing THEN 1 ELSE 0 END AS overall_increasing
FROM 
     t_lukas_vavrcik_project_SQL_primary_final tms
JOIN YearlyTrends yt ON tms.industry_branch_code = yt.industry_branch_code 
GROUP BY
	tms.industry_branch_code
ORDER BY 
    tms.industry_branch_code;