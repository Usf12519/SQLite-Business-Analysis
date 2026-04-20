-- TASK 1 - Top 5 Customers by Total Spend

SELECT 
  c.first_name, 
  c.last_name,
  ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent
FROM customers c
JOIN orders o 
  ON o.customer_id = c.id
JOIN order_items oi 
  ON oi.order_id = o.id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;


-- TASK 2 — Total Revenue by Product Category

SELECT 
  p.category,
  ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM order_items oi
JOIN products p 
  ON oi.product_id = p.id
JOIN orders o
  ON oi.order_id = o.id
GROUP BY p.category
ORDER BY revenue DESC;


-- TASK 3 — Employees Earning Above Their Department Average

SELECT 
  e.first_name,
  e.last_name,
  d.name AS department_name,
  e.salary AS employee_salary,
  ROUND(AVG(e2.salary), 2) AS department_average
FROM employees e
JOIN departments d 
  ON e.department_id = d.id
JOIN employees e2 
  ON e.department_id = e2.department_id
GROUP BY e.id
HAVING e.salary > AVG(e2.salary)
ORDER BY d.name, e.salary DESC;


-- TASK 4 — Cities with the Most Loyal Customers

SELECT
  city,
  COUNT(*) AS gold_customer_count
FROM customers
WHERE loyalty_level = 'Gold'
GROUP BY city
ORDER BY gold_customer_count DESC, city ASC;






