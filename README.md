# SQL Bootcamp: Working with Sets and JOINs

A comprehensive SQL project focused on mastering set operations and table joins in PostgreSQL. This bootcamp covers essential database querying skills through hands-on exercises using a pizzeria ordering system database.

## Overview

This project covers essential SQL skills: using sets and JOIN operators, creating subqueries, sorting by multiple columns, and different types of table joins. You'll learn to find intersections and differences in data, which is important for data analysis and solving business problems.

These skills are useful in query development, data analytics, and database administration.

## What You'll Learn

- Set operations: `UNION`, `INTERSECT`, `EXCEPT`
- Different types of JOINs: `INNER`, `NATURAL`, `CROSS`
- Subqueries and nested SELECT statements
- Data filtering with `IN` and `EXISTS`
- Multi-column sorting and data aggregation
- Cartesian products and their applications

## Contents
- [Chapter I](#chapter-i)
- [Introduction](#introduction)
- [Chapter II](#chapter-ii)
- [Project Guidelines](#project-guidelines)
- [Chapter III](#chapter-iii)
- [Exercise 00 — Let's make UNION dance](#exercise-00--lets-make-union-dance)
- [Exercise 01 — UNION dance with subquery](#exercise-01--union-dance-with-subquery)
- [Exercise 02 — Duplicates or not duplicates](#exercise-02--duplicates-or-not-duplicates)
- [Exercise 03 — "Hidden" Insights](#exercise-03--hidden-insights)
- [Exercise 04 — Difference? Yep, let's find the difference between multisets](#exercise-04--difference-yep-lets-find-the-difference-between-multisets)
- [Exercise 05 — Did you hear about Cartesian Product?](#exercise-05--did-you-hear-about-cartesian-product)
- [Exercise 06 — Lets see on "Hidden" Insights](#exercise-06--lets-see-on-hidden-insights)
- [Exercise 07 — Just make a JOIN](#exercise-07--just-make-a-join)
- [Exercise 08 — Migrate JOIN to NATURAL JOIN](#exercise-08--migrate-join-to-natural-join)
- [Exercise 09 — IN versus EXISTS](#exercise-09--in-versus-exists)
- [Exercise 10 — Global JOIN](#exercise-10--global-join)

## Chapter I
## Introduction

Relational databases use the concept of sets in various aspects. Not only for UNION or MINUS operations between sets, but sets are also excellent for executing recursive queries.

PostgreSQL supports the following set operators:

- UNION [ALL]
- EXCEPT [ALL]
- INTERSECT [ALL]

The ALL keyword indicates that duplicate rows will be preserved in the result.

Basic rules for working with sets:

- The main SQL query defines the final attribute names for the entire result.
- In subordinate SQL queries, the number of columns and their types must match the structure of the main query.

Additionally, sets in SQL are useful for calculating specific metrics in Data Science — for example, the Jaccard distance between two objects based on available data features.

## Chapter II
## Getting Started

### Prerequisites

- PostgreSQL (latest version recommended)
- SQL client (psql, DataGrip, pgAdmin, or any preferred IDE)
- Basic understanding of relational databases

### Setup Instructions

1. **Database Setup**
   - Ensure you have PostgreSQL installed and running
   - Create a new database for this project
   - Download the [database model script](./materials/model.sql)
   - Apply the script to your database using one of these methods:
     ```bash
     # Using psql
     psql -d your_database_name -f materials/model.sql

     # Or use your preferred SQL IDE (DataGrip, pgAdmin, etc.)
     ```

2. **Project Structure**
   - Each exercise has its own directory (`ex00`, `ex01`, etc.)
   - Solutions should be placed in the corresponding directories
   - Follow the naming convention: `day01_ex00.sql`, `day01_ex01.sql`, etc.

3. **Important Notes**
   - Read the "Allowed" and "Prohibited" sections in each exercise carefully
   - These restrictions are designed to help you practice specific SQL concepts
   - Test your queries against the sample database to verify results

Before starting the exercises, study the logical structure of the database model below.

### Database Schema

1. **Table pizzeria** (pizzeria directory)
   - field id - primary key
   - field name - pizzeria name
   - field rating - average pizzeria rating (from 0 to 5 points)

2. **Table person** (directory of pizza-loving customers)
   - field id - primary key
   - field name - person's name
   - field age - person's age
   - field gender - person's gender
   - field address - person's address

3. **Table menu** (directory with available menu and prices for specific pizzas)
   - field id - primary key
   - field pizzeria_id - foreign key to pizzeria table
   - field pizza_name - pizza name in the pizzeria
   - field price - price of a specific pizza

4. **Table person_visits** (pizzeria visit log)
   - field id - primary key
   - field person_id - foreign key to person table
   - field pizzeria_id - foreign key to pizzeria table
   - field visit_date - visit date (e.g., 2022-01-01)

5. **Table person_order** (order log)
   - field id - primary key
   - field person_id - foreign key to person table
   - field menu_id - foreign key to menu table
   - field order_date - order date (e.g., 2022-01-01)

Pizzeria visits and orders are different entities with no direct data dependency. For example, a customer can be in one restaurant just browsing the menu while simultaneously placing an order at another restaurant by phone or mobile app. Or another option - being at home and placing an order by phone without visiting the establishment at all.

## Chapter III
## Exercise 00 — Let's make UNION dance

| Exercise 00: Let's make UNION dance | |
|-----------------------------------|--|
| Solution directory | ex00 |
| Files to submit | `day01_ex00.sql` |
| **Allowed** | |
| Language | ANSI SQL |

Write an SQL query that combines into one common list the menu IDs and pizza names from the menu table, as well as the IDs and names of people from the person table.

In the final result, columns should be named as shown in the example below - first selection by object_id, then by object_name.

| object_id | object_name |
|-----------|-------------|
| 1 | Anna |
| 1 | cheese pizza |
| ... | ... |

## Exercise 01 — UNION dance with subquery

| Exercise 01: UNION dance with subquery | |
|--------------------------------------|--|
| Solution directory | ex01 |
| Files to submit | `day01_ex01.sql` |
| **Allowed** | |
| Language | ANSI SQL |

Modify the SQL query from "Exercise 00" as follows:

- Remove the object_id column
- Change the sort order: first display data from the person table (by object_name), then from the menu table (also by object_name) - as shown in the example below

Keep duplicate rows.

| object_name |
|-------------|
| Andrey |
| Anna |
| ... |
| cheese pizza |
| cheese pizza |
| ... |

## Exercise 02 — Duplicates or not duplicates

| Exercise 02: Duplicates or not duplicates | |
|-----------------------------------------|--|
| Solution directory | ex02 |
| Files to submit | `day01_ex02.sql` |
| **Allowed** | |
| Language | ANSI SQL |
| **Prohibited** | |
| SQL syntax constructions | `DISTINCT`, `GROUP BY`, `HAVING`, all types of `JOINs` |

Write an SQL query that:

- Returns unique pizza names from the menu table
- Sorts results by the pizza_name column in descending order

Before starting work, be sure to review the "Prohibited" section.

## Exercise 03 — "Hidden" Insights

| Exercise 03: "Hidden" Insights | |
|------------------------------|--|
| Solution directory | ex03 |
| Files to submit | `day01_ex03.sql` |
| **Allowed** | |
| Language | ANSI SQL |
| **Prohibited** | |
| SQL syntax constructions | all types of `JOINs` |

Write an SQL query that:

Finds the intersection of data by:

- Order date (order_date) and person ID (person_id) from the person_order table
- Visit date (visit_date) and person ID (person_id) from the person_visits table

See the example below. In simple terms, you need to find the IDs of people who both visited an establishment and ordered pizza on the same day.

The result should be sorted first by action date (action_date) in ascending order, then by person_id - in descending order.

| action_date | person_id |
|-------------|-----------|
| 2022-01-01 | 6 |
| 2022-01-01 | 2 |
| 2022-01-01 | 1 |
| 2022-01-03 | 7 |
| 2022-01-04 | 3 |
| ... | ... |

## Exercise 04 — Difference? Yep, let's find the difference between multisets

| Exercise 04: Difference? Yep, let's find the difference between multisets | |
|-------------------------------------------------------------------------|--|
| Solution directory | ex04 |
| Files to submit | `day01_ex04.sql` |
| **Allowed** | |
| Language | ANSI SQL |
| **Prohibited** | |
| SQL syntax constructions | all types of `JOINs` |

Write an SQL query that returns the difference (MINUS operation) by person_id column values between the person_order and person_visits tables, while preserving duplicates.

The query should only consider records for January 7, 2022

- For the person_order table - where order_date = '2022-01-07'
- For the person_visits table - where visit_date = '2022-01-07'

## Exercise 05 — Did you hear about Cartesian Product?

| Exercise 05: Did you hear about Cartesian Product? | |
|-------------------------------------------------|--|
| Solution directory | ex05 |
| Files to submit | `day01_ex05.sql` |
| **Allowed** | |
| Language | ANSI SQL |

Write an SQL query that returns all possible combinations of records from the person and pizzeria tables.

When executing the query, columns with IDs from the person table should come first, then from the pizzeria table.

Study the sample expected result below.

Note that the column names in your result may differ from the example.

| person.id | person.name | age | gender | address | pizzeria.id | pizzeria.name | rating |
|-----------|-------------|-----|--------|---------|-------------|---------------|--------|
| 1 | Anna | 16 | female | Moscow | 1 | Pizza Hut | 4.6 |
| 1 | Anna | 16 | female | Moscow | 2 | Dominos | 4.3 |
| ... | ... | ... | ... | ... | ... | ... | ... |

## Exercise 06 — Lets see on "Hidden" Insights

| Exercise 06: Lets see on "Hidden" Insights | |
|------------------------------------------|--|
| Solution directory | ex06 |
| Files to submit | `day01_ex06.sql` |
| **Allowed** | |
| Language | ANSI SQL |

Let's return to Exercise 03 and modify the SQL query so that it returns people's names instead of their IDs.

Change the sorting:

- First by action date (action_date) in ascending order
- Then by person name (person_name) in descending order

Study the sample expected result below.

| action_date | person_name |
|-------------|-------------|
| 2022-01-01 | Irina |
| 2022-01-01 | Anna |
| 2022-01-01 | Andrey |
| ... | ... |

## Exercise 07 — Just make a JOIN

| Exercise 07: Just make a JOIN | |
|------------------------------|--|
| Solution directory | ex07 |
| Files to submit | `day01_ex07.sql` |
| **Allowed** | |
| Language | ANSI SQL |

Write an SQL query that returns:

- Order date from the person_order table
- Name of the person who made the order (from the person table), name and age should be formatted as shown in the sample below

Sort results by both columns in ascending order.

| order_date | person_information |
|------------|-------------------|
| 2022-01-01 | Andrey (age:21) |
| 2022-01-01 | Andrey (age:21) |
| 2022-01-01 | Anna (age:16) |
| ... | ... |

## Exercise 08 — Migrate JOIN to NATURAL JOIN

| Exercise 08: Migrate JOIN to NATURAL JOIN | |
|------------------------------------------|--|
| Solution directory | ex08 |
| Files to submit | `day01_ex08.sql` |
| **Allowed** | |
| Language | ANSI SQL |
| SQL syntax constructions | `NATURAL JOIN` |
| **Prohibited** | |
| SQL syntax constructions | all types of `JOINs` |

Rewrite the SQL query from Exercise 07 using the NATURAL JOIN construction. The result should match the result from Exercise 07.

## Exercise 09 — IN versus EXISTS

| Exercise 09: IN versus EXISTS | |
|------------------------------|--|
| Solution directory | ex09 |
| Files to submit | `day01_ex09.sql` |
| **Allowed** | |
| Language | ANSI SQL |

Write two SQL queries that return a list of pizzerias not visited by people: the first - using the IN operator, the second - using EXISTS.

## Exercise 10 — Global JOIN

| Exercise 10: Global JOIN | |
|-------------------------|--|
| Solution directory | ex10 |
| Files to submit | `day01_ex10.sql` |
| **Allowed** | |
| Language | ANSI SQL |

Write an SQL query that returns a list of names of people who ordered pizza at the corresponding pizzeria.

Returns a list of people who ordered pizza, indicating:

- Customer name
- Pizza name
- Pizzeria name

Sort results by three columns (all ascending):

- person_name (customer name)
- pizza_name (pizza name)
- pizzeria_name (pizzeria name)

Study the sample expected result below.

| person_name | pizza_name | pizzeria_name |
|-------------|------------|---------------|
| Andrey | cheese pizza | Dominos |
| Andrey | mushroom pizza | Dominos |
| Anna | cheese pizza | Pizza Hut |
| ... | ... | ... |

## Learning Resources

- [PostgreSQL Official Documentation](https://www.postgresql.org/docs/)
- [SQL Tutorial - W3Schools](https://www.w3schools.com/sql/)
- [Understanding SQL JOINs](https://www.postgresql.org/docs/current/tutorial-join.html)
- [Set Operations in SQL](https://www.postgresql.org/docs/current/queries-union.html)

## Contributing

This project is primarily for educational purposes. If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

This project is based on a SQL bootcamp curriculum designed to teach fundamental database querying concepts through practical exercises.
