CREATE DATABASE Bamazon;

use Bamazon;

CREATE TABLE products (
	id INTEGER AUTO_INCREMENT NOT NULL,
	product_name VARCHAR(100),
	department_name VARCHAR(100),
    price INTEGER, 
    stock_quantity INTEGER, 
    PRIMARY KEY (id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("Elta MD Foaming Facial Cleanser", "Cleanser", 25, 2000);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("IS Clinical Cleansing Complex", "Cleanser", 40, 2100);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("SkinMedica AHA/BHA Exfoliating Cleanser", "Cleanser", 47, 2000);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("Replentix Clarifying Brightening Polish", "Cleanser", 42, 2500);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("SkinCeuticals Emolience", "Moisturizer", 62, 2000);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("SkinCeuticals Renew Overnight-Combination/Oily", "Moisturizer", 61, 2500);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("Alastin Restorative Skin Complex", "Serum", 195, 2200);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("Revision Multi-Protection Broad Spectrum SPF 50", "Sunscreen", 54, 2000);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("Tend Skin Liquid", "Grooming", 50, 550);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("Japonesque Skin Clear Skin Tool", "Tools", 14, 350);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("Herbivore Botanicals Coco Rose Coconut Oil Body Polish", "Shower", 36, 600);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("Leonor Greyl Masque Quintessence", "Hair Care", 145, 700);

SELECT * FROM  products;

SELECT products.id FROM products WHERE products.id = 1


UPDATE products SET products.stock_quantity = 500 WHERE products.id = 1
