# Engeto-project-4---SQL-project
Kód pro SQL projekt

# Dostupnost základních potravin široké veřejnosti #
## Popis projektu ##
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

Skripty obou datových sad naleznete zde: [Engeto-project-4_SQL_tables](https://github.com/lvavrcik/Engeto-project-4---SQL-project/blob/main/Engeto-project-4_SQL_tables.sql)

## SQL skript ##
SQL skripty vytvořené pro práci s datovými sadami jsou uloženy v pěti různých souborech tohoto repozitáře (1st - 5th_SQL_code).
Každý SQL skript odpovídá konkrétní výzkumné otázce (příklad: 1st_SQL_code.sql obsahuje skript odpovídající první výzkumné otázce).

## Odpovědi na výzkumné otázky ##
### 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? ###
Podle dostupných dat se mzdy ve většině odvětví v průběhu let zvyšovaly. "Nejslabším" odvětvím je Těžba a dobývání, kde mzdy rostly v 8 z 12 let.

### 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd? ###
Uvažujeme první (2006) a poslední srovnatelné období (2018).
V roce 2006 byla průměrná cena jednoho litru mléka (kód 114201) 14,44,- Kč. Ve stejném roce byla průměrná cena jednoho kg chleba (kód 111301) 16,12,- Kč (Kč). Průměrná mzda v roce 2006 činila 20 677,- Kč (Kč) (mzdy měřeny bez ohledu na druh odvětví). 
Vzhledem k výše uvedenému bylo možné v roce 2006 nakoupit 1432 litrů mléka a 1282 kg chleba.

V roce 2018 byla průměrná cena jednoho litru mléka (kód 114201) 19,82,- Kč (nárůst o 37,26 % oproti roku 2006). Ve stejném roce byla průměrná cena chleba (kód 111301) 24,24,- Kč (nárůst o 50,33 % oproti roku 2006). Průměrná mzda v roce 2018 činila 32.485,- Kč (mzda měřená bez ohledu na druh odvětví; nárůst o 57,11 % oproti roku 2006). 
Vzhledem k výše uvedenému bylo možné v roce 2018 nakoupit 1639 litrů mléka a 1340 kg chleba.

### 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? ###
Srovnáme-li dvě výše uvedené kategorie potravin - chléb a mléko, mléko zdražuje pomaleji - o 2,98 % ročně.

### 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)? ###
Ano, v roce 2011 vzrostly ceny potravin o více než 10 % ve srovnání s výší mezd.

### 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem? ###
Definici "výraznějšího růstu HDP“ neznáme, ale můžeme si pomoci výpočtem průměrného HDP za celé měřitelné období (1990-2020), který nám dává hodnotu 1,82 %. Počítám tedy, že „výraznější růst HDP“ bude nad tímto průměrem. Pro lepší příklad uvádím 3 % HDP.

Můžeme říci, že pokud HDP vzroste o více než 3 %, můžeme v následujících letech pozorovat změnu cen a mezd někde nad hranici 5 %. A naopak, pokud nedojde ke změně HDP nad 3 %, nedojde ani k takové změně cen a mezd (o více než 5 %).
Nelze však s jistotou říci, že lze pozorovat jasný vzorec platící ve všech případech.