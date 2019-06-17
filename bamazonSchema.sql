
-- Create a MySQL Database called bamazon.
-- Then create a Table inside of that database called products.
-- The products table should have each of the following columns:

-- item_id (unique id for each product)
-- product_name (Name of product)
-- department_name
-- price (cost to customer)
-- stock_quantity (how much of the product is available in stores)DROP DATABASE IF EXISTS bamazon_db;

CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products
(
  item_id INT NOT NULL
  AUTO_INCREMENT,
  product_name VARCHAR
  (45) NOT NULL,
  department_name VARCHAR
  (45) NOT NULL,
  price INT NOT NULL,
  stock_quantity INT NOT NULL,
  PRIMARY KEY
  (item_id),
);

  -- Populate this database with around 10 different products. (i.e. Insert "mock" data rows into this database and table).

  INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
  VALUES
    (1, "K2 Rollerblades", "Recreation", 120, 2000);

  INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
  VALUES
    (2, "Kombucha Beer", "Beverages", 8, 1000);

  INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
  VALUES
    (3, "Modelo Michelada", "Beverages", 6, 500);

  INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
  VALUES
    (4, "Contact Lenses", "Vision", 150, 3000);

  INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
  VALUES
    (5, "Acai Bowl", "Food", 12, 400);

  INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
  VALUES
    (6, "iPhone charger", "Electronics", 20, 1000);

  INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
  VALUES
    (7, "Deodorant", "Hygiene", 7, 550);

  INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
  VALUES
    (8, "Skii blades", "Recreation", 175, 1500);

  INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
  VALUES
    (9, "Contact Case", "Vision", 150, 3000);

  INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
  VALUES
    (10, "Bath Towels", "Home", 35, 3500);


-- ### Alternative way to insert more than one row
-- INSERT INTO products (flavor, price, quantity)
-- VALUES ("vanilla", 2.50, 100), ("chocolate", 3.10, 120), ("strawberry", 3.25, 75);
