-- Write your PostgreSQL query statement below
SELECT ROUND(SUM(i1.tiv_2016)::numeric, 2) AS tiv_2016 FROM Insurance i1
WHERE i1.tiv_2015 IN (SELECT i2.tiv_2015 FROM Insurance i2 WHERE i2.pid <> i1.pid)
  AND CAST(i1.lat AS VARCHAR) || CAST(i1.lon AS VARCHAR) NOT IN (
    SELECT CAST(i3.lat AS VARCHAR) || CAST(i3.lon AS VARCHAR) FROM Insurance i3
    WHERE i1.pid <> i3.pid
);