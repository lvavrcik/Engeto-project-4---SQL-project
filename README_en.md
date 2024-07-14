# Engeto-project-4---SQL-project
Code for SQL project

# Dostupnost základních potravin široké veřejnosti #
## Project description ##
V rámci tohoto projektu odpovídám na definované výzkumné otázky (viz níže), které adresují dostupnost základních potravin široké veřejnosti na základě průměrných příjmů za určité časové období.
Výstupem projektu jsou dvě tabulky v databázi, ze kterých se požadovaná data nutné k zodpovězení výzkumných otázek dají získat.
Jedná se o tabulky: 
- pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky
- pro dodatečná data o dalších evropských státech

Dalším výstupem je sada SQL, které z připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky. 

## Výzkumné otázky a odpovědi na ně##
- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
- Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
- Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
- Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

## Použité datové sady ##
Datové sady použité pro projekt jsou výše popsané tabulky: 
- TABULKA 1: pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky.
- TABULKA 2: pro dodatečná data o dalších evropských státech, včetně HDP, populace a GINI koeficientu.

## SQL script ##
SQL script vytvořený k práci s datovými sadami je uložen zde: 