# SQL Bootcamp - Day 01

A comprehensive exploration of set operations and table joins in SQL, focusing on UNION, INTERSECT, EXCEPT operations, and various JOIN techniques for relational data analysis.

## Overview

This project demonstrates proficiency in advanced SQL querying through set theory and table relationships. The exercises utilize a pizza delivery database schema to practice real-world scenarios involving multiple table operations, data intersection, and complex joins.

## Database Schema

The project uses a relational database with five interconnected tables:

- **pizzeria** - Restaurant directory with ratings
- **person** - Customer information
- **menu** - Pizza offerings and prices by restaurant
- **person_visits** - Visit history to restaurants
- **person_order** - Order transaction records

### Table Details

**pizzeria**
- `id` (primary key) - Unique identifier
- `name` - Pizzeria name
- `rating` - Average rating (0-5 scale)

**person**
- `id` (primary key) - Unique identifier
- `name` - Customer name
- `age` - Customer age
- `gender` - Gender identifier
- `address` - Customer address

**menu**
- `id` (primary key) - Unique identifier
- `pizzeria_id` (foreign key) - References pizzeria
- `pizza_name` - Name of pizza
- `price` - Pizza price

**person_visits**
- `id` (primary key) - Unique identifier
- `person_id` (foreign key) - References person
- `pizzeria_id` (foreign key) - References pizzeria
- `visit_date` - Date of visit

**person_order**
- `id` (primary key) - Unique identifier
- `person_id` (foreign key) - References person
- `menu_id` (foreign key) - References menu
- `order_date` - Date of order

## Skills Demonstrated

- Set operations (`UNION`, `INTERSECT`, `EXCEPT`) with and without duplicates
- Combining data from multiple tables using set theory
- Finding intersections and differences between datasets
- Various JOIN types (`INNER JOIN`, `NATURAL JOIN`, `CROSS JOIN`)
- Cartesian products and their practical applications
- Subquery usage with `IN` and `EXISTS` operators
- String concatenation and formatting
- Multi-column sorting strategies
- Query optimization with constraints
- Alternative querying approaches for the same result

## Project Structure

```
.
├── materials/
│   └── model.sql          # Database schema and seed data
├── src/
│   ├── ex00/              # UNION operations
│   ├── ex01/              # UNION with ordering
│   ├── ex02/              # Removing duplicates with EXCEPT
│   ├── ex03/              # INTERSECT operations
│   ├── ex04/              # Set differences (EXCEPT)
│   ├── ex05/              # Cartesian products
│   ├── ex06/              # INTERSECT with JOINs
│   ├── ex07/              # String formatting with JOINs
│   ├── ex08/              # NATURAL JOIN
│   ├── ex09/              # IN vs EXISTS comparison
│   └── ex10/              # Multi-table JOINs
└── README.md
```

## Setup

1. Ensure PostgreSQL is installed on your system
2. Create a new database:
   ```bash
   createdb pizza_db
   ```
3. Load the database schema and data:
   ```bash
   psql -d pizza_db -f materials/model.sql
   ```
4. Run individual exercises:
   ```bash
   psql -d pizza_db -f src/ex00/day01_ex00.sql
   ```

## Exercises

### Exercise 00: Let's make UNION dance

Combine menu items and person names into a unified result set using UNION.

**Skills:** Basic UNION operation, column aliasing

### Exercise 01: UNION dance with subquery

Modify UNION query to preserve duplicates and control sort order.

**Skills:** UNION ALL, custom sorting

### Exercise 02: Duplicates or not duplicates

Remove duplicates from pizza names without using DISTINCT, GROUP BY, or JOINs.

**Skills:** EXCEPT operation for deduplication

### Exercise 03: "Hidden" Insights

Find customers who both visited and ordered on the same day using INTERSECT.

**Skills:** INTERSECT operation, multi-column sorting

### Exercise 04: Difference? Yep, let's find the difference between multisets

Identify people who ordered but didn't visit on a specific date.

**Skills:** EXCEPT operation, set difference with duplicates

### Exercise 05: Did you hear about Cartesian Product?

Generate all possible combinations of persons and pizzerias.

**Skills:** CROSS JOIN, Cartesian products

### Exercise 06: Lets see on "Hidden" Insights

Enhance Exercise 03 by displaying customer names instead of IDs.

**Skills:** Combining INTERSECT with joins for enriched data

### Exercise 07: Just make a JOIN

Format customer order information with string concatenation.

**Skills:** INNER JOIN, string formatting, CONCAT function

### Exercise 08: Migrate JOIN to NATURAL JOIN

Rewrite Exercise 07 using NATURAL JOIN syntax.

**Skills:** NATURAL JOIN, understanding implicit join conditions

### Exercise 09: IN versus EXISTS

Compare two approaches to subquery filtering: IN and EXISTS.

**Skills:** Subquery optimization, IN operator, EXISTS operator

### Exercise 10: Global JOIN

Create a comprehensive report joining customers, orders, menu items, and pizzerias.

**Skills:** Multi-table joins, three-way JOIN operations

## Constraints

Each exercise has specific requirements and restrictions:

- **Language:** ANSI SQL
- Some exercises prohibit JOINs to emphasize set operations
- Some exercises prohibit DISTINCT, GROUP BY to focus on alternative techniques
- Emphasis on multiple solution approaches for the same problem

## Technologies

- **PostgreSQL** (latest version recommended)
- **SQL** (ANSI standard)

## Learning Outcomes

This project develops intermediate to advanced SQL skills essential for:

- Complex data analysis across multiple tables
- Understanding set theory in relational databases
- Optimizing queries with different JOIN strategies
- Backend application development
- Data warehousing and ETL processes
- Database performance tuning

## License

This project is available under the MIT License. See [LICENSE](LICENSE) for details.

---

**Note:** This is an educational project focusing on set operations and JOIN techniques in SQL.
