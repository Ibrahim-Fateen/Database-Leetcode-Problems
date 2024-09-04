with prices_before_date AS (
    SELECT * FROM Products p
    WHERE p.change_date <= '2019-08-16'
) SELECT DISTINCT p.product_id, (
    COALESCE((
        SELECT pbd.new_price FROM prices_before_date pbd
        WHERE pbd.product_id = p.product_id
        ORDER BY pbd.change_date DESC LIMIT 1
    ), 10)
) AS price FROM Products p;