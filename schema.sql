CREATE TABLE ingredients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price_per_unit REAL NOT NULL,
    unit TEXT NOT NULL
);
CREATE TABLE donuts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    is_gluten_free BOOLEAN NOT NULL,
    price REAL NOT NULL
);
CREATE TABLE ingredients_donuts (
    donut_id INTEGER,
    ingredient_id INTEGER,
    FOREIGN KEY (donut_id) REFERENCES donuts(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);
CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);
CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    order_date TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
CREATE TABLE order_items (
    order_id INTEGER,
    donut_id INTEGER,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (donut_id) REFERENCES donuts(id)
);
