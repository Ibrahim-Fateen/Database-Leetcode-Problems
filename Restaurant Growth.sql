-- Write your PostgreSQL query statement below
WITH first_visit AS (
    SELECT MIN(visited_on) AS first_visited_on FROM Customer
)
SELECT DISTINCT c1.visited_on,
    SUM(c2.amount) AS amount,
    ROUND(SUM(c2.amount) / 7.0, 2) AS average_amount
FROM Customer c1
JOIN Customer c2
    ON c2.visited_on <= c1.visited_on
    AND c2.visited_ON + INTERVAL '1 week' > c1.visited_on
WHERE c1.visited_on >= (SELECT first_visited_on + INTERVAL '6 DAY' FROM first_visit)
GROUP BY c1.visited_on, c1.customer_id
ORDER BY c1.visited_on; -- HEHE