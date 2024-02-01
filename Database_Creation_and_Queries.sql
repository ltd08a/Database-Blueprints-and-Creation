CREATE SCHEMA IF NOT EXISTS juanty_coffee_co;

CREATE TABLE IF NOT EXISTS coffee_shop (
shop_id 			INT PRIMARY KEY,
shop_name 			VARCHAR(50),
city				VARCHAR(50),
state				CHAR(2));

CREATE TABLE IF NOT EXISTS employee (
employee_id 		INT PRIMARY KEY,
first_name			VARCHAR(30),
last_name			VARCHAR(30),
hire_date			DATE,
job_title 			VARCHAR(30),
shop_id				INT,
FOREIGN KEY(shop_id) REFERENCES coffee_shop(shop_id));

CREATE TABLE IF NOT EXISTS supplier (
supplier_id			INT PRIMARY KEY,
company_name		VARCHAR(50),
country 			VARCHAR(30),
sales_contact_name	VARCHAR(60),
email				VARCHAR(50) NOT NULL);

CREATE TABLE IF NOT EXISTS coffee (
coffee_id			INT PRIMARY KEY,
shop_id				INT,
supplier_id			INT,
coffee_name			VARCHAR(30),
price_per_pound		NUMERIC(5,2),
FOREIGN KEY(shop_id) REFERENCES coffee_shop(shop_id),
FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id));

INSERT INTO coffee_shop (shop_id, shop_name, city, state)
VALUES (0001, 'Crater Coffee', 'Houston', 'TX'),
(0002, 'Dunk on em Donuts', 'Houston', 'TX'),
(0003, 'Clutch City Brew', 'Houston', 'TX');

INSERT INTO employee (employee_id, first_name, last_name, hire_date, job_title, shop_id)
VALUES (001, 'Ronald', 'McDonald', '2017-06-15', 'General Manager', 0002),
(002, 'Dennis', 'Rodman', '2018-09-23', 'Brew Master', 0001),
(003, 'Thor', 'Odinson', '2019-08-30', 'Strongest Avenger', 0003);

INSERT INTO supplier (supplier_id, company_name, country, sales_contact_name, email)
VALUES (4050, 'World''s Best Beans', 'Spain', 'Ricky Rubio', 'slickrick89@aol.com'),
(6095, 'Coffee is US', 'United States of America', 'Brittney Griner', 'withuinspirit1999@hotmail.com'),
(2309, 'Asgardian Blends', 'New Asgard', 'Valkyrie', 'imissmysisters@yahoo.com');

INSERT INTO coffee (coffee_id, shop_id, supplier_id, coffee_name, price_per_pound)
VALUES (9999, 0003, 2309, 'Loki: Mischeviously Good', 19.99),
(0123, 0002, 4050, 'Run With The Bulls', 19.98),
(4563, 0001, 6095, 'Free Brittney', 18.59);

CREATE VIEW EmployeeView
AS SELECT employee_id, CONCAT(first_name, ' ', last_name) AS 'employee_full_name', hire_date, job_title, shop_id
FROM employee;

CREATE INDEX CoffeeNameIndex
ON coffee(coffee_name);

SELECT company_name
FROM supplier
WHERE supplier_id > 4000;

SELECT cs.shop_name, c.coffee_name, s.company_name
FROM coffee_shop AS cs
LEFT JOIN coffee AS c
ON cs.shop_id = c.shop_id
LEFT JOIN supplier AS s
ON c.supplier_id = s.supplier_id;

