# Case Study #1: Danny's Diner

<img src="https://github.com/JadeCreativeL/image-/blob/main/1.png" width="500" height="500">

## Table of content

* [Business problem](https://github.com/JadeCreativeL/8-Week-SQL-Challenge-/blob/main/Danny's%20Dinner/README.md#business-problem)
* [Entity Relationship Diagram](https://github.com/JadeCreativeL/8-Week-SQL-Challenge-/blob/main/Danny's%20Dinner/README.md#entity-relationship-diagram)
* [Question and Answer](https://github.com/JadeCreativeL/8-Week-SQL-Challenge-/blob/main/Danny's%20Dinner/README.md#question-and-answer)
* APPENDIX

### Business problem

Danny needs assistance to help the restaurant stay afloat by using data to help him run the business. He wants to identify his customer visiting patterns, how much money they've spent, and which menu items are their favorite.

### Entity Relationship Diagram

<img src="https://github.com/JadeCreativeL/image-/blob/main/relate table.png" width="700" height="500">

### Question and Answer
I used Microsoft SQL Server to answer the questions below. If you want to find the code, they are in APPENDIX below 

#### 1. What is the total amount each customer spent at the restaurant?

#### Answer: 

- Customer A spent $76
- Customer B spent $74
- Customer C spent $36

#### 2. How many days has each customer visited the restaurant?


#### 3. What was the first item from the menu purchased by each customer?

#### 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

#### 5. Which item was the most popular for each customer?

#### 6. Which item was purchased first by the customer after they became a member?

#### 7. Which item was purchased just before the customer became a member?

#### 8. What is the total items and amount spent for each member before they became a member?

#### 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

#### 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - How many points do customers A and B have at the end of January?

### APPENDIX
```sql
SELECT s.customer_id,SUM(ISNULL(m.price,0)) AS [total]
FROM casestudy1..sales AS s
Inner Join casestudy1..menu as m
ON s.product_id = m.product_id
GROUP BY s.customer_id
```

