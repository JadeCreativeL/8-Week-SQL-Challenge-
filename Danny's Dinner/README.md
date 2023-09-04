# Case Study #1: Danny's Diner

<img src="https://github.com/JadeCreativeL/image-/blob/main/1.png" width="500" height="500">

## Table of content

* [Business problem](https://github.com/JadeCreativeL/8-Week-SQL-Challenge-/blob/main/Danny's%20Dinner/README.md#business-problem)
* [Entity Relationship Diagram](https://github.com/JadeCreativeL/8-Week-SQL-Challenge-/blob/main/Danny's%20Dinner/README.md#entity-relationship-diagram)
* [Question and Answer](https://github.com/JadeCreativeL/8-Week-SQL-Challenge-/blob/main/Danny's%20Dinner/README.md#question-and-answer)
* [APPENDIX](https://github.com/JadeCreativeL/8-Week-SQL-Challenge-/blob/main/Danny's%20Dinner/README.md#appendix)

### Business problem

Danny needs assistance to help the restaurant stay afloat by using data to help him run the business. He wants to identify his customer visiting patterns, how much money they've spent, and which menu items are their favorite.

### Entity Relationship Diagram

<img src="https://github.com/JadeCreativeL/image-/blob/main/relate table.png" width="700" height="500">

### Question and Answer
I used Microsoft SQL Server to answer the questions below. If you want to find the code, they are in APPENDIX below 

#### Q1. What is the total amount each customer spent at the restaurant?
|   | customer_id | total |
|---| ----------- | ----- |
| 1 | A           | 76    |
| 2 | B           | 74    |
| 3 | C           | 36    |

- Customer A spent $76
- Customer B spent $74
- Customer C spent $36

#### Q2. How many days has each customer visited the restaurant?

- Customer A visited 4 times
- Customer B visited 6 times
- Customer C visited 2 times 
#### Q3. What was the first item from the menu purchased by each customer?

- Customer A purchased both curry and sushi for the first time.
- Customer B's first order is curry
- Customer C's first order is ramen
#### Q4. What is the most purchased item on the menu and how many times was it purchased by all customers?

#### Q5. Which item was the most popular for each customer?

#### Q6. Which item was purchased first by the customer after they became a member?

#### Q7. Which item was purchased just before the customer became a member?

#### Q8. What is the total items and amount spent for each member before they became a member?

#### Q9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

#### Q10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - How many points do customers A and B have at the end of January?

### APPENDIX
#### Q1
```sql
SELECT s.customer_id,SUM(ISNULL(m.price,0)) AS [total]
FROM casestudy1..sales AS s
Inner Join casestudy1..menu as m
ON s.product_id = m.product_id
GROUP BY s.customer_id
```
#### Q2
```sql
SELECT s.customer_id, COUNT(s.order_date) AS [visited_time]
FROM casestudy1..sales AS s
GROUP BY s.customer_id
```
#### Q3
```sql
SELECT customer_id, order_date, product_name,
  DENSE_RANK() OVER(PARTITION BY s.customer_id
  ORDER BY s.order_date) AS rank
 FROM dbo.sales AS s
 JOIN dbo.menu AS m
  ON s.product_id = m.product_id
```
