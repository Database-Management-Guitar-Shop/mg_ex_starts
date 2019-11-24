SELECT last_name, first_name, order_date, product_name, item_price, discount_amount, quantity
FROM customers as cust JOIN orders as o ON cust.customer_id = o.customer_id 
JOIN order_items as oi ON oi.order_id = o.order_id
JOIN products as p ON p.product_id = oi.product_id
ORDER BY last_name, order_date, product_name;