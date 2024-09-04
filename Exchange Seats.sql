-- Write your PostgreSQL query statement below
SELECT s1.id,
       CASE
           WHEN s1.id % 2 = 1 THEN (
               CASE
                   WHEN (SELECT s2.student FROM Seat s2 WHERE s2.id = s1.id + 1) IS NULL THEN s1.student -- can use COALESCE(LEAD() OVER ())
                   ELSE
                       (SELECT s2.student FROM Seat s2 WHERE s2.id = s1.id + 1)
                   END
               )
           ELSE (
               (SELECT s2.student FROM Seat s2 WHERE s2.id = s1.id - 1) -- can use LAG () OVER ()
           )
           END AS student
FROM Seat s1;