WITH q1 AS (
    SELECT * FROM Queue
    ORDER BY Turn
), q2 AS (

)
SELECT person_name FROM q2
ORDER BY Turn DESC LIMIT 1;

-- stomped
-- solution below

SELECT
    q1.person_name
FROM Queue q1 JOIN Queue q2 ON q1.turn >= q2.turn -- joining with all previous turns, WHOA!
GROUP BY q1.turn, q1.person_name
HAVING SUM(q2.weight) <= 1000
ORDER BY SUM(q2.weight) DESC
LIMIT 1;