-- Write your PostgreSQL query statement below
SELECT d.name Department, e.name Employee, Salary
FROM Department d, Employee e
WHERE e.departmentId = d.id AND e.salary IN (
    SELECT DISTINCT e2.salary FROM Employee e2
    WHERE e2.departmentId = d.id
    ORDER BY e2.salary DESC
    LIMIT 3
);
