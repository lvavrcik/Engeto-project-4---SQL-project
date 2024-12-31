# Engeto-project-4---SQL-project
Code for SQL project

> **Čeština:**  
> [Přečtěte si českou verzi README](README_cs.md)


# Availability of staple foods to the general public #
## Project description ##
Within this project, I am answering defined research questions (see below) that address the affordability of staple foods to the general public based on average incomes over a period of time.
The output of the project is two database tables from which the required data needed to answer the research questions can be extracted.
These tables are: 
- for wage and food price data for the Czech Republic aggregated to the same comparable period - common years
- for additional data on other European countries

Another output is a set of SQLs that extract data from the prepared tables to answer the defined research questions. 

## Researched questions & answers ##
- Have wages in all the sectors been rising over the years, or have they been falling in some?
- How many litres of milk and kilograms of bread can be bought in the first and last comparable periods in the available price and wage data?
- Which food category is becoming more expensive at the slowest rate (lowest percentage increase year on year)?
- Is there a year in which the annual increase in food prices was significantly higher than the increase in wages (greater than 10%)?
- Does the level of GDP affect changes in wages and food prices? Or, if GDP rises more significantly in one year, does this translate into a more significant rise in food prices or wages in the same or subsequent year?

## Datasets used ##
The datasets used for the project are the tables described above: 
- TABLE 1: for wage and food price data for the Czech Republic aggregated to the same comparable period - common years.
- TABLE 2: for additional data on other European countries, including GDP, population and GINI coefficient.

Both datasets scripts can be found here: [Engeto-project-4_SQL_tables](https://github.com/lvavrcik/Engeto-project-4---SQL-project/blob/main/Engeto-project-4_SQL_tables.sql)

## SQL script ##
The SQL scripts created to work with datasets are stored in five different files withing this repository (1st - 5th_SQL_code).

## Answering the questions ##
### 1. Have wages in all the sectors been rising over the years, or have they been falling in some? ###
According to the data, wages have been rising over the years in most sectors. The weakest sector is Mining and Quarrying, where wages have risen in 8 out of 12 years.

### 2. How many litres of milk and kilograms of bread can be bought in the first and last comparable periods in the available price and wage data? ###
We consider the first (2006) and the last comparable periods (2018).
In 2006, the average price of one litre of milk (code 114201) was 14.44,- Kč (CZK). In the same year, the average price of pne kilogram of bread (code 111301) was 16.12,- Kč (CZK). The average wage in 2006 was 20 677,- Kč (CZK) (wages measured regardless of the type of industry). 
In view of the above, it was possible to buy 1432 litres of milk and 1282 kg of bread in 2006.

In 2018, the average price of one litre of milk (code 114201) was 19.82,- Kč (CZK) (an increase of 37.26 % compared to 2006). In the same year, the average price of bread (code 111301) was 24.24,- Kč (CZK) (an increase of 50.33 % compared to 2006). The average wage in 2018 was 32,485,- Kč (CZK) (wage measured regardless of the type of industry; an increase of 57.11 % compared to 2006). 
Given the above, it was possible to buy 1,639 litres of milk and 1,340 kg of bread in 2018.