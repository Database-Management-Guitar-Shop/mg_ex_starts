INSERT INTO categories (category_name) VALUES (‘Brass’);

UPDATE categories SET category_name = 'Woodwinds' WHERE category_id = 2;

SELECT * FROM categories;

DELETE FROM categories WHERE category_id = 2;

INSERT INTO products (category_id, product_code, product_name, description, list_price,
discount_percent, date_added) VALUES (4, 'dgx_640','Yamaha DGX 640 88-Key Digital Piano',
 'Long description to come.',799.99,0,CURRENT_TIMESTAMP);
 
 SELECT * FROM products;

UPDATE products SET discount_percent = '35' WHERE product_id = 11;

SELECT * FROM categories;
DELETE FROM products where category_id = 4;
 DELETE FROM categories where category_id = 4;
 
 INSERT INTO customers (email_address, password, first_name, last_name) VALUES ('rick@raven.com', '', 'Rick', 'Raven');

UPDATE customers SET password = 'secret' WHERE email_address = 'rick@raven.com';

UPDATE customers SET password = 'reset';