-- Write your PostgreSQL query statement below
-- SELECT DISTINCT s1.id, s1.visit_date, s1.people FROM Stadium s1, Stadium s2, Stadium s3
-- WHERE s1.people >= 100 AND s2.people >= 100 AND s3.people >= 100
-- AND (
--     (s2.id = s1.id + 1 AND s3.id = s1.id + 2)
--     OR (s2.id = s1.id - 1 AND s3.id = s1.id + 1)
--     OR (s2.id = s1.id - 2 AND s3.id = s1.id -1)
-- )
-- ORDER BY s1.visit_date;

with q1 as (
    select *, id - row_number() over() as id_diff
    from stadium
    where people > 99
) -- gaps create a 1 difference between id and row_number(), and rows sharing the same id_diff
-- are consecutive.
select id, visit_date, people
from q1
where id_diff in (select id_diff from q1 group by id_diff having count(*) > 2)
order by visit_date;

