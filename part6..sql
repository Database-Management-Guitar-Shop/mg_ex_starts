SELECT DISTINCT category_name FROM categories as c where c.category_id 
in (select p.category_id from products as p)order by category_name;

SELECT product_name, list_price FROM 
products WHERE list_price > (SELECT AVG(p.list_price) FROM products AS p) ORDER BY list_price;

SELECT category_name FROM categories AS c WHERE
NOT EXISTS
(SELECT 1 FROM products AS p
WHERE p.category_id = c.category_id);

SELECT email_address, MAX(order_cost) AS largest_order 
FROM customers AS c INNER JOIN orders AS o ON c.customer_id = o.customer_id
JOIN
(SELECT o.order_id, (oi.item_price * quantity) as order_cost
FROM orders AS o, order_items AS oi WHERE oi.order_id = o.order_id)
largest ON largest.order_id = o.order_id GROUP BY c.email_address;

SELECT p1.product_name, p1.discount_percent FROM products 
AS p1 WHERE p1.discount_percent NOT IN(SELECT p2.discount_percent FROM products 
AS p2 WHERE p1.product_name <> p2.product_name) ORDER BY product_name;


SELECT email_address, order_id, order_date FROM customers as c1 NATURAL JOIN orders
WHERE order_date = (SELECT min(order_date) FROM orders as o1 WHERE c1.customer_id = o1.customer_id)
ORDER BY order_date, order_id;