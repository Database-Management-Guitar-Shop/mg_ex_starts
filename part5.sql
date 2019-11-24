

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
