SELECT COUNT(order_id) as order_count,
SUM(tax_amount) AS tax_total FROM orders;

SELECT category_name, COUNT(*) AS count_of_product,
MAX(list_price) AS most_expensive_products
FROM categories as c JOIN products as p
ON c.category_id= p.category_id
GROUP BY category_name
ORDER BY count_of_product DESC;

SELECT  SUM(item_price * quantity) AS total_prices, email_address, 
SUM(discount_amount * quantity) AS total_discounted
FROM Customers c
JOIN orders as o ON c.customer_id = o.customer_id
JOIN order_items as oi ON o.order_id = oi.order_id
GROUP BY email_address
ORDER BY total_prices DESC;

SELECT COUNT(o.order_id) AS order_count,
SUM((item_price - discount_amount) * quantity) AS order_total, email_address
FROM customers as c
JOIN orders as o ON c.customer_id = o.customer_id
JOIN order_items as oi ON o.order_id = oi.order_id
GROUP BY email_address
ORDER BY order_total DESC;

SELECT COUNT(o.order_id) AS order_count,
SUM((item_price - discount_amount) * quantity) AS order_total, email_address
FROM customers as c
JOIN orders as o ON c.customer_id = o.customer_id
JOIN order_items as oi ON o.order_id = oi.order_id
WHERE item_price > 400
GROUP BY email_address
ORDER BY order_total DESC;

SELECT p.product_name,  SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS total_product
FROM products as p
JOIN order_items as oi ON p.product_id = oi.product_id
GROUP BY product_name WITH ROLLUP;

SELECT email_address, COUNT(DISTINCT oi.product_id) AS count_product
FROM customers as c
JOIN orders as o ON c.customer_id = o.customer_id
JOIN order_items as oi ON o.order_id = oi.order_id
GROUP BY email_address
HAVING COUNT(DISTINCT oi.product_id) > 1
ORDER BY email_address ASC;

SELECT category_name, product_name, COUNT(quantity) as total_count
FROM  products as p 
JOIN order_items as oi ON p.product_id = oi.product_id
JOIN categories as c ON c.category_id = p.category_id 
WHERE category_name IS NOT NULL
OR product_name  IS NOT NULL
GROUP BY product_name WITH ROLLUP;

SELECT order_id,  SUM((item_price - discount_amount) * quantity) as totalamount, SUM(Quantity) OVER (ORDER BY order_id)as total_amount_of_orders 
FROM order_items 
GROUP BY order_id;


SELECT category_name, product_name, COUNT(quantity) OVER() as total_count
FROM  products as p 
JOIN order_items as oi ON p.product_id = oi.product_id
JOIN categories as c ON c.category_id = p.category_id 
WHERE category_name IS NOT NULL
OR product_name  IS NOT NULL;


SELECT o.customer_id, o.order_date, SUM(oi.item_price), SUM(oi.quantity) 
OVER (partition by c.customer_id), SUM(oi.quantity) OVER (order by o.order_date)
FROM order_items as o JOIN orders as o ON o.order_id = oi.order_id
JOIN products as p ON p.customer_id = o.customer_id;
