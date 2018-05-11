CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
item_id int NOT NULL,
product_name varchar(50) NOT NULL,
department_name varchar(50) NOT NULL,
price DECIMAL(4,2) NOT NULL,
stock_quantity int NOT NULL);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1111, 'Erasable Markers', 'Office Supplies', 24.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1112, 'Bulk Pickled Beets', 'Fantasy Football', 29.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1113, 'Magnetic Dish Soap', 'Fantasy Football', 15.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1114, 'Bermuda Shorts', 'Telephonic Harmonics', 110.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1115,'Soylent Green', 'Candy', 139.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1116, 'Soylent Blue', 'Candy', 139.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1117, 'Soylent Purple', 'Candy', 139.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1118, 'Soylent Red', 'Candy', 139.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1119, 'Soylent Orange', 'Candy', 139.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1120, 'Fake Armpit Hair Wig', 'Costume Jewelry', 25.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1121, 'New Laptop Computer', 'Nice-To-Have', 21.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1122, 'Lifetime Supply of Chocolate Covered Crickets', 'Stapes', 49.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1123, 'Mutant Barbie Dolls', 'Toys', 25.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) 
VALUES (1124, 'Squirrel Translator', 'Home Office', 59.99, 100);

USE bamazon;
CREATE TABLE departments(
department_id int AUTO_INCREMENT,
PRIMARY KEY(department_id),
department_name varchar(50) NOT NULL,
overhead DECIMAL(11,2) NOT NULL,
total_sales DECIMAL(11,2) NOT NULL);


INSERT INTO departments (department_name, overhead, total_sales) 
VALUES ('Costume Jewelry', 20, 0);

INSERT INTO departments (department_name, overhead, total_sales) 
VALUES ('Fantasy Football', 200000, 0);

INSERT INTO departments (department_name, overhead, total_sales) 
VALUES ('Office Supplies', 10000, 0);

INSERT INTO departments (department_name, overhead, total_sales) 
VALUES ('Telephonic Harmonics', 500, 0);
 
INSERT INTO departments (department_name, overhead, total_sales) 
VALUES ('Nice-To-Have', 2000, 0);

INSERT INTO departments (department_name, overhead, total_sales) 
VALUES ('Stapes', 20000, 0);

INSERT INTO departments (department_name, overhead, total_sales) 
VALUES ('Candy', 15000, 0);

INSERT INTO departments (department_name, overhead, total_sales) 
VALUES ('Toys', 50000, 0);

INSERT INTO departments (department_name, overhead, total_sales) 
VALUES ('Home Office', 25000, 0);


-- This creates the alias table total_profits that will exist only when requested by the executive 
SHOW TABLES;
CREATE VIEW bamazon.total_profits AS SELECT department_id, department_name, overhead, total_sales, total_sales-overhead AS total_profit FROM departments;
