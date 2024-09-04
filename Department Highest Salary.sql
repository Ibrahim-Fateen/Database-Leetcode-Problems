-- Write your PostgreSQL query statement below
SELECT d.name Department, e.name Employee, e.salary Salary FROM Department d, Employee e
WHERE e.departmentId = d.id AND e.salary >= ALL (
    SELECT e2.salary FROM Employee e2 WHERE e2.departmentId = d.id
);