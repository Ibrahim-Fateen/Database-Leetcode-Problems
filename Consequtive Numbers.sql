-- Write your PostgreSQL query statement below
SELECT DISTINCT l1.num ConsecutiveNums FROM Logs l1, Logs l2, Logs l3
WHERE l2.id = l1.id + 1 AND l2.num = l1.num
  AND l3.id = l1.id + 2 AND l3.num = l1.num;