SELECT c.customer_id FROM Customer c
WHERE NOT EXISTS(
    SELECT * FROM Product p
    WHERE p.product_key NOT IN (
        SELECT c2.product_key FROM Customer c2
        WHERE c2.customer_id = c.customer_id
    )
); -- Typical Divide operation
-- Slow, but correct

SELECT customer_id FROM Customer GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product);