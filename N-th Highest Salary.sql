CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
    RETURN QUERY (
        -- Write your PostgreSQL query statement below.
        SELECT e.salary
        FROM (
                 SELECT a.salary,
                        DENSE_RANK() OVER (ORDER BY a.salary DESC) AS ranked
                 FROM Employee a
             ) e
        WHERE e.ranked = N
        LIMIT 1
    );
END;
$$ LANGUAGE plpgsql;