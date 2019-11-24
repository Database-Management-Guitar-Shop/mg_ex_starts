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
