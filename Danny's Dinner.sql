

--1.	What is the total amount each customer spent at the restaurant?
SELECT s.customer_id,SUM(ISNULL(m.price,0)) AS [total]
FROM casestudy1..sales AS s
Inner Join casestudy1..menu as m
ON s.product_id = m.product_id
GROUP BY s.customer_id


--2.	How many day has each customer visited the restaurant?
SELECT s.customer_id, COUNT(s.order_date) AS [visited_time]
FROM casestudy1..sales AS s
GROUP BY s.customer_id

--3.	What was the first item from the menu purchased by each customer?
 SELECT customer_id, order_date, product_name,
  DENSE_RANK() OVER(PARTITION BY s.customer_id
  ORDER BY s.order_date) AS rank
 FROM dbo.sales AS s
 JOIN dbo.menu AS m
  ON s.product_id = m.product_id

--4.	What is the most purchased item on the menu and how many times was it purchased by all customers?