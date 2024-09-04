-- Write your PostgreSQL query statement below
SELECT s1.product_id, s1.year AS first_year, s1.quantity, s1.price FROM SALES s1
WHERE (s1.product_id, s1.year) = (
    SELECT s2.product_id, s2.year FROM SALES s2
    WHERE s2.product_id = s1.product_id
    ORDER BY s2.year ASC LIMIT 1
); -- WRONG ANSWER :O
