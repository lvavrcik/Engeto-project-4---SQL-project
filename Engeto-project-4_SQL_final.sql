-- vytvoření tabulky 1 - t_{jmeno}_{prijmeni}_project_SQL_primary_final (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky)
CREATE TABLE t_lukas_vavrcik_project_SQL_primary_final (
    year INT,
    industry_branch_code VARCHAR(10),
    industry_name VARCHAR(255),
    avg_salary DECIMAL(10, 2),
    avg_price_bread DECIMAL(10, 2),
    avg_price_milk DECIMAL(10, 2),
    GDP DECIMAL(15, 2)
);

-- vytvoření tabulky 2 - t_{jmeno}_{prijmeni}_project_SQL_secondary_final (pro dodatečná data o dalších evropských státech)
CREATE TABLE t_lukas_vavrcik_project_SQL_secondary_final (
	country VARCHAR(100),
    year INT,
    GDP DECIMAL(15, 2),
    GINI DECIMAL(10, 2),
    population INT
);

-- STEP2: check, jestli jsou tabulky vytvořené + správný datový typ

SELECT *
FROM t_lukas_vavrcik_project_SQL_primary_final;

SELECT *
FROM t_lukas_vavrcik_project_SQL_secondary_final;

/*STEP 3: zjištění srovnatelných období z tabulek:
- czechia_price
- czechia_payroll
*/
SELECT DISTINCT 
	MIN(date_from) AS min,
	MAX(date_from) AS max
FROM czechia_price as cp
UNION
SELECT DISTINCT 
	MIN(payroll_year) as min_cpay,
	MAX(payroll_year) as max_cpay
FROM czechia_payroll as cpay
;

