SELECT category_name, product_name, list_price FROM categories JOIN products ON categories.category_id = products.category_id
ORDER BY category_name, product_name asc;

SELECT first_name, last_name, line1,  city, state, zipCode
FROM customers JOIN addresses 
	ON customers.customer_id = addresses.customer_id
WHERE email_address = 'allan.sherwood@yahoo.com';

SELECT first_name, last_name, line1,  city, state, zipCode
FROM customers JOIN addresses 
	ON customers.customer_id = addresses.customer_id
    WHERE shipping_address_id = billing_address_id;


SELECT last_name, first_name, order_date, product_name, item_price, discount_amount, quantity
FROM customers as cust JOIN orders as o ON cust.customer_id = o.customer_id 
JOIN order_items as oi ON oi.order_id = o.order_id
JOIN products as p ON p.product_id = oi.product_id
ORDER BY last_name, order_date, product_name;


SELECT p1.product_name, p1.list_price
FROM products AS p1 
JOIN products AS p2 ON p1.product_id <> p2.product_id
	AND p1.list_price = p2.list_price
ORDER BY product_name;

SELECT category_name
	, product_id
FROM categories LEFT
	JOIN products ON categories.category_id = products.product_id
WHERE product_id IS NULL;

SELECT 'SHIPPED' AS shipment_status, order_id, order_date FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT 'NOT SHIPPED', order_id, order_date FROM orders
WHERE ship_date IS NULL ORDER BY order_date;




