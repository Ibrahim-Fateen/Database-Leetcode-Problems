-- Write your PostgreSQL query statement below
SELECT mgr.name FROM Employee mgr
                         JOIN Employee e ON mgr.id = e.managerId
Group By mgr.id, mgr.name
HAVING COUNT(mgr.id) > 4;