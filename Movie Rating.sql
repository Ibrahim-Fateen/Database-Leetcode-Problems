-- Write your PostgreSQL query statement below
(
    SELECT u.name AS results FROM Users u JOIN MovieRating mr ON mr.user_id = u.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name
    LIMIT 1
)
UNION ALL
(
    SELECT m.title AS results FROM Movies m JOIN MovieRating mr ON mr.movie_id = m.movie_id
    WHERE TO_CHAR(mr.created_at, 'YYYY-MM') = '2020-02'
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title
    LIMIT 1
);