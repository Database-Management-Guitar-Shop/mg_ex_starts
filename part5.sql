SELECT COUNT(order_id) as order_count,
SUM(tax_amount) AS tax_total FROM orders;

SELECT category_name, COUNT(*) AS count_of_product,
MAX(list_price) AS most_expensive_products
FROM categories as c JOIN products as p
ON c.category_id= p.category_id
GROUP BY category_name
ORDER BY count_of_product DESC;

