WITH customersFirstOrders AS (
    SELECT * FROM DELEVERIES d
    WHERE d.order_date = (
        SELECT MIN(d2.order_date) FROM DELIVERIES d2
        WHERE d2.customer_id = d.customer_id
    )
) SELECT (
    ROUND(COUNT(
        CASE
            WHEN order_date = customer_pref_delivery_date THEN 1
        END
    ) * 100.0 / COUNT(*), 2)
) AS immediate_percentage FROM customersFirstOrders;