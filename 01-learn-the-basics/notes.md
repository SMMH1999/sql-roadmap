# 01 - Learn the Basics

## 1. Relational Databases

- A **relational database** stores data in structured tables (rows and columns).
- Each table represents one type of entity (e.g., `customers`, `orders`, `products`).
- Key concepts:
  - **Table**: A set of related data (like a spreadsheet sheet).
  - **Row / Record**: One instance of the entity (one customer, one order, etc.).
  - **Column / Field**: One attribute of the entity (name, email, price, etc.).
  - **Primary Key (PK)**: A column (or set of columns) that uniquely identifies each row.
  - **Foreign Key (FK)**: A column that references a primary key in another table, creating relationships.

## 2. RDBMS – Benefits and Limitations

### Benefits

- **Structured data**: Strong schema and data types make data predictable and consistent.
- **Data integrity**: Constraints like PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK keep data valid.
- **Powerful querying**: SQL supports complex filters, joins, aggregations, and analytical queries.
- **Transactions & ACID**:
  - **A**tomicity – all-or-nothing execution of a transaction.
  - **C**onsistency – database moves from one valid state to another valid state.
  - **I**solation – concurrent transactions do not interfere as if they were run sequentially.
  - **D**urability – committed changes persist even after failures.

### Limitations

- Designed mainly for **structured data**.
- Less natural for large volumes of **unstructured** or highly nested data.
- Scaling **vertically** (bigger server) is easier than scaling **horizontally** (many servers).
- May become slow or expensive at very large scale (big data use cases).

## 3. What is SQL and where is it used?

- **SQL (Structured Query Language)** is the standard language for working with relational databases.
- SQL is **declarative**: you describe *what* you want, not *how* to compute it.
- Core operations:
  - `SELECT` – read data
  - `INSERT` – add new rows
  - `UPDATE` – modify existing rows
  - `DELETE` – remove rows
  - DDL commands like `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`

### Where SQL is used

- **Data Analytics**: reporting, KPIs, cohort analysis, customer behavior, funnel analysis, etc.
- **Data Engineering**: ETL/ELT pipelines, data warehouses, data marts.
- **Back-End Development**: storing and retrieving application data.
- **BI Tools**: Power BI, Tableau, Metabase, Looker, etc., all speak SQL.

## 4. PostgreSQL Overview

- PostgreSQL is an open-source **relational database management system (RDBMS)**.
- Known as “the world’s most advanced open-source relational database”.
- Strong support for:
  - Standard SQL
  - **JSON/JSONB** for semi-structured data
  - Advanced indexing (B-Tree, Hash, GIN, GiST, BRIN)
  - Window functions and CTEs
  - Extensions (e.g., `postgis`, `uuid-ossp`, `pg_stat_statements`)

### Why PostgreSQL for analytics?

- Free and open-source.
- Excellent integration with BI tools.
- Great performance for small to medium analytical workloads.
- Can mix relational and semi-structured data (JSONB).

## 5. SQL vs NoSQL Databases

### SQL Databases (Relational)

- Structured tables, fixed schema, strong consistency and ACID.
- Great for:
  - Transactional systems (orders, payments, inventory).
  - Analytical queries on structured data (sales, KPIs, customer analytics).

### NoSQL Databases

- “Not Only SQL”: document, key-value, wide-column, or graph.
- Often **schema-less** or schema-flexible.
- Great for:
  - Unstructured or semi-structured data (logs, events, documents, JSON).
  - High-volume, high-velocity scenarios.
  - Horizontal scaling across many servers.

### From an analytics perspective

- SQL databases are usually the **core source of truth** for reporting and dashboards.
- NoSQL often acts as:
  - A source of raw, semi-structured events.
  - A complementary store that may be later ingested into a relational warehouse via **ETL** or **ELT**.

## 6. Key Supporting Concepts (Introduced in this section)

- **ACID**: Atomicity, Consistency, Isolation, Durability.
- **Vertical Scaling (Scale Up)**: make one server bigger (more CPU, RAM, disk).
- **Horizontal Scaling (Scale Out)**: use more servers and distribute data/work.
- **ETL (Extract–Transform–Load)**:
  - Extract from source → Transform data → Load into target warehouse.
- **ELT (Extract–Load–Transform)**:
  - Extract from source → Load raw data into warehouse → Transform with SQL inside the warehouse.
