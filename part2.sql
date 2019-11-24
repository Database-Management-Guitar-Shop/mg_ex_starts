SELECT product_code, product_name, list_price, discount_percent FROM products ORDER BY list_price desc;

SELECT CONCAT(last_name,',',first_name) full_name
FROM customers WHERE last_name between 'M%' and 'Z%' ORDER BY last_name ASC;

SELECT product_name, list_price, date_added FROM products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

SELECT product_name, list_price, discount_percent, 
ROUND((list_price * discount_percent * 0.01), 2) discount_amount, 
ROUND((list_price - (list_price * discount_percent *0.01)), 2) 
as discount_price
FROM products 
ORDER BY discount_price DESC
LIMIT 5;

SELECT item_id, item_price, discount_amount, quantity, (item_price*quantity) as price_total,
discount_amount * quantity as discount_total,
(item_price - discount_amount)* quantity as item_total
FROM order_items
WHERE (item_price - discount_amount)* quantity > 500
ORDER BY item_total DESC;

SELECT order_id, order_date, ship_date
FROM orders WHERE ship_date IS NULL;

SELECT NOW() AS today_unformatted, DATE_FORMAT(NOW(), '%d %b %Y') AS today_formatted;

SELECT 100 AS Price, 0.07 AS TaxRate, 100 * 0.07 AS TaxAmount, (100) + (100 * 0.07) AS Total;