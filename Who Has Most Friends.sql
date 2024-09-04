-- Write your PostgreSQL query statement below
WITH ids AS (
    (SELECT r.requester_id AS id FROM RequestAccepted r)
    UNION
    (SELECT r.accepter_id AS id FROM RequestAccepted r)
), nums AS (
    SELECT i.id AS id, COUNT(
            CASE
                WHEN r.requester_id = id THEN 1
                WHEN r.accepter_id = id THEN 1
                END
                       ) AS num FROM ids i, RequestAccepted r
    GROUP BY i.id
)
SELECT n.id, n.num FROM nums n
WHERE n.num >= ALL (SELECT n2.num FROM nums n2); -- works even if there are multiple people with the maximum number of friends :)
-- could've use union all to get the occurences of each id in the table, then get the maximum ocurrnces.