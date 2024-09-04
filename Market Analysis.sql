-- Write your PostgreSQL query statement below
SELECT u.user_id AS buyer_id, u.join_date AS join_date, (
    COUNT(*)
    ) AS orders_in_2019
FROM Users u LEFT OUTER JOIN Orders o ON u.user_id = o.buyer_id
WHERE EXTRACT(Year FROM order_date) = '2019'
GROUP BY u.user_id, u.join_date;