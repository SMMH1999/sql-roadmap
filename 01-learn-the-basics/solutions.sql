-- 01 - Learn the Basics: Example Solutions
-- NOTE: Many questions are conceptual; answers are provided as comments.
-- This file focuses on example SQL related to the exercises.

------------------------------------------------------------
-- 1. Relational Databases
------------------------------------------------------------

-- Example schema idea for a simple retail analytics database:

-- Customers table
-- PK: customer_id
CREATE TABLE IF NOT EXISTS customers (
    customer_id   SERIAL PRIMARY KEY,
    first_name    VARCHAR(100),
    last_name     VARCHAR(100),
    email         VARCHAR(255) UNIQUE,
    city          VARCHAR(100),
    created_at    TIMESTAMP DEFAULT NOW()
);

-- Orders table
-- PK: order_id
-- FK: customer_id -> customers(customer_id)
CREATE TABLE IF NOT EXISTS orders (
    order_id      SERIAL PRIMARY KEY,
    customer_id   INT NOT NULL REFERENCES customers(customer_id),
    order_date    DATE NOT NULL,
    status        VARCHAR(50),
    total_amount  NUMERIC(12, 2)
);

-- Products table
-- PK: product_id
CREATE TABLE IF NOT EXISTS products (
    product_id    SERIAL PRIMARY KEY,
    product_name  VARCHAR(255) NOT NULL,
    category      VARCHAR(100),
    unit_price    NUMERIC(10, 2)
);

-- Order items table
-- PK: order_item_id
-- FK: order_id -> orders(order_id)
-- FK: product_id -> products(product_id)
CREATE TABLE IF NOT EXISTS order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id      INT NOT NULL REFERENCES orders(order_id),
    product_id    INT NOT NULL REFERENCES products(product_id),
    quantity      INT NOT NULL,
    line_total    NUMERIC(12, 2)
);

------------------------------------------------------------
-- 2. Example SELECT queries related to the exercises
------------------------------------------------------------

-- Q: Business question example:
-- "Show the total sales amount per customer."
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_sales
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;

-- Q: Example: customers from a specific city (e.g., Tehran)
SELECT
    customer_id,
    first_name,
    last_name,
    email,
    city
FROM customers
WHERE city = 'Tehran';

-- Q: Example: total sales per day
SELECT
    order_date,
    SUM(total_amount) AS daily_sales
FROM orders
GROUP BY order_date
ORDER BY order_date;

-- Q: Example: top 5 products by revenue
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.line_total) AS total_revenue
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

------------------------------------------------------------
-- 3. Conceptual answers (as comments)
------------------------------------------------------------

-- Example conceptual answers (short form):

-- Relational DB good fits:
-- 1) Online store (customers, orders, products, payments)
-- 2) University system (students, courses, enrollments)
-- 3) Inventory and accounting (items, warehouses, transactions)

-- PostgreSQL good for analytics because:
-- - Open source and widely supported
-- - Strong SQL + advanced features (window functions, CTEs, JSONB)
-- - Integrates easily with BI tools

-- SQL vs NoSQL (from analyst POV):
-- - SQL: structured, strong schema, ACID, great for KPIs and dashboards
-- - NoSQL: flexible schema, great for logs/events, complements but does not replace SQL

