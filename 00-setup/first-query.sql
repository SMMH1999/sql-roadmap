CREATE TABLE retail.customers (
    customer_id   SERIAL PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(100),
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO retail.customers (first_name, last_name, email)
VALUES
('Sara', 'Mahdavi', 'sara@example.com'),
('Ali', 'Karimi',  'ali@example.com'),
('Nima', 'Rostami','nima@example.com');

SELECT * FROM retail.customers;

CREATE TABLE retail.products (
    product_id   SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category     VARCHAR(50),
    unit_price   NUMERIC(10,2) NOT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO retail.products (product_name, category, unit_price)
VALUES
('Laptop 14 inch', 'Electronics', 32000),
('Wireless Mouse', 'Electronics', 350),
('Office Chair',   'Furniture',   4200),
('Coffee Mug',     'Kitchen',     120),
('Notebook A5',    'Stationery',  45);
