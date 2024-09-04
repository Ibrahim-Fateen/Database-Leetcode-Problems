-- Write your PostgreSQL query statement below
SELECT t.request_at AS "Day", CAST((CAST(COUNT(
        CASE
            WHEN t.status = 'cancelled_by_driver'
                THEN 1
            WHEN t.status =  'cancelled_by_client'
                THEN 1
            END
                                         ) AS DECIMAL) / COUNT(*)) AS DECIMAL(3, 2)) AS "Cancellation Rate" FROM Trips t, Users c, Users d
WHERE (t.request_at BETWEEN '2013-10-01' AND '2013-10-03') AND t.client_id = c.users_id AND t.driver_id = d.users_id
  AND c.banned = 'No' AND d.banned = 'No'
GROUP BY "Day";